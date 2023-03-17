import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/provider/viewed_provider.dart';
import 'package:grocery/screens/details/components/body.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final viewedProvider = Provider.of<ViewedProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        viewedProvider.addProductsToHistory(productId: productId);
        return true;
      },
      child: Scaffold(
        appBar:
            CommonFunction.appBar(context: context, text: '', isLeading: true),
        body: const BodyDetailsScreen(),
      ),
    );
  }
}
