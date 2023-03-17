import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final Color color = Utils(context).color;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenW(8),
          vertical: dimensions.getScreenH(10)),
      child: InkWell(
        onTap: () {
          CommonFunction.navigateToPage(
              context: context, routeName: DetailsScreen.routeName);
        },
        child: Container(
          height: dimensions.getScreenH(130),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: color,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(dimensions.getScreenW(10))),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: dimensions.getScreenW(10)),
                width: dimensions.getScreenW(90),
                height: dimensions.getScreenH(90),
                child: FancyShimmerImage(
                  imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyLight.bag2,
                          color: color,
                          size: dimensions.getScreenW(25),
                        ),
                      ),
                      // HeartWidget(
                      //   color: color,
                      //   size: dimensions.getScreenW(22),
                      //   productId: currentProduct.productid,
                      //   isInWishlist: isInWishlist,
                      // ),
                    ],
                  ),
                  Flexible(
                    child: TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: dimensions.getScreenW(20),
                      isTitle: true,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: dimensions.getScreenH(10),
                  ),
                  TextWidget(
                    text: '\$2.56',
                    color: color,
                    textSize: dimensions.getScreenW(18),
                    maxLines: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
