import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/category%20list/category_list_screen.dart';
import 'package:provider/provider.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({
    super.key,
    required this.backcolor,
    required this.categoryText,
    required this.imagePath,
  });
  final String categoryText;
  final String imagePath;
  final Color backcolor;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final AppDimensions dimensions = AppDimensions(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          CategoryListScreen.routeName,
          arguments: categoryText,
        );
      },
      child: Container(
        height: dimensions.getScreenW(180),
        width: dimensions.getScreenW(180),
        decoration: BoxDecoration(
            color: backcolor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(dimensions.getScreenW(20)),
            border: Border.all(color: backcolor.withOpacity(0.7), width: dimensions.getScreenW(2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: dimensions.getScreenW(100),
              width: dimensions.getScreenW(100),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Text(
              categoryText,
              style: TextStyle(
                  fontSize: dimensions.getScreenW(20), fontWeight: FontWeight.bold, color: color),
            )
          ],
        ),
      ),
    );
  }
}
