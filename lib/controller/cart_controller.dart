import 'package:flutter/material.dart';
import 'package:prnv_test/model/product_model.dart';

class CartController extends ChangeNotifier {
  List<ProductModel> cartList = [];

  void addToCart(ProductModel product) {
    cartList.add(product);
    for (var i = 0; i < cartList.length; i++) {
      for (var j = i + 1; j < cartList.length; j++) {
        if (cartList[i] == cartList[j]) {
          cartList[i].quantity++;

          cartList.removeAt(j);
        }
      }
    }
    notifyListeners();
  }
}
