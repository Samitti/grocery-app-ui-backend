import 'package:flutter/material.dart';
import 'package:grocery/screens/home/components/on_sale.dart';

class BodyOnSaleScreen extends StatelessWidget {
  const BodyOnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        children: List.generate(
          16,
          (index) {
            return const OnSaleWidget();
          },
        ),
      ),
    );
  }
}
