import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return SwitchListTile(
      title: const Text("Theme"),
      activeColor: Colors.white,
      secondary: Icon(themeState.getDarkTheme
          ? Icons.dark_mode_outlined
          : Icons.light_mode_outlined),
      onChanged: (bool value) {
        setState(() {
          themeState.setDarkTheme = value;
        });
      },
      value: themeState.getDarkTheme,
    );
  }
}
