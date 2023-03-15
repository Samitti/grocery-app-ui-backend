import 'package:flutter/material.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/widgets/empty_widget.dart';
import 'package:grocery/screens/on%20sale/components/full_on_sale.dart';
import 'package:provider/provider.dart';

class BodyOnSaleScreen extends StatelessWidget {
  const BodyOnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> onSaleProducts = productProvider.onSale;
    if (onSaleProducts.isEmpty) {
      return const SafeArea(child: EmptyWidget());
    } else {
      return const SafeArea(child: FullOnSale());
    }
  }
}
