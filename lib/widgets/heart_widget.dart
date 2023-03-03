
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    super.key,
    required this.color,
    required this.size, this.press,
  });

  final Color color;
  final double size;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Icon(
        IconlyLight.heart,
        color: color,
        size: size,
      ),
    );
  }
}
