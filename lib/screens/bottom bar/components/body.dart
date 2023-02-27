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

  final List _pages = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    UserProfileScreen()
  ];


  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomBarNavigations(press: _selectedScreen, selectedIndex: _selectedIndex,)
    );
  }
}


