import 'package:flutter/material.dart';
import 'package:grocery/provider/viewed_provider.dart';
import 'package:grocery/screens/viewed/components/viewed_products.dart';
import 'package:grocery/widgets/empty_screen.dart';
import 'package:provider/provider.dart';

class BodyViewedScreen extends StatelessWidget {
  const BodyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProvider>(context);
    final viewedItemList =
        viewedProvider.getviewedItems.values.toList().reversed.toList();
    if (viewedItemList.isEmpty) {
      return const EmptyWidgetScreen(
        buttonText: 'Shop Now',
        imgPath: 'assets/images/history.png',
        subTitle: 'No products has been reviewed yet!',
        title: 'Your history is empty',
      );
    } else {
      return ListView.builder(
        itemCount: viewedItemList.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: viewedItemList[index],
            child: const ViewedProduct(),
          );
        },
      );
    }
  }
}
