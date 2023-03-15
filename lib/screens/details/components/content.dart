import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/screens/cart/components/add_sub_button.dart';
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
    final currentProduct = productProvider.findById(productId);
    final double price = currentProduct.productIsOnSale
        ? currentProduct.productSalePrice
        : currentProduct.productPrice;
    final totalPrice = price * int.parse(_quantityController.text);
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
                  press: () {},
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: dimensions.getScreenH(100),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
              child: Row(
                children: [
                  TextWidget(
                    text: '\$${price.toStringAsFixed(2)}/',
                    color: Colors.green,
                    textSize: dimensions.getScreenW(25),
                    isTitle: true,
                  ),
                  TextWidget(
                    text: currentProduct.productIsPiece ? 'Piece' : '/KG',
                    color: color,
                    textSize: dimensions.getScreenW(15),
                    isTitle: false,
                  ),
                  SizedBox(
                    width: dimensions.getScreenW(10),
                  ),
                  Visibility(
                    visible: currentProduct.productIsOnSale ? true : false,
                    child: Text(
                      '\$${currentProduct.productPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: dimensions.getScreenW(20),
                        color: color,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GreenButtonWidget(
                    text: 'Free Delivery',
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
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
                      setState(() {
                        _quantityController.text =
                            (int.parse(_quantityController.text) - 1)
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
                    text: 'Add to Cart',
                    press: () {},
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
