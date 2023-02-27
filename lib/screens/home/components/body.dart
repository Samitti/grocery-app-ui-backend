import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({super.key});

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text("Theme"),
          activeColor: Colors.white,
          secondary: Icon(themeState.getDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
          onChanged: (bool value){
            setState(() {
              themeState.setDarkTheme = value;
            });
          },
          value: themeState.getDarkTheme,
        ),
      ),
    );
  }
}