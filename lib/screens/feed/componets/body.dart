import 'package:flutter/material.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/feed/componets/search_text_feild.dart';
import 'package:grocery/widgets/feed_items_widget.dart';

class BodyFeedScreen extends StatelessWidget {
  const BodyFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Utils.products.length,
              (index) {
                return FeedsWidgets(imageUrl: Utils.products[index].productImageUrl, title: Utils.products[index].productTitle,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
