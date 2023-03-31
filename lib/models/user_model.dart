import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/constants/firebase_constant.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String address;
  final List cart;
  final List wishlist;
  final Timestamp createdAt = Timestamp.now();

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.cart,
    required this.wishlist,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      name: data[constUserName] ?? '',
      email: data[constUserEmail] ?? '',
      address: data[constUserAddress] ?? '',
      cart: List.from(data[constUserCart] ?? []),
      wishlist: List.from(data[constUserWishlist] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      constUserId: id,
      constUserName: name,
      constUserEmail: email,
      constUserAddress: address,
      constUserCart: cart,
      constUserWishlist: wishlist,
      'createdAt': createdAt
    };
  }
}
