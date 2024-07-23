// import 'package:blog_app/features/blog/providers/blog_repo_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:blog_app/features/blog/data/model/blog_api_model.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final asyncBlogPosts = ref.watch(blogPostRepositoryProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: asyncBlogPosts.when(
//         data: (blogs) => ListView.builder(
//           padding: const EdgeInsets.all(16.0),
//           itemCount: blogs.length,
//           itemBuilder: (context, index) {
//             final blog = blogs[index];
//             return Card(
//               margin: const EdgeInsets.symmetric(vertical: 8.0),
//               child: ListTile(
//                 leading: blog.photo != null
//                     ? Image.network(
//                         blog.photo!,
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                       )
//                     : const Icon(Icons.image, size: 50),
//                 title: Text(
//                   blog.title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(blog.desc),
//                 onTap: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Clicked on ${blog.title}'),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(child: Text(err.toString())),
//       ),
//     );
//   }
// }
