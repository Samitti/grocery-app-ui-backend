import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/on%20sale/components/body.dart';

class OnSaleScreen extends StatelessWidget {
  static String routeName = "/onsale";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(
              context: context, text: 'On Sale Products', isLeading: true),
      body: const BodyOnSaleScreen(),
    );
  }
}
