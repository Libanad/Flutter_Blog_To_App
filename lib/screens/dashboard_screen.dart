import 'package:blog_app/screens/CreatePostScreen.dart';
import 'package:blog_app/screens/homePageScreen.dart';
import 'package:blog_app/screens/logoutScreen.dart';
import 'package:blog_app/screens/notificationScreen.dart';
import 'package:blog_app/screens/profileScreen.dart';
import 'package:blog_app/screens/searchScreen.dart';
import 'package:blog_app/screens/updatePassword.dart';
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
    HomeScreen(), // Replace with your home screen widget
    SearchScreen(), // Replace with your search screen widget
    NotificationScreen(), // Notification screen widget
    ProfileScreen(), // Replace with your profile screen widget
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
      body: _widgetOptions[_selectedIndex], // Display the selected widget
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
              title: const Text('Create Post'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePostScreen(),));
              },
            ),
            ListTile(
              title: const Text('Update Password'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UpdatePasswordScreen(),));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogoutScreen(),));
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
            backgroundColor: Colors.black,
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


