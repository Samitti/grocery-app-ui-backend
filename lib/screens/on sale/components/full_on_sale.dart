import 'package:flutter/material.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/widgets/on_sale_widget.dart';
import 'package:provider/provider.dart';

class FullOnSale extends StatelessWidget {
  const FullOnSale({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> onSaleProducts = productProvider.onSale;
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      children: List.generate(
        onSaleProducts.length,
        (index) {
          return ChangeNotifierProvider.value(
            value: onSaleProducts[index],
            child: const OnSaleWidget(),
          );
        },
      ),
    );
  }
}
