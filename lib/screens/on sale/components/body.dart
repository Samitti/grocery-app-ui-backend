import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/widgets/on_sale_widget.dart';

class BodyOnSaleScreen extends StatelessWidget {
  const BodyOnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    const bool isSaleEmpty = true;

    return SafeArea(
      child: isSaleEmpty ? Padding(
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
      ):GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        children: List.generate(
          16,
          (index) {
            return const OnSaleWidget();
          },
        ),
      ),
    );
  }
}
