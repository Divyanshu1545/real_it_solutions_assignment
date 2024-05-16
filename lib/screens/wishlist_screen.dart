import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_it_solution_assignment/providers/wishlist_provider.dart';
import 'package:real_it_solution_assignment/widgets/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'WishList',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: (wishlistProvider.wishlist.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Please Add something in the wishlist.",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    itemCount: wishlistProvider.wishlist.length,
                    itemBuilder: (context, index) {
                      final product = wishlistProvider.wishlist[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: WishListItem(
                          product: product,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
