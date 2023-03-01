
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';

class SwiperImages extends StatelessWidget {
  const SwiperImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final offers = Utils.offerImages;
    return SizedBox(
      height: AppDimensions(context).getScreenH(250),
      child: Swiper(
        autoplay: true,
          itemBuilder: (BuildContext context,int index){
            return Image.asset(offers[index],fit: BoxFit.fill,);
          },
          itemCount:offers.length,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.red
            ),  
          ),
        ),
    );
  }
}