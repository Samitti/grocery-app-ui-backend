import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/user_model.dart';
import 'package:grocery/screens/bottom%20bar/bottom_bar_screen.dart';
import 'package:grocery/screens/fetch/fetch_screen.dart';
import 'package:grocery/screens/signin/signin_screen.dart';
import 'package:grocery/services/auth/auth_firestore.dart';

class AuthServices {
  Future<void> createAccountWithEmailPassword({
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
      AuthFireStore.setUserData(
        firebaseAuth.currentUser!.uid,
        UserModel(
          id: firebaseAuth.currentUser!.uid,
          name: name,
          email: email,
          address: address,
          wishlist: [],
          cart: [],
        ),
      );
      Navigator.pushReplacementNamed(context, SignInScreen.routeName);
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

  Future<void> loginUserWithEmailPassword({
    required String email,
    required String password,
    required context,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, FetchScreen.routeName);
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

  Future<void> signOut({required context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      CommonFunction.errorToast(
        error: 'Logout failed. Please try again.',
      );
    }
  }

  Future<void> signUpWithGoogle({required context}) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw CommonFunction.errorToast(
          error: 'User No Found',
        );
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      if (!doc.exists) {
        await AuthFireStore.setUserData(
          firebaseAuth.currentUser!.uid,
          UserModel(
            id: firebaseAuth.currentUser!.uid,
            name: googleUser.displayName ?? '',
            email: googleUser.email,
            address: '',
            cart: [],
            wishlist: [],
          ),
        );
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
        return;
      } else {
        // CommonFunction.errorToast(
        //   error: 'User Already Found! Please Signin',
        // );
        Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
        return;
      }
    } on FirebaseAuthException catch (e) {
      CommonFunction.errorToast(
        error: '$e',
      );
      rethrow;
    } on PlatformException catch (e) {
      if (e.message == "sign_in_failed") {
        CommonFunction.errorToast(
          error: 'Sign In Failed',
        );
      }
      rethrow;
    }
  }

  // Future<void> signInWithGoogle({required context}) async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       throw CommonFunction.errorToast(
  //         error: 'User No Found',
  //       );
  //     }
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await firebaseAuth.signInWithCredential(credential);
  //     Navigator.pushReplacementNamed(context, BottomBarScreen.routeName);
  //     return;
  //   } on FirebaseAuthException catch (e) {
  //     CommonFunction.errorToast(
  //       error: '$e',
  //     );
  //     rethrow;
  //   }
  // }
}
