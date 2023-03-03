import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class CommonFunction {
  static void navigateToPage(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static AppBar appBar(BuildContext context, String text){
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(dimensions.getScreenW(20.0)))),
        color: color,
        onPressed: () {
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        },
        icon: const Icon(IconlyLight.arrowLeft2),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: TextWidget(
        text: text,
        color: color,
        textSize: dimensions.getScreenW(22),
        isTitle: true,
      ),
    );
  }
}
