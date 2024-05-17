import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, User!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Posts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int index = 0; index < 8; index++)
                      Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        color: Colors.grey[200],
                        child: ListTile(
                          title: const Text(
                            'Blog 1', // Change the title to "Blog 1"
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Post content goes here...'),
                          onTap: () {
                            // Navigate to post details page
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'User Profile',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {
                // Navigate to user profile page
              },
            ),
            ListTile(
              title: const Text('Categories'),
              onTap: () {
                // Navigate to categories page
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Perform logout action
              },
            ),
          ],
        ),
      ),
    );
  }
}


