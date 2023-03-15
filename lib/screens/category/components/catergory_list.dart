import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/screens/feed/componets/search_text_feild.dart';
import 'package:grocery/widgets/feed_items_widget.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  static String routeName = "/categoryList";
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productCategory = ModalRoute.of(context)!.settings.arguments as String;
    List<ProductModel> productByCategory =
        productProvider.findByCategory(productCategory);
    return Scaffold(
      appBar: CommonFunction.appBar(
          text: 'All Products', context: context, isLeading: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchTextFeild(),
            GridView.count(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                productByCategory.length,
                (index) {
                  return ChangeNotifierProvider.value(
                    value: productByCategory[index],
                    child: const FeedsWidgets(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
