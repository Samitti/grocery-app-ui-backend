import 'package:cloud_firestore/cloud_firestore.dart';

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
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      cart: List.from(data['cart'] ?? []),
      wishlist: List.from(data['wishlist'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'cart': cart,
      'wishlist': wishlist,
      'createdAt': createdAt
    };
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String id;
//   final String name;
//   final String email;
//   final String address;
//   final List<String> cart;
//   final List<String> wishlist;
//   Timestamp createdAt = Timestamp.now();

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.cart,
//     required this.wishlist,
//   });

//   factory UserModel.fromMap(Map<String, dynamic> data) {
//     return UserModel(
//       id: data['id'],
//       name: data['name'],
//       email: data['email'],
//       address: data['address'],
//       cart: List<String>.from(data['cart']),
//       wishlist: List<String>.from(data['wishlist']),
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'address': address,
//       'cart': cart,
//       'wishlist': wishlist,
//       'createdAt': createdAt,
//     };
//   }
// }
