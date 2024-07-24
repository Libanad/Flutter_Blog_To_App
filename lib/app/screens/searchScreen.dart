import 'package:blog_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:blog_app/features/blog/providers/blog_repo_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<BlogPost> _filteredBlogs = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterBlogs(_searchController.text);
    });
  }

  void _filterBlogs(String query) {
    final blogPostsAsyncValue = ref.read(blogPostsProvider);

    blogPostsAsyncValue.when(
      data: (eitherResult) {
        eitherResult.fold(
          (failure) {
            // Handle failure if needed
          },
          (blogs) {
            final filtered = blogs
                .where((blog) =>
                    blog.title.toLowerCase().contains(query.toLowerCase()) ||
                    blog.desc.toLowerCase().contains(query.toLowerCase()))
                .toList();
            setState(() {
              _filteredBlogs = filtered;
            });
          },
        );
      },
      loading: () {
        // Handle loading state if needed
      },
      error: (error, stackTrace) {
        // Handle error state if needed
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredBlogs.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredBlogs.length,
                      itemBuilder: (context, index) {
                        final blog = _filteredBlogs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: blog.photo != null
                                ? Image.network(
                                    blog.photo!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image, size: 50),
                            title: Text(
                              blog.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(blog.desc),
                            onTap: () {
                              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailView(blog: blog)));
                
                            
                          
                            }));
                      },
                    )
                  : const Center(child: Text('No results found')),
            ),
          ],
        ),
      ),
    );
  }
}
