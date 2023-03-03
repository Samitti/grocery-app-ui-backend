import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screens/cart/components/cart_header.dart';
import 'package:grocery/screens/cart/components/cart_item.dart';

class FullCart extends StatelessWidget {
  const FullCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CartItem();
            },
          ),
        ),
      ],
    );
  }
}
