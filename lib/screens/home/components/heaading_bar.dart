
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/feed/feed_screen.dart';
import 'package:grocery/widgets/text_widget.dart';

class HeadingsBar extends StatelessWidget {
  const HeadingsBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return Padding(
      padding: EdgeInsets.all(dimensions.getScreenW(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: 'Our Products',
            color: color,
            textSize: dimensions.getScreenW(18),
            maxLines: 1,
          ),
          TextButton(
            onPressed: () {
              CommonFunction.navigateToPage(context: context, routeName: FeedScreen.routeName);
            },
            child: TextWidget(
              text: 'Browse All',
              color: Colors.blue,
              textSize: dimensions.getScreenW(18),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
