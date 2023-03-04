import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/wishlist/components/body.dart';

class WishListScreen extends StatelessWidget {
  static String routeName = "/wishlist";
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(context, 'WishList (2)'),
      body: const BodyWishListScreen(),
    );
  }
}