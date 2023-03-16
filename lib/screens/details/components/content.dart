import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/screens/cart/components/add_sub_button.dart';
import 'package:grocery/screens/details/components/lower_part.dart';
import 'package:grocery/screens/details/components/upper_part.dart';
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
          LowerPart(totalPrice: totalPrice),
        ],
      ),
    );
  }
}
