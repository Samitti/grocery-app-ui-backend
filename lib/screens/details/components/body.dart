import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/details/components/upper_container.dart';

class BodyDetailsScreen extends StatelessWidget {
  const BodyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: SizedBox(
            height: dimensions.getScreenH(300),
            width: double.infinity,
            child: FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              height: dimensions.getScreenH(300),
              width: dimensions.getScreenH(300),
              boxFit: BoxFit.cover,
            ),
          ),
        ),
        const Flexible(
          flex: 4,
          child: UpperContainer(),
        ),
      ],
    );
  }
}
