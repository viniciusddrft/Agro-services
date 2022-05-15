import 'package:flutter/material.dart';

class HomeController {
  final ValueNotifier<int> numberOfItemsInCart = ValueNotifier<int>(0);

  void addToCart() {
    numberOfItemsInCart.value++;
  }

  void dispose() {
    numberOfItemsInCart.dispose();
  }
}
