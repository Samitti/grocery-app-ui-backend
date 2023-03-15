import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/screens/home/components/price.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    final productModel = Provider.of<ProductModel>(context);
    return Padding(
      padding: EdgeInsets.all(dimensions.getScreenW(10)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: productModel.productid,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(dimensions.getScreenW(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl: productModel.productImageUrl,
                    height: dimensions.getScreenH(85),
                    width: dimensions.getScreenH(85),
                    boxFit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(
                        color: color,
                        text: productModel.productIsPiece ? '1 Piece' : '1 KG',
                        textSize: dimensions.getScreenW(20),
                        isTitle: true,
                      ),
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
                          HeartWidget(
                              color: color, size: dimensions.getScreenW(22)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              PriceWidget(
                isOnSale: productModel.productIsOnSale,
                salePrice: productModel.productSalePrice,
                price: productModel.productPrice,
                textPrice: '1',
              ),
              SizedBox(
                height: dimensions.getScreenH(5),
              ),
              TextWidget(
                text: productModel.productTitle,
                color: color,
                maxLines: 1,
                textSize: dimensions.getScreenW(20),
                isTitle: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
