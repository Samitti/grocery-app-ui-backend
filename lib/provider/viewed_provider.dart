import 'package:flutter/material.dart';
import 'package:grocery/models/viewed_model.dart';

class ViewedProvider with ChangeNotifier {
  final Map<String, ViwedModel> _viewedItems = {};

  Map<String, ViwedModel> get getviewedItems => _viewedItems;

  void addProductsToHistory({
    required String productId,
  }) {
    _viewedItems.putIfAbsent(
      productId,
      () => ViwedModel(
        id: DateTime.now().toString(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  void clearHistroy() {
    _viewedItems.clear();
    notifyListeners();
  }
}
