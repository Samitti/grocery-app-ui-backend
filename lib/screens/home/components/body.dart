import 'package:flutter/material.dart';
import 'package:grocery/screens/home/components/on_sale.dart';
import 'package:grocery/screens/home/components/swiper_images.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SwiperImages(),
        OnSaleWidget(),
      ],
    );
  }
}
