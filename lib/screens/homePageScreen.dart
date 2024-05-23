import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample blog data
    final List<Map<String, String>> blogs = List.generate(
      10,
      (index) => {
        'title': 'Blog Post ${index + 1}',
        'content': 'This is a brief description of blog post ${index + 1}.',
        'image':'https://letsenhance.io/+${index+1}',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                blog['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(blog['content']!),
              onTap: () {
                // Navigate to blog post details page
                // For now, just show a simple snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Clicked on ${blog['title']}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}