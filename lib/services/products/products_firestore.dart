import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/models/product_model.dart';

class ProductFireStore {

  static Future<List<ProductModel>> getProducts() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromMap(doc.data()))
          .toList();
      return products;
    } catch (error) {
      CommonFunction.errorToast(error: 'Error Loading Product');
      rethrow;
    }
  }

  static Future<ProductModel?> getProductById(String productId) async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();
      if (documentSnapshot.exists) {
        final product = ProductModel.fromMap(documentSnapshot.data()!);
        return product;
      } else {
        return null;
      }
    } catch (error) {
      CommonFunction.errorToast(error: 'Error Loading Product');
      rethrow;
    }
  }

  static Future<void> editProduct(ProductModel product) async {
    final collection = FirebaseFirestore.instance.collection('products');
    final document = collection.doc(product.productid);
    await document.update({
      'title': product.productTitle,
      'price': product.productPrice,
      'salePrice': product.productSalePrice,
      'imageUrl': product.productImageUrl,
      'productCategory': product.productCategory,
      'isOnSale': product.productIsOnSale,
      'isPiece': product.productIsPiece,
    });
  }

  static Future<void> deleteProduct(String productId) async {
    final collection = FirebaseFirestore.instance.collection('products');
    final document = collection.doc(productId);
    await document.delete();
  }
}
