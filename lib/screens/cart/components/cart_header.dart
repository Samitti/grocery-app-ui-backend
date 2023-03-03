
import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return SizedBox(
      width: double.infinity,
      height: dimensions.getScreenH(100),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(10)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(dimensions.getScreenW(10)),
                  color: Colors.green),
              child: InkWell(
                borderRadius: BorderRadius.circular(dimensions.getScreenW(10)),
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(dimensions.getScreenW(10)),
                  child: TextWidget(
                      text: 'Order Now',
                      color: Colors.white,
                      textSize: dimensions.getScreenW(20)),
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$0.334',
                color: color,
                textSize: dimensions.getScreenW(20),
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
