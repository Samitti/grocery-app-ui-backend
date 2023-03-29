import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/services/products/products_firestore.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    super.key,
    required this.color,
    required this.size,
    required this.productId,
    this.isInWishlist = false,
  });

  final Color color;
  final double size;
  final String productId;
  final bool? isInWishlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final User? user = firebaseAuth.currentUser;
        if (user == null) {
          CommonFunction.errorToast(
            error: 'Please Login First',
          );
          return;
        }
        ProductFireStore.addProductToUserWishlist(productId: productId);
      },
      child: Icon(
        isInWishlist! ? IconlyBold.heart : IconlyLight.heart,
        color: isInWishlist! ? Colors.red : color,
        size: size,
      ),
    );
  }
}
