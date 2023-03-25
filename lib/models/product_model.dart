import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productid, productTitle, productImageUrl, productCategory;
  final double productPrice, productSalePrice;
  final bool productIsOnSale, productIsPiece;

  ProductModel({
    required this.productid,
    required this.productTitle,
    required this.productImageUrl,
    required this.productCategory,
    required this.productPrice,
    required this.productSalePrice,
    required this.productIsOnSale,
    required this.productIsPiece,
  });

    Map<String, dynamic> toMap() {
    return {
      'id': productid,
      'title': productTitle,
      'price': productPrice,
      'salePrice': productSalePrice,
      'imageUrl': productImageUrl,
      'productCategory': productCategory,
      'isOnSale': productIsOnSale,
      'isPiece': productIsPiece,
    };
  }

  // Converts Firestore data to a Product object
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productid: map['id'],
      productTitle: map['title'],
      productPrice: map['price'],
      productSalePrice: map['salePrice'],
      productImageUrl: map['imageUrl'],
      productCategory: map['productCategory'],
      productIsOnSale: map['isOnSale'],
      productIsPiece: map['isPiece'],
    );
  }
}
