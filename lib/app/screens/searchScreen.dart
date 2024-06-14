// import 'package:flutter/material.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<Map<String, String>> _blogs = [];
//   List<Map<String, String>> _filteredBlogs = [];

//   @override
//   void initState() {
//     super.initState();
//     // Initialize sample blog data
//     _blogs = List.generate(
//       10,
//       (index) => {
//         'title': 'Blog Post ${index + 1}',
//         'content': 'This is a brief description of blog post ${index + 1}.',
//       },
//     );
//     _filteredBlogs = _blogs;
//   }

//   void _filterBlogs(String query) {
//     final filtered = _blogs
//         .where((blog) =>
//             blog['title']!.toLowerCase().contains(query.toLowerCase()) ||
//             blog['content']!.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     setState(() {
//       _filteredBlogs = filtered;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 prefixIcon: const Icon(Icons.search),
//               ),
//               onChanged: _filterBlogs,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredBlogs.length,
//                 itemBuilder: (context, index) {
//                   final blog = _filteredBlogs[index];
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: ListTile(
//                       title: Text(
//                         blog['title']!,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(blog['content']!),
//                       onTap: () {
//                         // Navigate to blog post details page
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Clicked on ${blog['title']}'),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }