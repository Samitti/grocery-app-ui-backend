import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/user/components/tiles.dart';
import 'package:provider/provider.dart';

class BodyUserScreen extends StatelessWidget {
  const BodyUserScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final AppDimensions dimensions = AppDimensions(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: dimensions.getScreenH(30)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerUserScreen(color: color, context: context),
              SizedBox(height: dimensions.getScreenH(15)),
              const Divider(
                thickness: 1.1,
                color: Colors.black,
              ),
              SizedBox(height: dimensions.getScreenH(20)),
              const Titles(),
            ],
          ),
        ),
      ),
    );
  }

  Container headerUserScreen({required Color color, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(left: AppDimensions(context).getScreenW(15), top: AppDimensions(context).getScreenH(5)),
      child: Text.rich(
        TextSpan(
          text: "Hi, ",
          style: TextStyle(color: Colors.cyan, fontSize: AppDimensions(context).getScreenW(30)),
          children: [
            TextSpan(
                text: 'My Name\n',
                style: TextStyle(
                  color: color,
                  fontSize: AppDimensions(context).getScreenW(30),
                )),
            TextSpan(
                text: 'test@gmail.com',
                style: TextStyle(fontSize: AppDimensions(context).getScreenW(18), color: color))
          ],
        ),
      ),
    );
  }
}
