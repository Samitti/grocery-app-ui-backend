import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(
          context: context,
          text: 'Cart (2)',
          isSuffix: true,
          suffixPress: () async {
            await CommonFunction.warningDialog(
              context: context,
              imgPath: "assets/images/warning-sign.png",
              text: 'Empty your cart',
              subTitle: 'Are you sure?',
              press: () {},
            );
          }),
      body: const BodyCartScreen(),
    );
  }
}
