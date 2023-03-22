import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/wishlist_provider.dart';
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
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool isInCart =
        cartProvider.getcartItems.containsKey(productModel.productid);
    bool? isInWishlist =
        wishlistProvider.getwhislistItems.containsKey(productModel.productid);
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
                    height: dimensions.getScreenH(80),
                    width: dimensions.getScreenH(80),
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
                            onTap: isInCart
                                ? null
                                : () {                                    
                                    if (firebaseAuth.currentUser == null) {
                                      CommonFunction.errorToast(
                                        error: 'Please Login First',
                                      );
                                      return;
                                    }
                                    cartProvider.addProductsToCart(
                                      productId: productModel.productid,
                                      quantity: 1,
                                    );
                                  },
                            child: Icon(
                              isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
                              color: isInCart ? Colors.green : color,
                              size: dimensions.getScreenW(22),
                            ),
                          ),
                          HeartWidget(
                            color: color,
                            size: dimensions.getScreenW(22),
                            productId: productModel.productid,
                            isInWishlist: isInWishlist,
                          ),
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
