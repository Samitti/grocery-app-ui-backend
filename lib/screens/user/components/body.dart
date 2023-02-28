import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/user/components/tiles.dart';
import 'package:provider/provider.dart';

class BodyUserScreen extends StatelessWidget {
  const BodyUserScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headerUserScreen(color: color),
              const SizedBox(height: 15),
              const Divider(
                thickness: 1.2,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              const Titles(),
            ],
          ),
        ),
      ),
    );
  }

  Container headerUserScreen({required Color color}) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 5),
      child: Text.rich(
        TextSpan(
          text: "Hi, ",
          style: const TextStyle(color: Colors.cyan, fontSize: 30),
          children: [
            TextSpan(
                text: 'My Name\n',
                style: TextStyle(
                  color: color,
                  fontSize: 30,
                )),
            TextSpan(
                text: 'test@gmail.com',
                style: TextStyle(fontSize: 18, color: color))
          ],
        ),
      ),
    );
  }
}
