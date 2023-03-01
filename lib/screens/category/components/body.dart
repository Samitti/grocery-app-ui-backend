import 'package:flutter/material.dart';
import 'package:grocery/screens/category/components/category_cards.dart';
import 'package:grocery/constants/utils.dart';

class BodyCategoryScreen extends StatelessWidget {
  const BodyCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final catList = Utils.catInfo;
    final catColor = Utils.catColors;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 50, right: 20),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: List.generate(
          6,
          (index) => CategoryCards(
            backcolor: catColor[index],
            categoryText: catList[index]['catText'],
            imagePath: catList[index]['imgPath'],
          ),
        ),
      ),
    );
  }
}
