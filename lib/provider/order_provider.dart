import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  static final List<OrderModel> _orders = [];

  List<OrderModel> get getOrdersList {
    return _orders;
  }

  Future<void> fetchOrders({required String userId}) async {
    if (firebaseAuth.currentUser == null) {
      _orders.clear();
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection(constOrder)
          .where(consOrderUserId, isEqualTo: userId)
          .get()
          .then((QuerySnapshot ordersSnapshot) {
        _orders.clear();
        for (var element in ordersSnapshot.docs) {
          _orders.insert(
            0,
            OrderModel(
              orderId: element.get(constOrderId),
              userId: element.get(consOrderUserId),
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
          error: 'Unable to load your previous order item! Please try later');
    }
  }
}
