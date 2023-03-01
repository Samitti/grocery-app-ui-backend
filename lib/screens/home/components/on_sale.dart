import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/home/components/price.dart';
import 'package:grocery/widgets/text_widget.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.all(dimensions.getScreenW(12)),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(dimensions.getScreenW(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    height: dimensions.getScreenH(90),
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(color: color, text: '1 KG', textSize: dimensions.getScreenW(20), isTitle: true,),
                      SizedBox(
                        height: dimensions.getScreenH(5),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              color: color,
                              size: dimensions.getScreenW(22),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.heart,
                              color: color,
                              size: dimensions.getScreenW(22),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const PriceWidget(),
              SizedBox(height: dimensions.getScreenH(5),),
              TextWidget(text: 'Title', color: color, textSize: dimensions.getScreenW(20), isTitle: true,),
            ],
          ),
        ),
      ),
    );
  }
}
