import 'package:flutter/material.dart';
import 'package:real_it_solution_assignment/models/Product.dart';

class CartProvider extends ChangeNotifier {
  final Map<Product, int> _cartProducts = {};

  Map<Product, int> get cartProducts => _cartProducts;

  void addToCart(Product product, int quantity) {
    if (quantity <= 0) return;

    if (_cartProducts.containsKey(product)) {
      _cartProducts[product] = _cartProducts[product]! + quantity;
    } else {
      _cartProducts[product] = quantity;
    }
    print(cartProducts);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cartProducts.clear();
    notifyListeners();
  }

  int getTotalItemsInCart() {
    return _cartProducts.values.fold(0, (prev, curr) => prev + curr);
  }

  void adjustQuantity(Product product, int qty) {
    if (_cartProducts[product] != null && _cartProducts[product]! + qty == 0) {
      removeFromCart(product);
      notifyListeners();
    } else {
      _cartProducts[product] = _cartProducts[product]! + qty;
      notifyListeners();
    }
  }

  double getTotalPriceInCart() {
    double totalPrice = 0.0;
    _cartProducts.forEach((product, quantity) {
      totalPrice += product.price * quantity;
    });
    return totalPrice;
  }
}
