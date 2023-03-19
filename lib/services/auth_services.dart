import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';

class AuthServices {
  void createAccountWithEmailPassword({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
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
    required context,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
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

  void signOut({required context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      CommonFunction.errorDialog(
          context: context, subTitle: 'Logout failed. Please try again.');
    }
  }

  Future<void> googleSignIn({required context}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      await auth.signInWithCredential(credential);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomBarScreen(),
        ),
      );
    } on FirebaseException catch (error) {
      CommonFunction.errorDialog(
          context: context, subTitle: '${error.message}');
    } catch (error) {
      CommonFunction.errorDialog(
          context: context, subTitle: '$error');
    }
  }
}
