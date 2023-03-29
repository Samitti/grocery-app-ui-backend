import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:uuid/uuid.dart';

class ProductFireStore {

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
  static Future<void> addProductToUserWishlist({
    required String productId,
  }) async {
    try {
      final wishId = const Uuid().v4();
      firebaseFirestore
          .collection(constUser)
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        constUserWishlist: FieldValue.arrayUnion([
          {
            constWishtId: wishId,
            constProductWishId: productId,
          }
        ])
      });
      CommonFunction.errorToast(error: 'Added to wishlist');
    } catch (error) {
      CommonFunction.errorToast(error: '$error');
    }
  }
}
