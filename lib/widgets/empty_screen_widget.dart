import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/feed/feed_screen.dart';
import 'package:grocery/widgets/text_widget.dart';

class EmptyWidgetScreen extends StatelessWidget {
  final String imgPath;
  final String title;
  final String subTitle;
  final String buttonText;
  const EmptyWidgetScreen({super.key, required this.imgPath, required this.title, required this.subTitle, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    final themeState = Utils(context).getTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: dimensions.getScreenH(75),
        ),
        Image.asset(
          imgPath,
          width: double.infinity,
          height: dimensions.getScreenH(300),
        ),
        SizedBox(
          height: dimensions.getScreenH(10),
        ),
        TextWidget(
          text: title,
          color: Colors.red,
          textSize: dimensions.getScreenW(35),
          isTitle: true,
        ),
        SizedBox(
          height: dimensions.getScreenH(20),
        ),
        TextWidget(
            text: subTitle,
            color: Colors.cyan,
            textSize: dimensions.getScreenW(20)),
        SizedBox(
          height: dimensions.getScreenH(100),
        ),
        ElevatedButton(
          onPressed: () {
            CommonFunction.navigateToPage(
                context: context, routeName: FeedScreen.routeName);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimensions.getScreenW(10)),
              side: BorderSide(
                color: color,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: color,
            padding: EdgeInsets.symmetric(
              horizontal: dimensions.getScreenW(50),
              vertical: dimensions.getScreenH(20),
            ),
          ),
          child: TextWidget(
            text: buttonText,
            color: themeState ? Colors.grey.shade300: Colors.grey.shade800,
            textSize: dimensions.getScreenW(20),
            isTitle: true,
          ),
        )
      ],
    );
  }
}
