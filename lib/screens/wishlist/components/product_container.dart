import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/wishlist_model.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/services/products/products_firestore.dart';
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
    final Color color = Utils(context).color;
    final wishlistModel = Provider.of<WishlistModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final currentProduct = productProvider.findById(wishlistModel.productId);
    final double price = currentProduct.productIsOnSale
        ? currentProduct.productSalePrice
        : currentProduct.productPrice;
    bool? isInWishlist =
        wishlistProvider.getwhislistItems.containsKey(wishlistModel.productId);
    bool isInCart =
        cartProvider.getcartItems.containsKey(currentProduct.productid);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenW(8),
          vertical: dimensions.getScreenH(10)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: wishlistModel.productId,
          );
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
              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: dimensions.getScreenW(10)),
                  height: dimensions.getScreenH(90),
                  child: FancyShimmerImage(
                    imageUrl: currentProduct.productImageUrl,
                    boxFit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            isInCart
                                ? null
                                : () async {
                                    if (firebaseAuth.currentUser == null) {
                                      CommonFunction.errorToast(
                                        error: 'Please Login First',
                                      );
                                      return;
                                    }
                                    await ProductFireStore
                                        .addProductToUserWishlist(
                                      productId: currentProduct.productid,
                                    );
                                    await wishlistProvider.fetchWish();
                                  };
                          },
                          icon: Icon(
                            isInCart ? IconlyBold.bag2 : IconlyLight.bag2,
                            color: isInCart ? Colors.green : color,
                            size: dimensions.getScreenW(22),
                          ),
                        ),
                        HeartWidget(
                          color: color,
                          size: dimensions.getScreenW(22),
                          productId: currentProduct.productid,
                          isInWishlist: isInWishlist,
                        ),
                      ],
                    ),
                    TextWidget(
                      text: currentProduct.productTitle,
                      color: color,
                      textSize: dimensions.getScreenW(20),
                      isTitle: true,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: dimensions.getScreenH(10),
                    ),
                    TextWidget(
                      text: '\$${price.toStringAsFixed(2)}',
                      color: color,
                      textSize: dimensions.getScreenW(18),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
