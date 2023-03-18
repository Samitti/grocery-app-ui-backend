import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/cart/components/add_sub_button.dart';
import 'package:grocery/screens/details/components/upper_part.dart';
import 'package:grocery/widgets/green_widget.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = '1';
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
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<ProductProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final currentProduct = productProvider.findById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    bool isInCart =
        cartProvider.getcartItems.containsKey(currentProduct.productid);
    final double price = currentProduct.productIsOnSale
        ? currentProduct.productSalePrice
        : currentProduct.productPrice;
    final totalPrice = price * int.parse(_quantityController.text);
    bool? isInWishlist =
        wishlistProvider.getwhislistItems.containsKey(currentProduct.productid);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            dimensions.getScreenW(40),
          ),
          topRight: Radius.circular(
            dimensions.getScreenW(40),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
            child: Row(
              children: [
                TextWidget(
                  text: currentProduct.productTitle,
                  color: color,
                  textSize: dimensions.getScreenW(25),
                  isTitle: true,
                ),
                const Spacer(),
                HeartWidget(
                  color: color,
                  size: dimensions.getScreenW(20),
                  productId: currentProduct.productid,
                  isInWishlist: isInWishlist,
                ),
              ],
            ),
          ),
          const UpperPart(),
          SizedBox(
            width: dimensions.getScreenW(100),
            child: Row(
              children: [
                AddSubButtons(
                  icon: CupertinoIcons.minus,
                  backColor: Colors.red,
                  press: () {
                    if (_quantityController.text == "1") {
                      return;
                    } else {
                      setState(
                        () {
                          _quantityController.text =
                              (int.parse(_quantityController.text) - 1)
                                  .toString();
                        },
                      );
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
                      focusedBorder:
                          UnderlineInputBorder(borderSide: BorderSide()),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
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
                    setState(() {
                      _quantityController.text =
                          (int.parse(_quantityController.text) + 1).toString();
                    });
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: dimensions.getScreenH(100),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(dimensions.getScreenW(20)),
                    topRight: Radius.circular(dimensions.getScreenW(20)))),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: dimensions.getScreenW(25)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: dimensions.getScreenW(10),
                      ),
                      TextWidget(
                        text: 'Total',
                        color: Colors.red,
                        textSize: dimensions.getScreenW(20),
                        isTitle: true,
                      ),
                      SizedBox(
                        height: dimensions.getScreenW(5),
                      ),
                      TextWidget(
                          text: '\$${totalPrice.toStringAsFixed(2)}',
                          color: color,
                          textSize: dimensions.getScreenW(25)),
                    ],
                  ),
                  const Spacer(),
                  GreenButtonWidget(
                    text: isInCart ? 'In Cart' : 'Add to Cart',
                    press: isInCart
                        ? null
                        : () {
                            final User? user = firebaseAuth.currentUser;
                            if (user == null) {
                              CommonFunction.errorDialog(
                                  context: context,
                                  subTitle: 'Please Login First');
                              return;
                            }
                            cartProvider.addProductsToCart(
                              productId: currentProduct.productid,
                              quantity: int.parse(_quantityController.text),
                            );
                          },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
