import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/constants/firebase_constant.dart';

class AuthFireStore {
  void saveDataToFireStore({
    required String name,
    required String email,
    String? address
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .set({
      'id': firebaseAuth.currentUser!.uid,
      'name': name,
      'email': email,
      'shipping-address': address,
      'userWish': [],
      'userCart': [],
      'createdAt': Timestamp.now(),
    });
  }
}
