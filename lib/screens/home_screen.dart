import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_it_solution_assignment/providers/product_provider.dart';

import 'package:real_it_solution_assignment/models/Product.dart';
import 'package:real_it_solution_assignment/screens/cart_screen.dart';
import 'package:real_it_solution_assignment/screens/wishlist_screen.dart';
import 'package:real_it_solution_assignment/widgets/product_card.dart';
import 'package:real_it_solution_assignment/widgets/product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final TextEditingController _searchController = TextEditingController();
  late int index;

  @override
  void initState() {
    super.initState();
    

    Random random = Random();
    index = random.nextInt(15) + 1;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.grey.shade200,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.deepOrangeAccent,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.deepOrangeAccent,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
        ],
        title: const Text(
          "Item Shope",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, _) {
            if (productProvider.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 320,
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: TextFormField(
                              cursorColor: Colors.deepOrange,
                              controller: _searchController,
                              decoration: InputDecoration(
                                focusColor: Colors.deepOrange.shade300,
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                hintText: 'Search...',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () => _searchController.clear(),
                                ),
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {},
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.menu,
                              size: 35,
                              color: Colors.deepOrange,
                            ),
                          
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.deepOrange,
                          size: 50,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (21 / 14),
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            ProductCard(product: products[index]),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Recommended",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ProductTile(product: products[index])
                  ],
                ),
              );
            }
          },
        ),
      ),
    
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
