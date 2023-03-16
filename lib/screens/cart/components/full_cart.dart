import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/screens/cart/components/cart_header.dart';
import 'package:grocery/screens/cart/components/cart_item.dart';
import 'package:provider/provider.dart';

class FullCart extends StatelessWidget {
  const FullCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemList = cartProvider.getcartItems.values.toList().reversed.toList();
    return Column(
      children: [
        const CartHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: cartItemList.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: cartItemList[index],
                child: CartItem(quantity: cartItemList[index].quantity,),
              );
            },
          ),
        ),
      ],
    );
  }
}
