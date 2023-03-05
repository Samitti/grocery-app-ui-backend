import 'package:flutter/material.dart';
import 'package:grocery/screens/signin/component/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/signin";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: BodySignInScreen()),
    );
  }
}