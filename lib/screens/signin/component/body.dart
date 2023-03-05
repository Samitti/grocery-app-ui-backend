import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/signin/component/text_fields.dart';
import 'package:grocery/widgets/text_widget.dart';

class BodySignInScreen extends StatelessWidget {
  const BodySignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: dimensions.getScreenH(100),
          ),
          TextWidget(
            text: 'WELCOME BACK',
            color: color,
            textSize: dimensions.getScreenW(30),
            isTitle: true,
          ),
          SizedBox(
            height: dimensions.getScreenH(10),
          ),
          TextWidget(
            text: 'Sigin to continue',
            color: color,
            textSize: dimensions.getScreenW(20),
          ),
          SizedBox(
            height: dimensions.getScreenH(20),
          ),
          const TextFieldSignin(),
        ],
      ),
    );
  }
}
