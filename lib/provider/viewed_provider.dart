import 'package:flutter/material.dart';
import 'package:grocery/models/viewed_model.dart';

class ViewedProvider with ChangeNotifier {
  final Map<String, ViewedModel> _viewedItems = {};

  Map<String, ViewedModel> get getviewedItems => _viewedItems;

  void addProductsToHistory({
    required String productId,
  }) {
    _viewedItems.putIfAbsent(
      productId,
      () => ViewedModel(
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
