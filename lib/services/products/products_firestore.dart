import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:uuid/uuid.dart';

class ProductFireStore {
  static Future<void> deleteProduct(String productId) async {
    final collection = FirebaseFirestore.instance.collection('products');
    final document = collection.doc(productId);
    await document.delete();
  }
  static Future<void> addProductToUserCart({
    required String productId,
    required int quantity,
  }) async {
    try {
      final cartId = const Uuid().v4();
      firebaseFirestore
          .collection(constUser)
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        constUserCart: FieldValue.arrayUnion([
          {
            constCartId: cartId,
            constCartProductId: productId,
            constCartQuantity: quantity
          }
        ])
      });
      CommonFunction.errorToast(error: 'Added to cart');
    } catch (error) {
      CommonFunction.errorToast(error: '$error');
    }
  }
}
