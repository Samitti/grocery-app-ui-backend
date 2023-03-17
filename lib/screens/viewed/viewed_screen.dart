import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/provider/viewed_provider.dart';
import 'package:grocery/screens/viewed/components/body.dart';
import 'package:provider/provider.dart';

class ViewedScreen extends StatelessWidget {
  static String routeName = "/viewed";
  const ViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProvider>(context);
    final viewedItemList =
        viewedProvider.getviewedItems.values.toList().reversed.toList();
    return Scaffold(
      appBar: viewedItemList.isEmpty
          ? null
          : CommonFunction.appBar(
              context: context,
              text: 'History',
              isLeading: true,
              isSuffix: true,
              suffixPress: () async {
                await CommonFunction.warningDialog(
                    context: context,
                    text: "Clear History",
                    subTitle: "Are you sure?");
              }),
      body: const BodyViewedScreen(),
    );
  }
}
