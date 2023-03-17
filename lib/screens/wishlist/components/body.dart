import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery/provider/wishlist_provider.dart';
import 'package:grocery/screens/wishlist/components/product_container.dart';
import 'package:grocery/widgets/empty_screen_widget.dart';
import 'package:provider/provider.dart';

class BodyWishListScreen extends StatelessWidget {
  const BodyWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItemList =
        wishlistProvider.getwhislistItems.values.toList().reversed.toList();
    if (wishlistItemList.isEmpty) {
      return const EmptyWidget(
        buttonText: 'Add a wish',
        imgPath: 'assets/images/wishlist.png',
        subTitle: 'Explore more and shortlist',
        title: 'Your wishlist is empty!',
      );
    } else {
      return MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: wishlistItemList.length,
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider.value(
            value: wishlistItemList[index],
            child: const ProductContainer(),
          );
        }),
      );
    }
  }
}
