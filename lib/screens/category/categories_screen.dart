import 'package:flutter/material.dart';
import 'package:grocery/screens/category/components/body.dart';
import 'package:grocery/services/utils.dart';

class CategoryScreen extends StatelessWidget {

  static String routeName = "/category";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: utils.color, height: 3),
        title: const Text("Category"),
      ),
      body: const BodyCategoryScreen()
    );
  }
}