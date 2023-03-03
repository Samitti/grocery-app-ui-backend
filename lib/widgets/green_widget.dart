import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/widgets/text_widget.dart';

class GreenButtonWidget extends StatelessWidget {
  const GreenButtonWidget({
    super.key, required this.text, this.press,
  });

  final String text;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(dimensions.getScreenW(8)),
          color: Colors.green),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(dimensions.getScreenW(8)),
        onTap: press,
        child: Padding(
          padding: EdgeInsets.all(dimensions.getScreenW(10)),
          child: TextWidget(
              text: text,
              color: Colors.white,
              textSize: dimensions.getScreenW(20)),
        ),
      ),
    );
  }
}
