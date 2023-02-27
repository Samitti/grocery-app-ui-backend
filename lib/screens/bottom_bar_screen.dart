import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/cart_screen.dart';
import 'package:grocery/screens/categories_screen.dart';
import 'package:grocery/screens/home_screen.dart';
import 'package:grocery/screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {


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

     final themeState = Provider.of<DarkThemeProvider>(context);
     bool isDark =  themeState.getDarkTheme;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: isDark ? Colors.white10 : Colors.black26,
        selectedItemColor: isDark ? Colors.lightBlue.shade200 : Colors.black87,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        currentIndex: _selectedIndex,
        onTap: _selectedScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon( _selectedIndex == 0 ? IconlyBold.home :IconlyLight.home) , label: "Home"),
          BottomNavigationBarItem(icon: Icon( _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category) , label: "Category"),
          BottomNavigationBarItem(icon: Icon( _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy) , label: "Cart"),
          BottomNavigationBarItem(icon: Icon( _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2) , label: "User"),
        ],
      ),
    );
  }
}