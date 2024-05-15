import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_it_solution_assignment/extension/extension.dart';
import 'package:real_it_solution_assignment/models/Product.dart';



class ProductTile extends StatelessWidget {
  Product product;
  ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 80,
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: Text(
                        product.category.toCapitalized(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ),
                    Text(
                      product.rating.rate.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 15),
                    Icon(Icons.remove_red_eye_rounded,
                        color: Colors.grey.shade700, size: 16),
                    const SizedBox(width: 4),
                    Text(product.rating.count.toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}






// Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(
//                       width: 150,
//                       child: Text(
//                         product.title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                             fontSize: 17, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Text(
//                       '\$ ${product.price}',
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       product.category.toCapitalized(),
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey.shade500),
//                     ),
//                     SizedBox(
//                       width: 60,
//                     ),
//                     Text(
//                       product.rating.rate.toString(),
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     const SizedBox(width: 4),
//                     const Icon(Icons.star, color: Colors.amber, size: 16),
//                     const SizedBox(width: 15),
//                     Icon(Icons.remove_red_eye_rounded,
//                         color: Colors.grey.shade700, size: 16),
//                     const SizedBox(width: 4),
//                     Text(product.rating.count.toString()),
//                   ],
//                 ),
//               ],
//             )