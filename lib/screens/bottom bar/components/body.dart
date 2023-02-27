import 'package:flutter/material.dart';
import 'package:grocery/screens/bottom%20bar/components/bottom_navigations.dart';
import 'package:grocery/screens/cart/cart_screen.dart';
import 'package:grocery/screens/category/categories_screen.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/user/user_profile_screen.dart';

class BodyBottomBarScreen extends StatefulWidget {
  const BodyBottomBarScreen({super.key});

  @override
  State<BodyBottomBarScreen> createState() => _BodyBottomBarScreenState();
}

class _BodyBottomBarScreenState extends State<BodyBottomBarScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = const [
    {"page": HomeScreen(), "title": "Home"},
    {"page": CategoryScreen(), "title": "Category"},
    {"page": CartScreen(), "title": "Cart"},
    {"page": UserProfileScreen(), "title": "User"}
  ];

  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIndex]['title']),
        ),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomBarNavigations(
          press: _selectedScreen,
          selectedIndex: _selectedIndex,
        ));
  }
}
