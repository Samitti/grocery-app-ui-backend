import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class FeedsWidgets extends StatefulWidget {
  const FeedsWidgets({super.key});

  @override
  State<FeedsWidgets> createState() => _FeedsWidgetsState();
}

class _FeedsWidgetsState extends State<FeedsWidgets> {
  final _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    final productModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool isInCart =
        cartProvider.getcartItems.containsKey(productModel.productid);
    bool? isInWishlist =
        wishlistProvider.getwhislistItems.containsKey(productModel.productid);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenH(15),
          vertical: dimensions.getScreenH(5)),
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
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(dimensions.getScreenW(20)),
          ),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl: productModel.productImageUrl,
                height: dimensions.getScreenH(70),
                width: dimensions.getScreenH(70),
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimensions.getScreenW(10),
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextWidget(
                        text: productModel.productTitle,
                        color: color,
                        maxLines: 1,
                        textSize: dimensions.getScreenW(20),
                        isTitle: true,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: HeartWidget(
                        color: color,
                        size: dimensions.getScreenW(22),
                        productId: productModel.productid,
                        isInWishlist: isInWishlist,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: dimensions.getScreenW(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(
                      isOnSale: productModel.productIsOnSale,
                      salePrice: productModel.productSalePrice,
                      price: productModel.productPrice,
                      textPrice: _quantityController.text,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          SizedBox(
                            width: dimensions.getScreenW(3),
                          ),
                          TextWidget(
                            text: productModel.productIsPiece ? 'Piece' : 'KG',
                            color: color,
                            textSize: dimensions.getScreenW(15),
                            isTitle: true,
                          ),
                          SizedBox(
                            width: dimensions.getScreenW(5),
                          ),
                          Flexible(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    _quantityController.text = "1";
                                  } else {}
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: isInCart
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
                            quantity: int.parse(_quantityController.text),
                          );
                        },
                  child: TextWidget(
                    color: color,
                    text: isInCart ? 'In Cart' : 'Add to Cart',
                    textSize: dimensions.getScreenW(18),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
