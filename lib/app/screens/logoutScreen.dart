// import 'package:flutter/material.dart';

// class LogoutScreen extends StatelessWidget {
//   const LogoutScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Logout'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.logout,
//               size: 100,
//               color: Colors.blue,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Are you sure you want to log out?',
//               style: TextStyle(fontSize: 20),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logout functionality
//                 Navigator.of(context).pop(); // Return to previous screen
//               },
//               child: Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
