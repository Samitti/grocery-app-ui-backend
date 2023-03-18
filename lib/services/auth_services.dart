import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';

class AuthServices {  
  void createAccountWithEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CommonFunction.errorDialog(
            context: context, subTitle: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CommonFunction.errorDialog(
            context: context,
            subTitle: 'The account already exists for that email.');
      } else if (e.code == 'operation-not-allowed') {
        CommonFunction.errorDialog(
            context: context,
            subTitle: 'There is a problem with auth service config');
      } else {
        CommonFunction.errorDialog(context: context, subTitle: '$e');
        rethrow;
      }
    }
  }
}
