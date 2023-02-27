import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference{
  static const themeStatus = "THEMESTATUS";
  setDarkTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themeStatus, value);
  }

  Future <bool> getTheme() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themeStatus) ?? false;
  }
}