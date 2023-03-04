import 'package:flutter/material.dart';
import 'package:grocery/widgets/empty_screen_widget.dart';
import 'package:grocery/screens/cart/components/full_cart.dart';

class BodyCartScreen extends StatelessWidget {
  const BodyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isEmpty = true;
    if (isEmpty) {
      return const EmptyWidget(
            buttonText: 'Brower Products',
            imgPath: "assets/images/cart.png",
            subTitle: 'No items in your cart yet',
            title: 'Whoops!',
          );
    } else {
      return const FullCart();
    }
  }
}
