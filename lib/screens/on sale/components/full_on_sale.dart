import 'package:flutter/material.dart';
import 'package:grocery/widgets/on_sale_widget.dart';

class FullOnSale extends StatelessWidget {
  const FullOnSale({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      children: List.generate(
        16,
        (index) {
          return const OnSaleWidget();
        },
      ),
    );
  }
}
