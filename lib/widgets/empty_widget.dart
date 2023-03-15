import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isCat = false;
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    return Padding(
      padding: EdgeInsets.all(dimensions.getScreenW(10)),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(dimensions.getScreenW(50)),
              child: Image.asset("assets/images/box.png"),
            ),
            Text(
              isCat == true ? 'No Products on Sales Yet!\n Stayed Tuned!!' : 'No Product Now\n Stayed Tuned!!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: dimensions.getScreenW(30),
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
