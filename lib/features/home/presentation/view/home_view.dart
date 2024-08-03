import 'dart:convert';
import 'dart:io';

import 'package:blog_app/app/contants/api_endpoint.dart';
import 'package:blog_app/app/screens/profileScreen.dart';
import 'package:blog_app/app/screens/searchScreen.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:blog_app/features/blog/providers/blog_repo_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;

  Future<void> _addNewBlog(Map<String, String> newBlog) async {
    final createBlogPostUseCase = ref.read(createBlogPostUseCaseProvider);
                final prefs = await SharedPreferences.getInstance();
                    final email = prefs.getString('email') ?? 'Not available';



    final blogPost = BlogPostModel(
      id: '', // Generate or leave empty, should be handled by backend
      title: newBlog['title']!,
      desc: newBlog['content']!,
      photo: newBlog['image'],
      username: email, // Replace with actual username
      userId: 'CurrentUserId', // Replace with actual user ID
      categories: [], // Handle categories as needed
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final result = await createBlogPostUseCase.call(blogPost);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create blog post: ${failure.error}'),
          ),
        );
      },
      (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post created successfully!')),
        );
        // Reload or update the blog posts if needed
      },
    );
  }

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _onWritePostPressed() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreatePostView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final blogPostsAsyncValue = ref.watch(blogPostsProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.create),
              onPressed: _onWritePostPressed,
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            blogPostsAsyncValue.when(
              data: (eitherResult) {
                return eitherResult.fold(
                  (failure) => Center(child: Text('Error: ${failure.error}')),
                  (blogs) => BlogListView(blogs: blogs),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
            const SearchScreen(),
            // NotificationScreen(),
            const ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.purple),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.notification_add),
            //   label: 'Notification',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onBottomNavBarItemTapped,
        ),
      ),
    );
  }
}


class BlogListView extends StatelessWidget {
  final List<BlogPost> blogs;

  const BlogListView({super.key, required this.blogs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: blog.photo != null
                ?  Image.network(
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
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(blog.desc),
                const SizedBox(height: 4),
                Text(
                  'By: ${blog.username}',
                  style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 2),
                Text(
                  'Categories: ${blog.categories.join(', ')}',
                  style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 2),
                Text(
                  'Published on: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(blog.createdAt))}',
                  style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            isThreeLine: true,
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
    );
  }
}


// Import your BlogPost model



 // Adjust import based on your project structure












class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  _CreatePostViewState createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();
  File? _file;
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _file = File(pickedFile.path);
      }
    });
  }

  Future<void> _handleCreate() async {
    final title = _titleController.text;
    final desc = _descController.text;
    final categories = _categoriesController.text;

    if (title.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? 'Not available';

    final post = {
      'title': title,
      'desc': desc,
      'username': email,
      'userId': 'dummyUserId', // Replace with actual user ID if available
      'categories': categories.split(',').map((e) => e.trim()).toList(),
    };
  print(post);

    try {
     String? imageFileName;
if (_file != null) {
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(
      _file!.path,
      filename: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
    ),
  });

  final response = await _dio.post(
    '${ApiEndPoints.baseUrl}upload',
    data: formData,
    options: Options(
      contentType: 'multipart/form-data',
    ),
  );

  if (response.statusCode == 200) {
    imageFileName = response.data['fileName']; // Adjust based on backend response
  } else {
    throw Exception('Failed to upload image');
  }
}

// Include the image filename in the post data if available
if (imageFileName != null) {
  post['photo'] = imageFileName;
}


      final response = await _dio.post(
        '${ApiEndPoints.baseUrl}posts/create',
        data: post,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post created successfully!')),
        );
        Navigator.pop(context);
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _categoriesController,
                decoration: const InputDecoration(labelText: 'Categories (comma separated)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 16),
              _file == null
                  ? const Text('No image selected')
                  : Image.file(_file!, height: 150),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _handleCreate,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CreatePostView extends ConsumerStatefulWidget {
//   const CreatePostView({super.key});

//   @override
//   _CreatePostViewState createState() => _CreatePostViewState();
// }

// class _CreatePostViewState extends ConsumerState<CreatePostView> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _categoriesController = TextEditingController();
//   File? _image;

//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _initializeHive();
//   }

//   Future<void> _initializeHive() async {
//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocumentDir.path);
//     Hive.registerAdapter(BlogPostHiveModelAdapter()); // Register the adapter
//     await Hive.openBox<BlogPost>('blogBox');
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No image selected')),
//         );
//       }
//     });
//   }

//   Future<void> _onSubmit() async {
//     if (_titleController.text.isEmpty ||
//         _descriptionController.text.isEmpty ||
//         _image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all fields and select an image')),
//       );
//       return;
//     }

//     final prefs = await SharedPreferences.getInstance();
//     final email = prefs.getString('email') ?? 'Not available';

//     final newBlog = BlogPostModel(
//       id: '', // Generate or leave empty, should be handled by backend
//       title: _titleController.text,
//       desc: _descriptionController.text,
//       photo: _image!.path,
//       username: email,
//       userId: 'CurrentUserId', // Replace with actual user ID
//       categories: _categoriesController.text.split(',').map((e) => e.trim()).toList(), // Handle categories as needed
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     );

//     final createBlogPostUseCase = ref.read(createBlogPostUseCaseProvider);

//     final result = await createBlogPostUseCase.call(newBlog);

//     result.fold(
//       (failure) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to create blog post: ${failure.error}'),
//           ),
//         );
//       },
//       (success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Post created successfully!')),
//         );
//         // Clear form fields
//         _titleController.clear();
//         _descriptionController.clear();
//         _categoriesController.clear();
//         setState(() {
//           _image = null;
//         });
//         // Optionally, navigate back or refresh the list
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Post'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               maxLines: 5,
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _categoriesController,
//               decoration: InputDecoration(
//                 labelText: 'Categories (comma separated)',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Pick Image'),
//             ),
//             const SizedBox(height: 20),
//             _image == null
//                 ? const Text('No image selected')
//                 : Image.file(_image!, height: 150),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _onSubmit,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BlogDetailView extends StatefulWidget {
  final BlogPost blog;

  const BlogDetailView({super.key, required this.blog});

  @override
  _BlogDetailViewState createState() => _BlogDetailViewState();
}

class _BlogDetailViewState extends State<BlogDetailView> {
  final TextEditingController _commentController = TextEditingController();
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _fetchComments(); // Fetch comments when the widget is initialized
  }

  Future<void> _fetchComments() async {
    try {
      final response = await http.get(Uri.parse('${ApiEndPoints.baseUrl}comments/post/${widget.blog.id}'));


      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          _comments = data.map((comment) => Comment.fromJson(comment)).toList();
        });
            } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load comments: ${response.statusCode}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching comments: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.blog.photo != null)
              Image.network(
                "${ApiEndPoints.imageUrl}${widget.blog.photo!}",
                fit: BoxFit.cover,
              )
            else
              const Icon(Icons.image, size: 100),
            const SizedBox(height: 20),
            Text(
              widget.blog.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.blog.desc,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'By: ${widget.blog.username}',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Categories: ${widget.blog.categories.join(', ')}',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Published on: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(widget.blog.createdAt))}',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            // Comments Section
            const Text(
              'Comments:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ..._comments.map((comment) => ListTile(
              title: Text(comment.comment),
              subtitle: Text('By: ${comment.author}'),
              trailing: Text(DateFormat('yyyy-MM-dd – kk:mm').format(comment.createdAt)),
            )),
            const SizedBox(height: 20),
            // Comment Input
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Add a comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addComment,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addComment() async {
    final commentText = _commentController.text;
    if (commentText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comment cannot be empty')),
      );
      return;
    }
            final prefs = await SharedPreferences.getInstance();
        final email = prefs.getString('email') ?? 'Not available';


    final newComment = {
      'comment': commentText,
      'aurthor': email,  // Replace with actual username
      'postId': widget.blog.id,
      'userId': '6679a6fba4a38ddf29985f84',    // Replace with actual user ID
    };

    final response = await http.post(
      Uri.parse('${ApiEndPoints.baseUrl}comments/create'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newComment),
    );

    if (response.statusCode == 200) {
      _fetchComments(); // Refresh the list of comments
      _commentController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Posted successfully.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add comment: ${response.statusCode}')),
      );
    }
  }
}

class Comment {
  final String id;
  final String comment;
  final String author;
  final String postId;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.comment,
    required this.author,
    required this.postId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'] as String,
      comment: json['comment'] as String,
      author: json['aurthor'] as String, // Update to 'author' if that is the correct key
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
