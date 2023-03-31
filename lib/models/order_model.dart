import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel with ChangeNotifier {
  final String orderId;
  final String userId;
  final String userName;
  final String productID;
  final String productImageUrl;
  final String productPrice;
  final String productQuantity;
  final Timestamp orderDate;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.productID,
    required this.productImageUrl,
    required this.productPrice,
    required this.productQuantity,
    required this.orderDate,
  });
}
