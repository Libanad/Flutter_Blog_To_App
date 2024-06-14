// import 'package:flutter/material.dart';

// class UpdatePasswordScreen extends StatefulWidget {
//   const UpdatePasswordScreen({Key? key}) : super(key: key);

//   @override
//   _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
// }

// class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
//   final TextEditingController _currentPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: _currentPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Current Password',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _newPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'New Password',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _confirmPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Confirm New Password',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate and update password logic
//                 // You can add validation and update password logic here
//               },
//               child: Text('Update Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
