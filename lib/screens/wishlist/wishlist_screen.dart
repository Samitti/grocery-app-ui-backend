import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/wishlist/components/body.dart';

class WishListScreen extends StatelessWidget {
  static String routeName = "/wishlist";
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(
          context: context,
          text: 'WishList (2)',
          isSuffix: true,
          suffixPress: () async {
            await CommonFunction.warningDialog(
              context: context,
              imgPath: "assets/images/warning-sign.png",
              text: 'Empty your wishlist',
              subTitle: 'Are you sure?',
              press: () {},
            );
          }),
      body: const BodyWishListScreen(),
    );
  }
}
