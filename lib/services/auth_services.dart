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

  void loginUserWithEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        CommonFunction.errorDialog(
            context: context, subTitle: 'The password provided is wrong.');
      } else if (e.code == 'user-not-found') {
        CommonFunction.errorDialog(
            context: context, subTitle: 'No user found with this email.');
      } else if (e.code == 'user-disabled') {
        CommonFunction.errorDialog(
            context: context, subTitle: 'User disabled.');
      } else if (e.code == 'invalid-email') {
        CommonFunction.errorDialog(
            context: context, subTitle: 'Email address is invalid.');
      } else {
        CommonFunction.errorDialog(
            context: context, subTitle: 'Login failed. Please try again.');
        rethrow;
      }
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
