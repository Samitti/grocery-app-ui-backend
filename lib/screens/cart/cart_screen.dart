import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/cart/components/body.dart';
import 'package:grocery/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: 'Cart (2)',
            color: color,
            textSize: dimensions.getScreenW(25),
            isTitle: true,
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            )
          ],
        ),
        body: const BodyCartScreen(),);
  }
}
