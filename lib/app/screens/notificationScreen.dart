// import 'package:flutter/material.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Sample notifications data
//     final List<String> notifications = List<String>.generate(
//       20,
//       (index) => 'Notification ${index + 1}: This is a sample notification.',
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8.0),
//             child: ListTile(
//               leading: const Icon(Icons.notifications),
//               title: Text(notifications[index]),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
