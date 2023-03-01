
import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/widgets/text_widget.dart';

class HeadingsBar extends StatelessWidget {
  const HeadingsBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.all(dimensions.getScreenW(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: 'Our Products',
            color: Colors.black,
            textSize: dimensions.getScreenW(18),
            maxLines: 1,
          ),
          TextButton(
            onPressed: () {},
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
