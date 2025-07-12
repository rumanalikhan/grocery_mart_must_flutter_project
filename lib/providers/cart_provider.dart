import 'package:flutter/material.dart';
import 'package:grocery_mart/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.price);
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners(); 
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _cartItems.contains(product);
  }

  int get cartCount => _cartItems.length;
}
