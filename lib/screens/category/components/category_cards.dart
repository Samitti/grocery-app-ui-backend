import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
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
    return InkWell(
      onTap: () {},
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
            color: backcolor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: backcolor.withOpacity(0.7), width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Text(
              categoryText,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            )
          ],
        ),
      ),
    );
  }
}
