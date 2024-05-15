import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_it_solution_assignment/extension/extension.dart';
import 'package:real_it_solution_assignment/models/Product.dart';
import 'package:real_it_solution_assignment/providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  Product product;
  int quantity;
  CartItem({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
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
                "\$ ${product.price * quantity}",
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(width: 2, color: Colors.grey.shade600)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(13)),
                          child: IconButton(
                            onPressed: () {
                              cartProvider.adjustQuantity(product, 1);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Product added !! '),
                                duration: Duration(seconds: 1),
                              ));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Text(quantity.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(13)),
                          child: IconButton(
                            onPressed: () {
                              cartProvider.adjustQuantity(product, -1);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Product removed : ('),
                                duration: Duration(seconds: 1),
                              ));
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
