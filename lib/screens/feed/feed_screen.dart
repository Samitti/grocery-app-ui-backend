import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/screens/feed/componets/body.dart';

class FeedScreen extends StatelessWidget {
  static String routeName = "/feed";
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.appBar(text: 'All Products', context: context, isLeading: true),
      body: const BodyFeedScreen(),
    );
  }
}
