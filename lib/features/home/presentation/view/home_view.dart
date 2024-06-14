import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
 
  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}
 
class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;
 
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Dashboard')),
    Center(child: Text('Cart')),
    Center(child: Text('My Orders')),
    Center(child: Text('Profile')),
  ];
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.purple),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop_2),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}