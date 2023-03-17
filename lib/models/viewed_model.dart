import 'package:flutter/material.dart';

class ViwedModel with ChangeNotifier {
  final String id, productId;

  ViwedModel({
    required this.id,
    required this.productId,
  });
}
