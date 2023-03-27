import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  static final List<ProductModel> _products = [];
  static List<ProductModel> listBySearch = [];

  List<ProductModel> get bySearch {
    return listBySearch;
  }

  List<ProductModel> get getProducts {
    return _products;
  }

  Future<void> fetchProducts() async {
    await firebaseFirestore
        .collection(constProduct)
        .get()
        .then((QuerySnapshot productSnapshot) {
      for (var element in productSnapshot.docs) {
        _products.insert(
            0,
            ProductModel(
              productid: element.get(constProductId),
              productTitle: element.get(constProductTitle),
              productImageUrl: element.get(constProductImage),
              productCategory: element.get(constProductCategory),
              productPrice: double.parse(
                element.get(constProductPrice).toString(),
              ),
              productSalePrice: double.parse(
                element.get(constProductPriceSale).toString(),
              ),
              productIsOnSale: element.get(constProductIsOnSale),
              productIsPiece: element.get(constProductIsPiece),
            ));
      }
    });
    notifyListeners();
  }

  List<ProductModel> get onSale {
    return _products.where((element) => element.productIsOnSale).toList();
  }

  ProductModel findById(String productid) {
    return _products.firstWhere((element) => element.productid == productid);
  }

  List<ProductModel> findByCategory(String productCategory) {
    final cateoryList = _products
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(productCategory.toLowerCase()))
        .toList();
    return cateoryList;
  }

  List<ProductModel> searchQuery(String searchText) {
    listBySearch = _products
        .where(
          (element) => element.productTitle.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return listBySearch;
  }

  // static final List<ProductModel> _products = [
  //   ProductModel(
  //     productid: 'Apricot',
  //     productTitle: 'Apricot',
  //     productPrice: 0.99,
  //     productSalePrice: 0.49,
  //     productImageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
  //     productCategory: 'Fruits',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Avocado',
  //     productTitle: 'Avocado',
  //     productPrice: 0.88,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/9VKXw5L/Avocat.png',
  //     productCategory: 'Fruits',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Black grapes',
  //     productTitle: 'Black grapes',
  //     productPrice: 1.22,
  //     productSalePrice: 0.7,
  //     productImageUrl: 'https://i.ibb.co/c6w5zrC/Black-Grapes-PNG-Photos.png',
  //     productCategory: 'Fruits',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Fresh_green_grape',
  //     productTitle: 'Fresh green grape',
  //     productPrice: 1.5,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/HKx2bsp/Fresh-green-grape.png',
  //     productCategory: 'Fruits',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Green grape',
  //     productTitle: 'Green grape',
  //     productPrice: 0.99,
  //     productSalePrice: 0.4,
  //     productImageUrl: 'https://i.ibb.co/bHKtc33/grape-green.png',
  //     productCategory: 'Fruits',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Red apple',
  //     productTitle: 'Red apple',
  //     productPrice: 0.6,
  //     productSalePrice: 0.2,
  //     productImageUrl: 'https://i.ibb.co/crwwSG2/red-apple.png',
  //     productCategory: 'Fruits',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   // Vegi
  //   ProductModel(
  //     productid: 'Carottes',
  //     productTitle: 'Carottes',
  //     productPrice: 0.99,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/TRbNL3c/Carottes.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Cauliflower',
  //     productTitle: 'Cauliflower',
  //     productPrice: 1.99,
  //     productSalePrice: 0.99,
  //     productImageUrl: 'https://i.ibb.co/xGWf2rH/Cauliflower.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Cucumber',
  //     productTitle: 'Cucumber',
  //     productPrice: 0.99,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/kDL5GKg/cucumbers.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Jalape',
  //     productTitle: 'Jalape',
  //     productPrice: 1.99,
  //     productSalePrice: 0.89,
  //     productImageUrl: 'https://i.ibb.co/Dtk1YP8/Jalape-o.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Long yam',
  //     productTitle: 'Long yam',
  //     productPrice: 2.99,
  //     productSalePrice: 1.59,
  //     productImageUrl: 'https://i.ibb.co/V3MbcST/Long-yam.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Onions',
  //     productTitle: 'Onions',
  //     productPrice: 0.59,
  //     productSalePrice: 0.28,
  //     productImageUrl: 'https://i.ibb.co/GFvm1Zd/Onions.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Plantain-flower',
  //     productTitle: 'Plantain-flower',
  //     productPrice: 0.99,
  //     productSalePrice: 0.389,
  //     productImageUrl: 'https://i.ibb.co/RBdq0PD/Plantain-flower.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Potato',
  //     productTitle: 'Potato',
  //     productPrice: 0.99,
  //     productSalePrice: 0.59,
  //     productImageUrl: 'https://i.ibb.co/wRgtW55/Potato.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Radish',
  //     productTitle: 'Radish',
  //     productPrice: 0.99,
  //     productSalePrice: 0.79,
  //     productImageUrl: 'https://i.ibb.co/YcN4ZsD/Radish.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Red peppers',
  //     productTitle: 'Red peppers',
  //     productPrice: 0.99,
  //     productSalePrice: 0.57,
  //     productImageUrl: 'https://i.ibb.co/JthGdkh/Red-peppers.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Squash',
  //     productTitle: 'Squash',
  //     productPrice: 3.99,
  //     productSalePrice: 2.99,
  //     productImageUrl: 'https://i.ibb.co/p1V8sq9/Squash.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: true,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Tomatoes',
  //     productTitle: 'Tomatoes',
  //     productPrice: 0.99,
  //     productSalePrice: 0.39,
  //     productImageUrl: 'https://i.ibb.co/PcP9xfK/Tomatoes.png',
  //     productCategory: 'Vegetables',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  //   // Grains
  //   ProductModel(
  //     productid: 'Corn-cobs',
  //     productTitle: 'Corn-cobs',
  //     productPrice: 0.29,
  //     productSalePrice: 0.19,
  //     productImageUrl: 'https://i.ibb.co/8PhwVYZ/corn-cobs.png',
  //     productCategory: 'Grains',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Peas',
  //     productTitle: 'Peas',
  //     productPrice: 0.99,
  //     productSalePrice: 0.49,
  //     productImageUrl: 'https://i.ibb.co/7GHM7Dp/peas.png',
  //     productCategory: 'Grains',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   // Herbs
  //   ProductModel(
  //     productid: 'Asparagus',
  //     productTitle: 'Asparagus',
  //     productPrice: 6.99,
  //     productSalePrice: 4.99,
  //     productImageUrl: 'https://i.ibb.co/RYRvx3W/Asparagus.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: false,
  //     productIsPiece: false,
  //   ),
  //   ProductModel(
  //     productid: 'Brokoli',
  //     productTitle: 'Brokoli',
  //     productPrice: 0.99,
  //     productSalePrice: 0.89,
  //     productImageUrl: 'https://i.ibb.co/KXTtrYB/Brokoli.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: true,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Buk-choy',
  //     productTitle: 'Buk-choy',
  //     productPrice: 1.99,
  //     productSalePrice: 0.99,
  //     productImageUrl: 'https://i.ibb.co/MNDxNnm/Buk-choy.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: true,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Chinese-cabbage-wombok',
  //     productTitle: 'Chinese-cabbage-wombok',
  //     productPrice: 0.99,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/7yzjHVy/Chinese-cabbage-wombok.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Kangkong',
  //     productTitle: 'Kangkong',
  //     productPrice: 0.99,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/HDSrR2Y/Kangkong.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Leek',
  //     productTitle: 'Leek',
  //     productPrice: 0.99,
  //     productSalePrice: 0.5,
  //     productImageUrl: 'https://i.ibb.co/Pwhqkh6/Leek.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: false,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Spinach',
  //     productTitle: 'Spinach',
  //     productPrice: 0.89,
  //     productSalePrice: 0.59,
  //     productImageUrl: 'https://i.ibb.co/bbjvgcD/Spinach.png',
  //     productCategory: 'Herbs',
  //     productIsOnSale: true,
  //     productIsPiece: true,
  //   ),
  //   ProductModel(
  //     productid: 'Almond',
  //     productTitle: 'Almond',
  //     productPrice: 8.99,
  //     productSalePrice: 6.5,
  //     productImageUrl: 'https://i.ibb.co/c8QtSr2/almand.jpg',
  //     productCategory: 'Nuts',
  //     productIsOnSale: true,
  //     productIsPiece: false,
  //   ),
  // ];
}
