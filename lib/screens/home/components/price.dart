import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;
  const PriceWidget({super.key, required this.salePrice, required this.price, required this.textPrice, required this.isOnSale});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double userPrice = isOnSale ? salePrice : price;
    return Row(
      children: [
        TextWidget(
          color: Colors.green,
          text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
          textSize: AppDimensions(context).getScreenW(20),
          isTitle: true,
        ),
        SizedBox(
          width: AppDimensions(context).getScreenW(8),
        ),
        Visibility(
          visible: isOnSale ? true : false,
          child: Text(
            '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: AppDimensions(context).getScreenW(15),
              color: color,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
      ],
    );
  }
}
