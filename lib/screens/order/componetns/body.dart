import 'package:flutter/material.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/order/componetns/tiles_order.dart';

class BodyOrderScreen extends StatelessWidget {
  const BodyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index){
        return const TilesOrders();
      },
      separatorBuilder: (context, index){
        return Divider(
          color: color,
          thickness: 1,
        );
      },
    );
  }
}