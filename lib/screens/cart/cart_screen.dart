import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/screens/cart/components/body.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemList = cartProvider.getcartItems.values.toList();
    return Scaffold(
      appBar: cartItemList.isEmpty
          ? null
          : CommonFunction.appBar(
              context: context,
              text: 'Cart (${cartItemList.length})',
              isSuffix: true,
              suffixPress: () async {
                await CommonFunction.warningDialog(
                  context: context,
                  text: 'Empty your cart',
                  subTitle: 'Are you sure?',
                  press: () {},
                );
              },
            ),
      body: const BodyCartScreen(),
    );
  }
}
