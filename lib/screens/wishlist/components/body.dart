import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery/screens/wishlist/components/product_container.dart';

class BodyWishListScreen extends StatelessWidget {
  const BodyWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: ((context, index) {
        return const ProductContainer();
      }),
    );
  }
}
