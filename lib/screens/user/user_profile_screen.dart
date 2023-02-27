import 'package:flutter/material.dart';
import 'package:grocery/screens/user/components/body.dart';

class UserProfileScreen extends StatelessWidget {

  static String routeName = "/userprofile";

  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyUserScreen()
    );
  }
}