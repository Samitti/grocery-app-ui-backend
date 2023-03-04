import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/widgets/green_widget.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class ProductWidgetViewed extends StatefulWidget {
  const ProductWidgetViewed({super.key});

  @override
  State<ProductWidgetViewed> createState() => _ProductWidgetViewedState();
}

class _ProductWidgetViewedState extends State<ProductWidgetViewed> {
  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenW(10),
          vertical: dimensions.getScreenH(5)),
      child: Container(
        height: dimensions.getScreenH(100),
        width: dimensions.getScreenH(100),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(dimensions.getScreenH(20))),
        child: Center(
          child: ListTile(
            subtitle: TextWidget(
                text: '\$12.99',
                color: color,
                textSize: dimensions.getScreenH(18)),
            onTap: () {
              CommonFunction.navigateToPage(
                  context: context, routeName: DetailsScreen.routeName);
            },
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimensions.getScreenW(12))),
              child: FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                width: dimensions.getScreenH(70),
                height: dimensions.getScreenH(100),
                boxFit: BoxFit.fill,
              ),
            ),
            title: TextWidget(
              text: 'Title',
              color: color,
              textSize: dimensions.getScreenW(20),
              isTitle: true,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimensions.getScreenW(8)),
                  color: Colors.green),
              child: InkWell(
                borderRadius: BorderRadius.circular(dimensions.getScreenW(8)),
                onTap: (){},
                child: Padding(
                  padding: EdgeInsets.all(dimensions.getScreenW(8)),
                  child: const Icon(
                    CupertinoIcons.plus,
                    color: Colors.white,
                  )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
