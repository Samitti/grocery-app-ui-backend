import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/category/components/category_cards.dart';
import 'package:grocery/constants/utils.dart';

class BodyCategoryScreen extends StatelessWidget {
  const BodyCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final catList = Utils.catInfo;
    final catColor = Utils.catColors;
    return Padding(
      padding: EdgeInsets.only(left: dimensions.getScreenW(20), bottom: dimensions.getScreenH(10), top: dimensions.getScreenH(50), right: dimensions.getScreenW(20)),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: dimensions.getScreenW(20),
        mainAxisSpacing: dimensions.getScreenW(20),
        children: List.generate(
          catList.length,
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
