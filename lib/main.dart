import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/constants/theme_data.dart';
import 'package:grocery/firebase_options.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/provider/order_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/provider/viewed_provider.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/fetch/fetch_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

final Future<FirebaseApp> _firebaseInitilaize = Firebase.initializeApp();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitilaize,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }else if(snapshot.hasError){
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('An error occured'),
              ),
            ),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => darkThemeProvider),
            ChangeNotifierProvider(create: (_) => productProvider),
            ChangeNotifierProvider(create: (_) => cartProvider),
            ChangeNotifierProvider(create: (_) => wishlistProvider),
            ChangeNotifierProvider(create: (_) => viewedProvider),
            ChangeNotifierProvider(create: (_) => orderProvider),
          ],
          child: Consumer<DarkThemeProvider>(
            builder: (context, darkThemeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme:
                    Styles.themeData(darkThemeProvider.getDarkTheme, context),
                initialRoute: FetchScreen.routeName,
                routes: routes,
              );
            },
          ),
        );
      },
    );
  }

  DarkThemeProvider darkThemeProvider = DarkThemeProvider();
  ProductProvider productProvider = ProductProvider();
  CartProvider cartProvider = CartProvider();
  WishlistProvider wishlistProvider = WishlistProvider();
  ViewedProvider viewedProvider = ViewedProvider();
  OrderProvider orderProvider = OrderProvider();
  

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
