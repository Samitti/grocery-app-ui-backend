import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Row(
      children: [
        TextWidget(
          color: Colors.green,
          text: '1.59\$',
          textSize: AppDimensions(context).getScreenW(20),
          isTitle: true,
        ),
        SizedBox(
          width: AppDimensions(context).getScreenW(10),
        ),
        Text(
          '2.59\$',
          style: TextStyle(
            fontSize: 15,
            color: color,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
