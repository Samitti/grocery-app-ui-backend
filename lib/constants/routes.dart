import 'package:flutter/material.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';
import 'package:grocery/screens/cart/cart_screen.dart';
import 'package:grocery/screens/category/categories_screen.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/user/user_profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  BottomBarScreen.routeName : (context) => const BottomBarScreen(),
  CartScreen.routeName : (context) => const CartScreen(),
  CategoryScreen.routeName : (context) => const CategoryScreen(),
  HomeScreen.routeName : (context) => const HomeScreen(),
  UserProfileScreen.routeName : (context) => const UserProfileScreen(),
};