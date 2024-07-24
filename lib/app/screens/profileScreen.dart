import 'package:blog_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog_app/features/blog/providers/blog_repo_provider.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:blog_app/features/auth/presentation/view/login_view.dart';
import 'package:blog_app/app/contants/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  String _email = '';
  String _name = 'John Doe'; // Placeholder for user's name

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? 'Not available';
    setState(() {
      _email = email;
    });
  }

  Future<void> _deletePost(String postId) async {
    try {
      await ref.read(deleteBlogPostUseCaseProvider).repository.deleteBlogPost(postId); // Call your delete function
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post deleted successfully')),
      );
      // Refresh the blog posts
      ref.refresh(blogPostsProvider);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete post: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final blogPostsAsyncValue = ref.watch(blogPostsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const CircleAvatar(
            //   radius: 50,
            //   backgroundImage: NetworkImage(
            //     'https://via.placeholder.com/150',
            //   ),
            // ),
            // const SizedBox(height: 20),
            Text(
              _email, // User's email
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            blogPostsAsyncValue.when(
              data: (eitherResult) {
                final filteredBlogs = eitherResult.fold(
                  (failure) => [],
                  (blogs) => blogs.where((blog) => blog.username == _email).toList(),
                );

                return filteredBlogs.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredBlogs.length,
                        itemBuilder: (context, index) {
                          final blog = filteredBlogs[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              leading: blog.photo != null
                                  ? Image.network(
                                      "${ApiEndPoints.imageUrl}${blog.photo!}",
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    )
                                  : const Icon(Icons.image, size: 50),
                              title: Text(
                                blog.title,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(blog.desc),
                              isThreeLine: true,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditBlogView(blog: blog),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      _deletePost(blog.id!); // Assuming `id` is the identifier
                                    },
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlogDetailView(blog: blog),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )
                    : const Text('No blogs found');
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}


class EditBlogView extends ConsumerStatefulWidget {
  final BlogPostModel blog;

  const EditBlogView({super.key, required this.blog});

  @override
  _EditBlogViewState createState() => _EditBlogViewState();
}

class _EditBlogViewState extends ConsumerState<EditBlogView> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.blog.title);
    _descController = TextEditingController(text: widget.blog.desc);
  }

  Future<void> _updatePost() async {
    final updatedPost = BlogPostModel(
      username: "Liban",
      userId: "1",
      categories: widget.blog.categories,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      id: widget.blog.id,
      title: _titleController.text,
      desc: _descController.text,
      // Include other necessary fields
    );

    try {
      await ref.read(updateBlogPostUseCaseProvider).repository.updateBlogPost(updatedPost);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update post: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updatePost,
              child: const Text('Update Post'),
            ),
          ],
        ),
      ),
    );
  }
}
