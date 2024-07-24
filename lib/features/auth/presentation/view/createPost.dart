// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class CreatePostScreen extends StatefulWidget {
//   const CreatePostScreen({super.key});

//   @override
//   _CreatePostScreenState createState() => _CreatePostScreenState();
// }

// class _CreatePostScreenState extends State<CreatePostScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _contentController = TextEditingController();
//   File? _image;

//   Future<void> _pickImage() async {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _image = File(pickedImage.path);
//       });
//     }
//   }

//   void _showSnackbar(BuildContext context, String message) {
//     final snackbar = SnackBar(
//       content: Text(message),
//       duration: const Duration(seconds: 3),
//     );

//     ScaffoldMessenger.of(context).showSnackBar(snackbar);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Createe Post'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.grey[200],
//                 ),
//                 child: TextFormField(
//                   controller: _titleController,
//                   decoration: const InputDecoration(
//                     labelText: 'Title',
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 16.0),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.grey[200],
//                 ),
//                 child: TextFormField(
//                   controller: _contentController,
//                   decoration: const InputDecoration(
//                     labelText: 'Content',
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 16.0,
//                         vertical: 25.0),
//                     border: InputBorder.none,
//                   ),
//                   maxLines: null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _pickImage,
//                 child: const Text('Pick Image'),
//               ),
//               const SizedBox(height: 20),
//               _image == null
//                   ? const Text('No image selected')
//                   : Image.file(_image!),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   _showSnackbar(context, 'Post Created Successfully');
//                 },
//                 child: const Text('Create Post'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
