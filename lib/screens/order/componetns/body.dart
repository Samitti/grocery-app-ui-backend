import 'package:flutter/material.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/order/componetns/tiles_order.dart';
import 'package:grocery/widgets/empty_screen.dart';

class BodyOrderScreen extends StatelessWidget {
  const BodyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isEmpty = true;
    final Color color = Utils(context).color;
    if (isEmpty) {
      return const EmptyWidgetScreen(
            buttonText: 'Shop Now',
            imgPath: 'assets/images/cart.png',
            subTitle: 'Please order your first',
            title: 'No Orders Yet!',
          );
    } else {
      return ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const TilesOrders();
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: color,
                thickness: 1,
              );
            },
          );
    }
  }
}
