import 'package:flutter/material.dart';
import 'package:grocery/screens/on%20sale/components/empty_on_sale.dart';
import 'package:grocery/screens/on%20sale/components/full_on_sale.dart';

class BodyOnSaleScreen extends StatelessWidget {
  const BodyOnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isSaleEmpty = true;
    if (isSaleEmpty) {
      return const SafeArea(child: EmptyOnSale());
    } else {
      return SafeArea(child: const FullOnSale());
    }
  }
}
