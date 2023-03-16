import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/widgets/green_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({
    super.key,
  });

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
    return SizedBox(
      width: double.infinity,
      height: dimensions.getScreenH(100),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
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
    );
  }
}
