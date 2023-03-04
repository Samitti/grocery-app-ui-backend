import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/order/componetns/body.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
        const bool isEmpty = true;
    return Scaffold(
      appBar: isEmpty
          ? null
          : CommonFunction.appBar(context: context, text: 'Orders', isLeading: true),
      body: const SingleChildScrollView(child: BodyOrderScreen()),
    );
  }
}