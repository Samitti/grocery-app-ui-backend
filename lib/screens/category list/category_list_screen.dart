import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/category%20list/component/body.dart';

class CategoryListScreen extends StatelessWidget {
  static String routeName = "/categoryList";
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(
        text: 'All Products',
        context: context,
        isLeading: true,
      ),
      body: const BodyCategoryListScreen(),
    );
  }
}
