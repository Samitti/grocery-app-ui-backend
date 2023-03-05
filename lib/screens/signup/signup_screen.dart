import 'package:flutter/material.dart';
import 'package:grocery/screens/signup/component/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: BodySignUpScreen()),
    );
  }
}