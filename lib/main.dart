import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/constants/theme_data.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/provider/viewed_provider.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';
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
      providers: [
        ChangeNotifierProvider(create: (_) => darkThemeProvider),
        ChangeNotifierProvider(create: (_) => productProvider),
        ChangeNotifierProvider(create: (_) => cartProvider),
        ChangeNotifierProvider(create: (_) => wishlistProvider),
        ChangeNotifierProvider(create: (_) => viewedProvider),
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (context, darkThemeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(darkThemeProvider.getDarkTheme, context),
          initialRoute: BottomBarScreen.routeName,
          routes: routes,
        );
      }),
    );
  }

  DarkThemeProvider darkThemeProvider = DarkThemeProvider();
  ProductProvider productProvider = ProductProvider();
  CartProvider cartProvider = CartProvider();
  WishlistProvider wishlistProvider = WishlistProvider();
  ViewedProvider viewedProvider = ViewedProvider();

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
