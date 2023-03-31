import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _whislistItems = {};

  Map<String, WishlistModel> get getwhislistItems => _whislistItems;

  Future<void> fetchWish() async {
    if (firebaseAuth.currentUser == null) {
      _whislistItems.clear();
      return;
    }
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection(constUser)
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      if (!doc.exists) {
        return;
      }
      final wishList = doc.get(constUserWishlist);
      wishList.forEach((wishItem) {
        _whislistItems.putIfAbsent(
          wishItem[constProductWishId],
          () => WishlistModel(
            id: wishItem[constWishtId],
            productId: wishItem[constProductWishId],
          ),
        );
      });
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to load item! Please try later');
    }
  }

    Future<void> deleteWishItem(String productId) async {
    if (firebaseAuth.currentUser == null) {
      return;
    }
    try {
      final DocumentReference userDocRef = FirebaseFirestore.instance
          .collection(constUser)
          .doc(firebaseAuth.currentUser!.uid);

      final DocumentSnapshot doc = await userDocRef.get();
      if (!doc.exists) {
        return;
      }

      final wishList = doc.get(constUserWishlist);
      wishList
          .removeWhere((wishItem) => wishItem[constProductWishId] == productId);
      await userDocRef.update({constUserWishlist: wishList});
      _whislistItems.remove(productId);
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to delete item! Please try later');
    }
  }

  Future<void> clearWishlist() async {
    if (firebaseAuth.currentUser == null) {
      _whislistItems.clear();
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection(constUser)
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        constUserWishlist: [],
      });
      _whislistItems.clear();
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to delete items! Please try later');
    }
  }
}
