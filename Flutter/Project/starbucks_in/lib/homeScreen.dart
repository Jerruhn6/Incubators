// ignore_for_file: unused_import

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/Model/breakfast_model.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
import 'package:starbucks_in/Model/dessert_model.dart';
import 'package:starbucks_in/Model/icecram_model.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/Model/productModel.dart';
import 'package:starbucks_in/productInfoScreen.dart';

// final List<Product> products = [
//   Product(
//       name: 'Cappuccino',
//       price: '35',
//       imagePath:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHuVUzalj8u6ZhME5u5jBmpj3RmqHfoVhe9dt8TLLgBV-_UN7ZuQ2z8ixJpaONvWLFIoc&usqp=CAU'),
//   Product(
//       name: 'Latte',
//       price: '30',
//       imagePath:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_YMTkc4612BVbFxrUPi7k0qjypWpLlwOVfQ&s'),
//   Product(
//       name: 'Espresso',
//       price: '25',
//       imagePath:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR29C2VVZ3QGzijZLfVrQs6JX6qoZB52Gg4mA&s'),
//   Product(
//       name: 'Mocha',
//       price: '40',
//       imagePath:
//           'https://milkandpop.com/wp-content/uploads/2020/11/mocha-latte-13.jpg'),
//   Product(
//       name: 'Macchiato',
//       price: '38',
//       imagePath:
//           'https://img.freepik.com/premium-photo/coffee-latte-macchiato-with-whipped-cream-coffee-beans-glasses-with-delicious-latte-macchiato-with-coffee-ai-generated_538213-3336.jpg'),
//   Product(
//       name: 'Flat White',
//       price: '32',
//       imagePath:
//           'https://athome.starbucks.com/sites/default/files/styles/recipe_banner_xlarge/public/2024-05/Flatwhite_RecipeHeader_848x539_%402x.jpg.webp?itok=pY1IvezE'),
//   Product(
//       name: 'Americano',
//       price: '28',
//       imagePath:
//           'https://img.freepik.com/premium-photo/classic-americano-coffee-with-milk-gray-background_112304-1304.jpg'),
//   Product(
//       name: 'Affogato',
//       price: '45',
//       imagePath:
//           'https://img.freepik.com/premium-photo/affogato-coffee-with-ice-cream-cup_756748-28005.jpg'),
//   Product(
//       name: 'Irish Coffee',
//       price: '50',
//       imagePath:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRRFJH69N631hJOye4kT1JugZA_IH7mVZtdw&s'),
//   Product(
//       name: 'Cold Brew',
//       price: '35',
//       imagePath:
//           'https://s3.amazonaws.com/shecodesio-production/uploads/files/000/108/829/original/cold_brew_coffee_4_%281%29.jpg?1704066531'),
// ];

final List<Product> products = [];


class HomeScreen extends StatefulWidget {
  final String? email;
  const HomeScreen({super.key, this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BreakfastModel> breakFastList = [];
  List<CoffeeModel> coffeeList = [];
  List<DessertModel> dessertList = [];
  List<IcecreamModel> icecreamList = [];
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await getCoffeeListFromFirebase();
    });
    super.initState();

    // product data added to firebase firestore

    // Future.delayed(Duration.zero, () {
    //   for (int i = 0; i < products.length; i++) {
    //     FirebaseFirestore.instance.collection("products").add({
    //       'name': products[i].name,
    //       'price': products[i].price,
    //       'imagePath': products[i].imagePath
    //     });
    //   }
    // });
  }

  Future<void> getCoffeeListFromFirebase() async {
    coffeeList.clear();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("COFFEE").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      coffeeList.add(
        CoffeeModel(
            name: value['name'],
            price: value['price'],
            image_path: value['image_path']),
      );
    }
    log("coffeeList in function Lenght:${coffeeList.length}");
    setState(() {});
  }

  // Future<void> _addProductsToFirestore() async {
  //   try {
  //     final CollectionReference productsRef = _firestore.collection('products');
  //     for (var product in products) {
  //       await productsRef.add({
  //         'name': product.name,
  //         'price': product.price,
  //         'imagePath': product.imagePath,
  //       });
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Products added to Firestore!')),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to add products: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryChip('COFFEE', true),
                _buildCategoryChip('BREAKFAST', false),
                _buildCategoryChip('ICECREAM', false),
                _buildCategoryChip('DESSERTS', false),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final product = coffeeList[index];
                return _buildCoffeeGridItem(product);
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: NavigationPage(),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: isSelected ? Colors.brown : Colors.grey,
      ),
    );
  }
  Widget _buildCoffeeGridItem(CoffeeModel product) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductInfoScreen(product: product),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(product.image_path, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        product.isFavorite = !product.isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cartProducts.add(Product(
                        name: product.name,
                        price: product.price,
                        image_path: product.image_path,
                      ));
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to Cart')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
