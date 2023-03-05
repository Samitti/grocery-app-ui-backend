import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? press;
  final String? buttonText;
  final bool isIcon;

  const ButtonWidget({
    super.key,
    required this.press,
    this.buttonText,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        onPressed: press,
        child: isIcon
            ? SizedBox(
                height: dimensions.getScreenW(30),
                width: dimensions.getScreenW(30),
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
