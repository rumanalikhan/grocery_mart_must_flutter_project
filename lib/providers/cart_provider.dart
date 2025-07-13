import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;
  int get cartCount => _cartItems.length;

  double get totalPrice => _cartItems.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  CartProvider() {
    _loadCartFromPrefs();
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    _saveCartToPrefs();
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.id == product.id);
    _saveCartToPrefs();
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _cartItems.any((item) => item.id == product.id);
  }

  void increaseQuantity(Product product) {
    product.quantity++;
    _saveCartToPrefs(); 
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      removeFromCart(product);
      return; 
    }
    _saveCartToPrefs();
    notifyListeners();
  }

  // Persist to SharedPreferences
  void _saveCartToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        _cartItems.map((item) => jsonEncode(item.toMap())).toList();
    prefs.setStringList('cart', cartJson);
  }

  // Load from SharedPreferences
  void _loadCartFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      _cartItems =
          cartJson.map((item) => Product.fromMap(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
