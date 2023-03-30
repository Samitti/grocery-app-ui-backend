import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/services/products/products_firestore.dart';
import 'package:provider/provider.dart';

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
    final wishProvider = Provider.of<WishlistProvider>(context, listen: false);
    return GestureDetector(
      onTap: () async {
        final User? user = firebaseAuth.currentUser;
        if (user == null) {
          CommonFunction.errorToast(
            error: 'Please Login First',
          );
          return;
        }
        if (isInWishlist == false && isInWishlist != null) {
          await ProductFireStore.addProductToUserWishlist(productId: productId);
        } else {
          await wishProvider.deleteWishItem(productId);
        }
        await wishProvider.fetchWish();
      },
      child: Icon(
        isInWishlist! ? IconlyBold.heart : IconlyLight.heart,
        color: isInWishlist! ? Colors.red : color,
        size: size,
      ),
    );
  }
}
