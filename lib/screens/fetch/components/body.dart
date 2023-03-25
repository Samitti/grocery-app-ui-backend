import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BodyFechingScreen extends StatelessWidget {
  const BodyFechingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/landing/buyfood.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        const Center(
          child: SpinKitFadingFour(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
