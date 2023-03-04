import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/widgets/text_widget.dart';

class TilesOrders extends StatelessWidget {
  const TilesOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(10), vertical: dimensions.getScreenH(5)),
      child: ListTile(
        subtitle: const Text('\$12.9'),
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
            width: dimensions.getScreenH(80),
            boxFit: BoxFit.fill,
          ),
        ),
        title: TextWidget(text: 'Title x 12', color: color, textSize: dimensions.getScreenW(20), isTitle: true,),
        trailing: TextWidget(text: '03/12/2023', color: color, textSize: dimensions.getScreenW(18)),
    
      ),
    );
  }
}
