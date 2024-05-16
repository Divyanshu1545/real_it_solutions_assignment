import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_it_solution_assignment/models/Product.dart';
import 'package:real_it_solution_assignment/providers/wishlist_provider.dart';
import 'package:real_it_solution_assignment/screens/product_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 5),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                        strokeWidth: 2,
                      ),
                    ),
                    fit: BoxFit.scaleDown,
                    height: 130,
                    imageUrl: product.image,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        '\$ ${product.price}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  product.rating.rate.toString(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.remove_red_eye_rounded,
                                    color: Colors.grey.shade700, size: 16),
                                const SizedBox(width: 4),
                                Text(product.rating.count.toString()),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: (wishlistProvider.isInWishlist(product))
                  ? IconButton(
                      icon: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.deepOrangeAccent,
                        size: 25,
                      ),
                      onPressed: () {
                        wishlistProvider.removeFromWishlist(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Removed from wishlist !!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.deepOrangeAccent,
                        size: 25,
                      ),
                      onPressed: () {
                        wishlistProvider.addToWishlist(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to Wishlist !!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
