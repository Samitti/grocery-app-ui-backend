import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/provider/order_provider.dart';
import 'package:grocery/screens/order/componetns/body.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: orderProvider.getOrdersList.isEmpty
          ? null
          : CommonFunction.appBar(
              context: context, text: 'Orders', isLeading: true),
      body: const BodyOrderScreen(),
    );
  }
}
