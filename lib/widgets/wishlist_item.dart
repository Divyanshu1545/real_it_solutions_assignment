import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_it_solution_assignment/extension/extension.dart';
import 'package:real_it_solution_assignment/models/Product.dart';
import 'package:real_it_solution_assignment/providers/cart_provider.dart';
import 'package:real_it_solution_assignment/providers/wishlist_provider.dart';
import 'package:real_it_solution_assignment/providers/wishlist_provider.dart';
import 'package:real_it_solution_assignment/providers/wishlist_provider.dart';

class WishListItem extends StatelessWidget {
  Product product;

  WishListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: true);
    return Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            height: 130,
            width: 140,
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  child: Text(
                    product.title,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  width: 150,
                  child: Text(
                    product.category.toTitleCase(),
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  )),
              Text(
                "\$ ${product.price}",
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: GestureDetector(
              onTap: () {
                wishlistProvider.removeFromWishlist(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Item removed from wishlist'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: 50,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(width: 2, color: Colors.grey.shade600)),
                child: Icon(Icons.delete_rounded, color: Colors.grey.shade600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
