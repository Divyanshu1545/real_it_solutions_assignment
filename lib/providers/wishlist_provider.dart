import 'package:flutter/material.dart';
import 'package:real_it_solution_assignment/models/Product.dart';

class WishlistProvider extends ChangeNotifier {
  List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  void addToWishlist(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }

  void removeFromWishlist(Product product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  bool isInWishlist(Product product) {
    return _wishlist.contains(product);
  }
}
