import 'package:flutter/material.dart';
import 'package:grocery/screens/forget/component/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = "/forgetpassword";
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyForgetPasswordScreen(),
    );
  }
}