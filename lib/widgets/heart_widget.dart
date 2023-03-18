import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/provider/wishlist_provider.dart';
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
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return GestureDetector(
      onTap: () {
        final User? user = firebaseAuth.currentUser;
        if (user == null) {
          CommonFunction.errorDialog(context: context, subTitle: 'Please Login First');
          return;
        }
        wishlistProvider.addRemoveProductsToWishlist(productId: productId);
      },
      child: Icon(
        isInWishlist! ? IconlyBold.heart : IconlyLight.heart,
        color: isInWishlist! ? Colors.red : color,
        size: size,
      ),
    );
  }
}
