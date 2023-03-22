import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';
import 'package:grocery/services/auth/auth_firestore.dart';

class AuthServices {
  void createAccountWithEmailPassword({
    required String email,
    required String password,
    required context,
    required String name,
    required String address,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AuthFireStore()
          .saveDataToFireStore(name: name, email: email, address: address);
      Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CommonFunction.errorToast(
          error: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        CommonFunction.errorToast(
          error: 'The account already exists for that email.',
        );
      } else if (e.code == 'operation-not-allowed') {
        CommonFunction.errorToast(
          error: 'There is a problem with auth service config.',
        );
      } else {
        CommonFunction.errorToast(
          error: '$e',
        );
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
        CommonFunction.errorToast(
          error: 'The password provided is wrong.',
        );
      } else if (e.code == 'user-not-found') {
        CommonFunction.errorToast(
          error: 'No user found with this email.',
        );
      } else if (e.code == 'user-disabled') {
        CommonFunction.errorToast(
          error: 'User disabled.',
        );
      } else if (e.code == 'invalid-email') {
        CommonFunction.errorToast(
          error: 'Email address is invalid.',
        );
      } else {
        CommonFunction.errorToast(
          error: 'Login failed. Please try again.',
        );
      }
    }
  }

  void signOut({required context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      CommonFunction.errorToast(
        error: 'Logout failed. Please try again.',
      );
    }
  }

  Future<void> googleSignIn({required context}) async {
    try {
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
      await auth.signInWithCredential(credential);
      AuthFireStore().saveDataToFireStore(
        name: googleSignInAccount.displayName!,
        email: googleSignInAccount.email,        
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomBarScreen(),
        ),
      );
    } on FirebaseException catch (error) {
      CommonFunction.errorToast(
        error: '${error.message}',
      );
    } catch (error) {
      CommonFunction.errorToast(
        error: '$error',
      );
    }
  }
}
