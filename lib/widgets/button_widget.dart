import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? press;
  final String? buttonText;
  final Color primayColor;
  final bool isIcon;

  const ButtonWidget({
    super.key,
    required this.press,
    this.buttonText,
    this.primayColor = Colors.white38,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primayColor,
        ),
        onPressed: press,
        child: isIcon
            ? SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/images/google.png"),
              ):  
            TextWidget(
                text: buttonText!,
                color: Colors.black,
                textSize: dimensions.getScreenW(20),
              )
      ),
    );
  }
}
