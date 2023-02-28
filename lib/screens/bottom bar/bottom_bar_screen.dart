import 'package:flutter/material.dart';
import 'package:grocery/screens/bottom%20bar/components/bottom_navigations.dart';
import 'package:grocery/screens/cart/cart_screen.dart';
import 'package:grocery/screens/category/categories_screen.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/user/user_profile_screen.dart';

class BottomBarScreen extends StatefulWidget {

  static String routeName = "/bottombar";

  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

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
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomBarNavigations(
        press: _selectedScreen,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}