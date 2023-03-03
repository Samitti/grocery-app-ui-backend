import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/green_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return Container(
      width: double.infinity,
      height: dimensions.getScreenH(100),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dimensions.getScreenW(20)),
              topRight:
                  Radius.circular(dimensions.getScreenW(20)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: dimensions.getScreenW(25)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: dimensions.getScreenW(10),
                ),
                TextWidget(
                  text: 'Total',
                  color: Colors.red,
                  textSize: dimensions.getScreenW(20),
                  isTitle: true,
                ),
                SizedBox(
                  height: dimensions.getScreenW(5),
                ),
                TextWidget(
                    text: '\$0.99/KG',
                    color: color,
                    textSize: dimensions.getScreenW(25)),
              ],
            ),
            const Spacer(),
            GreenButtonWidget(
              text: 'Add to Cart',
              press: (){},
            )
          ],
        ),
      ),
    );
  }
}
