import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';

class EmptyOnSale extends StatelessWidget {
  const EmptyOnSale({super.key});

  @override
  Widget build(BuildContext context) {
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
              'No Products on Sales Yet!\n Stayed Tuned!!',
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
