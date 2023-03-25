import 'package:flutter/material.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/widgets/empty_screen_widget.dart';
import 'package:grocery/screens/cart/components/full_cart.dart';
import 'package:provider/provider.dart';

class BodyCartScreen extends StatelessWidget {
  const BodyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemList = cartProvider.getcartItems.values.toList();
    if (cartItemList.isEmpty) {
      return const EmptyWidgetScreen(
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
