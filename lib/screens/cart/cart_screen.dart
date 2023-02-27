import 'package:flutter/material.dart';
import 'package:grocery/screens/cart/components/body.dart';

class CartScreen extends StatelessWidget {

  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyCartScreen()
    );
  }
}