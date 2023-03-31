import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/firebase_constant.dart';

class OrderModel with ChangeNotifier {
  final String orderId;
  final String userId;
  final String userName;
  final String userAddress;
  final String productId;
  final String productImageUrl;
  final String totalPrice;
  final String productQuantity;
  final Timestamp orderDate = Timestamp.now();

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.userAddress,
    required this.productId,
    required this.productImageUrl,
    required this.totalPrice,
    required this.productQuantity,
  });

  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      orderId: doc.id,
      userId: data[consOrderUserId] ?? '',
      userName: data[constOrderUserName] ?? '',
      userAddress: data[constOrderUserAddress] ?? '',
      productId: data[constOrderProductId] ?? '',
      productImageUrl: data[constOrderProductImage] ?? '',
      totalPrice: data[constOrderProductPrice] ?? '',
      productQuantity: data[constOrderQuantity] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      constOrderId: orderId,
      consOrderUserId: userId,
      constOrderUserName: userName,
      constOrderUserAddress: userAddress,
      constOrderProductId: productId,
      constOrderProductImage: productImageUrl,
      constOrderProductPrice: totalPrice,
      constOrderQuantity: productQuantity,
      'createdAt': orderDate
    };
  }
}
