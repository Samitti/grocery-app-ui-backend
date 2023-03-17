import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/wishlist/components/body.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static String routeName = "/wishlist";
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItemList =
        wishlistProvider.getwhislistItems.values.toList().reversed.toList();
    return Scaffold(
      appBar: wishlistItemList.isEmpty
          ? null
          : CommonFunction.appBar(
              context: context,
              text: 'WishList (${wishlistItemList.length})',
              isSuffix: true,
              isLeading: true,
              suffixPress: () async {
                await CommonFunction.warningDialog(
                  context: context,
                  text: 'Empty your wishlist',
                  subTitle: 'Are you sure?',
                  press: () {
                    wishlistProvider.clearWishlist();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                );
              },
            ),
      body: const BodyWishListScreen(),
    );
  }
}
