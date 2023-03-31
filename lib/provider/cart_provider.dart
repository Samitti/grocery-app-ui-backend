import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getcartItems => _cartItems;

  Future<void> fetchCart() async {
    if (firebaseAuth.currentUser == null) {
      _cartItems.clear();
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
      final cartList = doc.get(constUserCart);
      cartList.forEach((cartItem) {
        _cartItems.putIfAbsent(
          cartItem[constCartProductId],
          () => CartModel(
            id: cartItem[constCartId],
            productId: cartItem[constCartProductId],
            quantity: cartItem[constCartQuantity],
          ),
        );
      });
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to load your cart item! Please try later');
    }
  }

  Future<void> deleteCartItem(String productId) async {
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

      final cartList = doc.get(constUserCart);
      cartList
          .removeWhere((cartItem) => cartItem[constCartProductId] == productId);
      await userDocRef.update({constUserCart: cartList});
      _cartItems.remove(productId);
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to delete item! Please try later');
    }
  }

  Future<void> clearCart() async {
    if (firebaseAuth.currentUser == null) {
      _cartItems.clear();
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection(constUser)
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        constUserCart: [],
      });
      _cartItems.clear();
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to delete items! Please try later');
    }
  }

  void minusQuantity(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: value.productId,
        quantity: value.quantity - 1,
      ),
    );
    notifyListeners();
  }

  void plusQuantity(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: value.productId,
        quantity: value.quantity + 1,
      ),
    );
    notifyListeners();
  }
}
