import 'package:flutter/material.dart';
import 'package:grocery/screens/viewed/components/product_widget_viewed.dart';

class BodyViewedScreen extends StatelessWidget {
  const BodyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ProductWidgetViewed();
      },
    );
  }
}