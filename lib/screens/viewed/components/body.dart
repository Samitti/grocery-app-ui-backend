import 'package:flutter/material.dart';
import 'package:grocery/screens/viewed/components/product_widget_viewed.dart';
import 'package:grocery/widgets/empty_screen_widget.dart';

class BodyViewedScreen extends StatelessWidget {
  const BodyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isEmpty = true;
    if (isEmpty) {
      return const EmptyWidget(
            buttonText: 'Shop Now',
            imgPath: 'assets/images/history.png',
            subTitle: 'No products has been reviewed yet!',
            title: 'Your history is empty',
          );
    } else {
      return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ProductWidgetViewed();
            },
          );
    }
  }
}
