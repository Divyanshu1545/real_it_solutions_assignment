
import 'package:http/http.dart' as http;
import 'package:real_it_solution_assignment/models/Product.dart';
import 'dart:convert';

import 'package:flutter/material.dart';





class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _products = data.map((item) => Product.fromJson(item)).toList();
      } else {
        _products = []; 
      }
    } catch (e) {
      _products = []; 
    }
    notifyListeners(); 
  }
}
