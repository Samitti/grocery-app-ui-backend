import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/feed/feed_screen.dart';
import 'package:grocery/widgets/text_widget.dart';

class EmptyWidgetScreen extends StatelessWidget {
  const EmptyWidgetScreen({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.buttonText,
  }) : super(key: key);
  final String imgPath, title, subTitle, buttonText;
  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: dimensions.getScreenH(150),
              ),
              Image.asset(
                imgPath,
                width: double.infinity,
                height: dimensions.getScreenH(200),
              ),
              SizedBox(
                height: dimensions.getScreenH(50),
              ),
              Text(
                'Whoops!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: dimensions.getScreenH(40),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: dimensions.getScreenH(20),
              ),
              TextWidget(text: title, color: Colors.cyan, textSize: 20),
              SizedBox(
                height: dimensions.getScreenH(10),
              ),
              TextWidget(text: subTitle, color: Colors.cyan, textSize: 20),
              SizedBox(
                height: dimensions.getScreenH(50),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: color,
                  padding: EdgeInsets.symmetric(
                      horizontal: dimensions.getScreenH(40),
                      vertical: dimensions.getScreenH(20)),
                ),
                onPressed: () {
                  CommonFunction.navigateToPage(
                    routeName: FeedScreen.routeName,
                    context: context,
                  );
                },
                child: TextWidget(
                  text: buttonText,
                  textSize: 20,
                  color:
                      themeState ? Colors.grey.shade300 : Colors.grey.shade800,
                  isTitle: true,
                ),
              ),
            ]),
      )),
    );
  }
}
