import 'package:flutter/material.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';
import 'package:grocery/screens/fetch/components/body.dart';
import 'package:provider/provider.dart';

class FetchScreen extends StatefulWidget {
  static String routeName = "/fetch";
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  void initState() {
    fetechingData(context: context);
    super.initState();
  }

  void fetechingData({required context}) {
    Future.delayed(const Duration(microseconds: 5), () async{
      final productsProvider =
          Provider.of<ProductProvider>(context, listen: false);
      await productsProvider.fetchProducts();
      Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyFechingScreen(),
    );
  }
}
