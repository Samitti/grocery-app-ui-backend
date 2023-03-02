
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    super.key,
    required this.color,
    required this.size,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        color: color,
        size: size,
      ),
    );
  }
}
