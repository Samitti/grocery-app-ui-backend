import 'package:flutter/material.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';
import 'package:grocery/screens/cart/cart_screen.dart';
import 'package:grocery/screens/category/categories_screen.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/screens/feed/feed_screen.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/on%20sale/on_sale_screen.dart';
import 'package:grocery/screens/order/order_screen.dart';
import 'package:grocery/screens/signin/signin_screen.dart';
import 'package:grocery/screens/user/user_profile_screen.dart';
import 'package:grocery/screens/viewed/viewed_screen.dart';
import 'package:grocery/screens/wishlist/wishlist_screen.dart';

final Map<String, WidgetBuilder> routes = {
  BottomBarScreen.routeName : (context) => const BottomBarScreen(),
  CartScreen.routeName : (context) => const CartScreen(),
  CategoryScreen.routeName : (context) => const CategoryScreen(),
  HomeScreen.routeName : (context) => const HomeScreen(),
  UserProfileScreen.routeName : (context) => const UserProfileScreen(),
  OnSaleScreen.routeName : (context) => const OnSaleScreen(),
  FeedScreen.routeName : (context) => const FeedScreen(),
  DetailsScreen.routeName : (context) => const DetailsScreen(),
  WishListScreen.routeName : (context) => const WishListScreen(),
  OrderScreen.routeName : (context) => const OrderScreen(),
  ViewedScreen.routeName : (context) => const ViewedScreen(),
  SignInScreen.routeName : (context) => const SignInScreen(),
};