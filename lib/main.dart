import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/constants/theme_data.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/signin/signin_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => darkThemeProvider)],
      child: Consumer<DarkThemeProvider>(
          builder: (context, darkThemeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(darkThemeProvider.getDarkTheme, context),
          initialRoute: SignInScreen.routeName,
          routes: routes,
        );
      }),
    );
  }

  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    darkThemeProvider.setDarkTheme =
        await darkThemeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }
}
