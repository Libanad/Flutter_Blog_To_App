import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of tabs
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'), // Replace with your home screen widget
    Text('Search'), // Replace with your search screen widget
    Text('Notifications'), // Replace with your notifications screen widget
    Text('Profile'), // Replace with your profile screen widget
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    // Update the selected index
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                            'Blog 1',
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}