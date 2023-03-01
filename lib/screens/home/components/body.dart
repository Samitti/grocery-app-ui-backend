import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/home/components/heaading_bar.dart';
import 'package:grocery/screens/home/components/on_sale.dart';
import 'package:grocery/screens/home/components/swiper_images.dart';
import 'package:grocery/widgets/text_widget.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Column(
      children: [
        const SwiperImages(),
        TextButton(
          onPressed: () {},
          child: TextWidget(
            text: 'View All',
            color: Colors.blue,
            textSize: dimensions.getScreenW(18),
            maxLines: 1,
          ),
        ),
        SizedBox(
          height: dimensions.getScreenH(200),
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const OnSaleWidget();
            },
          ),
        ),
        SizedBox(
          height: dimensions.getScreenH(5),
        ),
        const HeadingsBar()
      ],
    );
  }
}
