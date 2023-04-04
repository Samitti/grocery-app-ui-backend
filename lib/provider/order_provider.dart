import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  static List<OrderModel> orders = [];

  List<OrderModel> get getOrdersList {
    return orders;
  }

  Future<void> fetchOrders() async {
    if (firebaseAuth.currentUser == null) {
      orders.clear();
      return;
    }
    try {
      User? user = firebaseAuth.currentUser;
      await FirebaseFirestore.instance
          .collection(constOrder)
          .where(constOrderUserId, isEqualTo: user!.uid)
          .get()
          .then((QuerySnapshot ordersSnapshot) {
        // orders = [];
        for (var element in ordersSnapshot.docs) {
          orders.insert(
            0,
            OrderModel(
              orderId: element.get(constOrderId),
              userId: element.get(constOrderUserId),
              userName: element.get(constOrderUserName),
              userAddress: element.get(constOrderUserAddress),
              productId: element.get(constOrderProductId),
              productImageUrl: element.get(constOrderProductImage),
              totalPrice: element.get(constOrderProductPrice),
              productQuantity: element.get(constOrderQuantity),
              orderDate: element.get(constOrderDate),
            ),
          );
        }
      });
      notifyListeners();
    } catch (error) {
      CommonFunction.errorToast(
          error: 'Unable to load your orders! Please try later');
    }
  }
}
