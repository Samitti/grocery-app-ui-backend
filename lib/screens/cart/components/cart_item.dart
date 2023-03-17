import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/cart_model.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/cart/components/add_sub_button.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final int quantity;
  const CartItem({
    super.key,
    required this.quantity,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = widget.quantity.toString();
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final cartModel = Provider.of<CartModel>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final currentProduct = productProvider.findById(cartModel.productId);
    bool? isInWishlist =
        wishlistProvider.getwhislistItems.containsKey(currentProduct.productid);
    final double price = currentProduct.productIsOnSale
        ? currentProduct.productSalePrice
        : currentProduct.productPrice;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: cartModel.productId,
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(dimensions.getScreenH(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  borderRadius:
                      BorderRadius.circular(dimensions.getScreenW(12)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: dimensions.getScreenH(90),
                      width: dimensions.getScreenH(90),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimensions.getScreenW(12))),
                      child: FancyShimmerImage(
                        imageUrl: currentProduct.productImageUrl,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: dimensions.getScreenH(10),
                        ),
                        TextWidget(
                          text: currentProduct.productTitle,
                          color: color,
                          textSize: dimensions.getScreenW(20),
                          isTitle: true,
                        ),
                        SizedBox(
                          height: dimensions.getScreenH(16),
                        ),
                        SizedBox(
                          width: dimensions.getScreenW(100),
                          child: Row(
                            children: [
                              AddSubButtons(
                                icon: CupertinoIcons.minus,
                                backColor: Colors.red,
                                press: () {
                                  cartProvider
                                      .minusQuantity(currentProduct.productid);
                                  if (_quantityController.text == "1") {
                                    return;
                                  } else {
                                    setState(() {
                                      _quantityController.text =
                                          (int.parse(_quantityController.text) -
                                                  1)
                                              .toString();
                                    });
                                  }
                                },
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: _quantityController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide()),
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
                              AddSubButtons(
                                icon: CupertinoIcons.plus,
                                backColor: Colors.green,
                                press: () {
                                  cartProvider
                                      .plusQuantity(currentProduct.productid);
                                  setState(() {
                                    _quantityController.text =
                                        (int.parse(_quantityController.text) +
                                                1)
                                            .toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: dimensions.getScreenW(15)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              cartProvider
                                  .removeOneItem(currentProduct.productid);
                            },
                            child: Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: dimensions.getScreenW(20),
                            ),
                          ),
                          SizedBox(
                            height: dimensions.getScreenH(5),
                          ),
                          HeartWidget(
                            color: color,
                            size: dimensions.getScreenW(22),
                            productId: currentProduct.productid,
                            isInWishlist: isInWishlist,
                          ),
                          SizedBox(
                            height: dimensions.getScreenH(5),
                          ),
                          TextWidget(
                            text: "\$${price.toStringAsFixed(2)}",
                            color: color,
                            textSize: dimensions.getScreenH(20),
                            maxLines: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
