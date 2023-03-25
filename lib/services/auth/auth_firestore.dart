import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/models/user_model.dart';

class AuthFireStore {
  static Future<UserModel?> getUserData(String id) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      if (!doc.exists) {
        return null;
      }
      return UserModel.fromFirestore(doc);
    } on FirebaseException {
      CommonFunction.errorToast(
        error: 'Error Loading Data',
      );
      return null;
    }
  }

  static Future<void> setUserData(String id, UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set(user.toMap());
    } on FirebaseException {
      CommonFunction.errorToast(
        error: 'Error Setting Data',
      );
    }
  }
}
