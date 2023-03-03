import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';


class AddSubButtons extends StatelessWidget {
  
  const AddSubButtons({
    super.key, required this.icon, required this.backColor, this.press,
  });

  final IconData icon;
  final Color backColor;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(5)),
        child: Container(
          padding: EdgeInsets.all(dimensions.getScreenW(5)),
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(dimensions.getScreenW(12))
          ),
          child: InkWell(
            onTap: press,
            borderRadius: BorderRadius.circular(dimensions.getScreenW(12)),
            child: Icon(icon, color: Colors.white,),
          ),
        ),
      ),
    );
  }
}
