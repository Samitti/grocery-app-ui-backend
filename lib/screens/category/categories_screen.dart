import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/category/components/body.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class CategoryScreen extends StatelessWidget {

  static String routeName = "/category";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final AppDimensions dimensions = AppDimensions(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(
            text: 'Categories',
            color: utils.color,
            textSize: dimensions.getScreenW(25),
            isTitle: true,
          ),
      ),
      body: const BodyCategoryScreen()
    );
  }
}