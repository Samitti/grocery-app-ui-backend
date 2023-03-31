import 'package:flutter/material.dart';
import 'package:grocery/models/order_model.dart';

class ProductProvider with ChangeNotifier {
  static final List<OrderModel> _orders = [];

  List<OrderModel> get getProducts {
    return _orders;
  }
}
