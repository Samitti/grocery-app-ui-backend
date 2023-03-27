import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getcartItems => _cartItems;

  Future<void> fetchCart() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection(constUser)
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    if (!doc.exists) {
      return;
    }
    final leng = doc.get(constUserCart).length;
    for (int i = 0; i < leng; i++) {
      _cartItems.putIfAbsent(
        doc.get(constUserCart)[i][constCartProductId],
        () => CartModel(
          id: doc.get(constUserCart)[i][constCartId],
          productId: doc.get(constUserCart)[i][constCartProductId],
          quantity: doc.get(constUserCart)[i][constCartQuantity],
        ),
      );
    }
    notifyListeners();
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

  void removeOneItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
