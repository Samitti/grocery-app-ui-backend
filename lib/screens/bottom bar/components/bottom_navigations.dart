import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBarNavigations extends StatelessWidget {

  final int selectedIndex;
  final Function(int)? press;
  const BottomBarNavigations({super.key, required this.selectedIndex, this.press});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark =  themeState.getDarkTheme;
    final AppDimensions dimensions = AppDimensions(context);

    return BottomNavigationBar(
        unselectedItemColor: isDark ? Colors.white10 : Colors.black26,
        selectedItemColor: isDark ? Colors.lightBlue.shade200 : Colors.black87,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: dimensions.getScreenW(25),
        currentIndex: selectedIndex,
        onTap: press,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(  selectedIndex == 0 ? IconlyBold.home :IconlyLight.home) , label: "Home"),
          BottomNavigationBarItem(icon: Icon(  selectedIndex == 1 ? IconlyBold.category : IconlyLight.category) , label: "Category"),
          BottomNavigationBarItem(icon: Icon(  selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy) , label: "Cart"),
          BottomNavigationBarItem(icon: Icon(  selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2) , label: "User"),
        ],
      );
  }
}