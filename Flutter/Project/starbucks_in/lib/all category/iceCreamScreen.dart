import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/Model/breakfast_model.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
import 'package:starbucks_in/Model/dessert_model.dart';
import 'package:starbucks_in/Model/icecram_model.dart';
import 'package:starbucks_in/all%20category/breakfastScreen.dart';
import 'package:starbucks_in/all%20category/dessertScreen.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/homeScreen.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/Model/productModel.dart';
import 'package:starbucks_in/productInfoScreen.dart';

final List<Product> products = [];

class Icecreamscreen extends StatefulWidget {
  final String? email;
  const Icecreamscreen({super.key, this.email});

  @override
  State<Icecreamscreen> createState() => _IcecreamscreenState();
}

class _IcecreamscreenState extends State<Icecreamscreen> {
  // dynamic product;
  List<BreakfastModel> breakFastList = [];
  List<CoffeeModel> coffeeList = [];
  List<DessertModel> dessertList = [];
  List<IcecreamModel> icecreamList = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await getIceCreamListFromFirebase();
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

//--------------------get cofee list-----------------//

//--------------------get BreakfastListFromFirebase-----------------//
  Future<void> getIceCreamListFromFirebase() async {
    breakFastList.clear();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("ICECREAM").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      icecreamList.add(
        IcecreamModel(
            name: value['name'],
            price: value['price'],
            image_path: value['image_path']),
      );
    }
    log("BreakfastList in function Lenght:${breakFastList.length}");
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
    dynamic product = icecreamList;
    bool isSelected = false;
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const HomeScreen();
                    }));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(
                        "COFFEE",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const Breakfastscreen();
                    }));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(
                        "BREAKFAST",
                        style: TextStyle(color: Colors.black),
                      ),
                      //backgroundColor: isSelected ? Colors.brown : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const Dessertscreen();
                    }));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(
                        "DESSERT",
                        style: TextStyle(color: Colors.black),
                      ),
                      //backgroundColor: isSelected ? Colors.brown : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const Icecreamscreen();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: const Text(
                        "ICECREAM",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: isSelected ? Colors.brown : Colors.grey,
                    ),
                  ),
                ),

                // _buildCategoryChip('COFFEE', true),
                //  _buildCategoryChip('BREAKFAST', false),
                //  _buildCategoryChip('ICECREAM', false),
                // _buildCategoryChip('DESSERTS', false),
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
              itemCount: product.length,
              itemBuilder: (context, index) {
                //final products = product[index];
                return _buildCoffeeGridItem(product[index]);
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: NavigationPage(),
    );
  }

  // Widget _buildCategoryChip(String label, bool isSelected) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: GestureDetector(
  //       onTap: (){

  //       },
  //       child: Chip(
  //         label: Text(
  //           label,
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //         backgroundColor: isSelected ? Colors.brown : Colors.grey,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCoffeeGridItem(dynamic product) {
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
                      //final List<CoffeeModel> favoriteItems = [];
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
