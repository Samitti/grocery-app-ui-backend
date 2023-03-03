import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/cart/components/quantity_controller.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class FullCart extends StatelessWidget {
  const FullCart({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(dimensions.getScreenH(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(dimensions.getScreenW(12)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: dimensions.getScreenH(90),
                      width: dimensions.getScreenH(90),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimensions.getScreenW(12))),
                      child: FancyShimmerImage(
                        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: dimensions.getScreenH(10),
                        ),
                        TextWidget(
                          text: 'Title',
                          color: color,
                          textSize: dimensions.getScreenW(20),
                          isTitle: true,
                        ),
                        SizedBox(
                          height: dimensions.getScreenH(16),
                        ),
                        const QuantityController(),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(15)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Icon(CupertinoIcons.cart_badge_minus, color: Colors.red, size: dimensions.getScreenW(20),),
                          ),
                          SizedBox(height: dimensions.getScreenH(5),),
                          HeartWidget(color: color, size: dimensions.getScreenW(20), press: (){}),
                          SizedBox(height: dimensions.getScreenH(5),),
                          TextWidget(text: "\$0.29", color: color, textSize:  dimensions.getScreenH(20), maxLines: 1,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
