import 'package:flutter/material.dart';
import 'package:grocery/screens/category/components/body.dart';

class CategoryScreen extends StatelessWidget {

  static String routeName = "/category";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyCategoryScreen()
    );
  }
}