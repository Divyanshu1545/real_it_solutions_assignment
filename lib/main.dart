import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_it_solution_assignment/providers/product_provider.dart';
import 'package:real_it_solution_assignment/providers/cart_provider.dart';
import 'package:real_it_solution_assignment/providers/wishlist_provider.dart';

import 'package:real_it_solution_assignment/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider()..fetchProducts(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),ChangeNotifierProvider<WishlistProvider>(
          create: (context) => WishlistProvider()
        )
      ],
      child: MaterialApp(
        title: 'Ecomm Assignment',
        routes: {'home': (context) => const HomeScreen()},
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
