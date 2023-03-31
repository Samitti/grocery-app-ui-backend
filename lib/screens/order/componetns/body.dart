import 'package:flutter/material.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/provider/order_provider.dart';
import 'package:grocery/screens/order/componetns/tiles_order.dart';
import 'package:grocery/widgets/empty_screen.dart';
import 'package:provider/provider.dart';

class BodyOrderScreen extends StatelessWidget {
  const BodyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orderList = orderProvider.getOrdersList;
    final Color color = Utils(context).color;
    if (orderList.isEmpty) {
      return const EmptyWidgetScreen(
        buttonText: 'Shop Now',
        imgPath: 'assets/images/cart.png',
        subTitle: 'Please order your first',
        title: 'No Orders Yet!',
      );
    } else {
      return ListView.separated(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: orderList[index],
            child: const TilesOrders(),
          );
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
