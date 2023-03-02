import 'package:flutter/material.dart';

class CommonFunction{
  static void negivateToPage({required BuildContext context, required String routeName}){
    Navigator.pushNamed(context, routeName);
  }
}