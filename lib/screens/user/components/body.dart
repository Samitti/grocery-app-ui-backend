import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/screens/user/components/tiles_user.dart';

class BodyUserScreen extends StatelessWidget {
  const BodyUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: dimensions.getScreenH(30)),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TilesUser(),
            ],
          ),
        ),
      ),
    );
  }
}
