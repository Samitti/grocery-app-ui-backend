import 'package:flutter/material.dart';
import 'package:grocery/models/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _whislistItems = {};

  Map<String, WishlistModel> get getwhislistItems => _whislistItems;

  void addProductsToWishlist({
    required String productId,
  }) {
    if (_whislistItems.containsKey(productId)) {
      removeOneItem(productId);
      notifyListeners();
    } else {
      _whislistItems.putIfAbsent(
        productId,
        () => WishlistModel(
          id: DateTime.now().toString(),
          productId: productId,
        ),
      );
      notifyListeners();
    }
  }

  void removeOneItem(String productId) {
    _whislistItems.remove(productId);
    notifyListeners();
  }

  void clearWishlist() {
    _whislistItems.clear();
    notifyListeners();
  }
}
