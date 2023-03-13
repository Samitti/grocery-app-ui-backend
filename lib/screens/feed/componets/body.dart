import 'package:flutter/material.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/screens/feed/componets/search_text_feild.dart';
import 'package:grocery/widgets/feed_items_widget.dart';
import 'package:provider/provider.dart';

class BodyFeedScreen extends StatelessWidget {
  const BodyFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
            final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProvider.getProducts;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SearchTextFeild(),
          GridView.count(
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              allProducts.length,
              (index) {
                return FeedsWidgets(imageUrl: allProducts[index].productImageUrl, title: allProducts[index].productTitle,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
