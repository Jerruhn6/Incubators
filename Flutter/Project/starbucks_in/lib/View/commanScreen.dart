import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:starbucks_in/Model/favModel.dart';
import 'package:starbucks_in/favorite_screen.dart';

import 'package:starbucks_in/productInfoScreen.dart';

dynamic list2;
String? appBarTitle;

class Commanscreen extends StatefulWidget {
  final dynamic list;
  final String title;
  Commanscreen({super.key, required this.list, required this.title}) {
    list2 = list;
    appBarTitle = title;
  }

  @override
  State<Commanscreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<Commanscreen> {

  bool changeColour = false;
  final dynamic favProducts = [];
  final dynamic products = list2;
  final Set<int> favoriteIndices = {};
  final Set<int> basketIndices = {};

  QuerySnapshot? response;
  // Function to add product to the list and store it to Firebase
  void addToFavorites(FavModel product2) async {
    // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    try {
      await FirebaseFirestore.instance
          .collection("favourites")
          .add(product2.toMap());
      // Add the product to the 'favorites' collection in Firebase
      // await _dbRef.child('favorites').push().set(product.toMap());
      print("Product added to favorites successfully.");
    } catch (e) {
      print("Error adding product to favorites: $e");
    }
  }

  void addToBasket(FavModel product2) async {
    // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    try {
      await FirebaseFirestore.instance
          .collection("basket")
          .add(product2.toMap());
      // Add the product to the 'favorites' collection in Firebase
      // await _dbRef.child('favorites').push().set(product.toMap());
      print("Product added to favorites successfully.");
    } catch (e) {
      print("Error adding product to favorites: $e");
    }
  }


  //----------------------------get data---------------------------------//

  @override
  Widget build(BuildContext context) {
    dynamic products = list2;
    bool isSelected = false;
    return Scaffold(
       appBar: AppBar(
        title: Text(
          appBarTitle!,
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 2,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                size: 24, color: Colors.white)),
        actions: [
          
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                //return SofaScreen();
                return const FavoriteScreen();
              }));
            },
            icon: Stack(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 30,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 6.8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${wishlist.length}',
                      style: GoogleFonts.quicksand(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // onPressed: () {},
          ),
        ],
      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all( 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length!,
              itemBuilder: (context, index) {
                final product = products[index];
                final isFavorite = favoriteIndices.contains(index);
                final isBasket = basketIndices.contains(index);
                // return buildUnifiedContainer(product);
                return GestureDetector(
                  onTap: () {
                    log("in Comman Screen Container Tab");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      //return SofaScreen();
                      return ProductDetailsScreen(
                        title: product.name,
                        price: product.price,
                        image: product.image_path,
                      );
                    }));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                product.image_path,
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fit: BoxFit.fill,
                              ),

                              //product['image'],
                              Positioned(
                                right: 2,
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: isFavorite
                                            ? Colors.red
                                            : Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        // Example product to add to the list

                                        log("${product.name}");

                                        FavModel newProduct = FavModel(
                                          productName: product.name,
                                          productImage: product
                                              .image_path, // You can use an image URL
                                          productPrice: product.price,
                                        );
                                        addToFavorites(newProduct);

                                        setState(() {
                                          if (isFavorite) {
                                            favoriteIndices.remove(
                                                index); // Remove from favorites
                                          } else {
                                            favoriteIndices
                                                .add(index); // Add to favorites
                                          }
                                        });
                                      },
                                    )),
                              ),

                            ],
                          ),
                        ),
                        // Price and title

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          product.name,
                                          style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "₹${product.price}",
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                               const Spacer(),
                                ElevatedButton(
                                  // onPressed: () {
                                  //   setState(() {
                                  //     // cartProducts.add(Product(
                                  //     //   name: product.name,
                                  //     //   price: product.price,
                                  //     //   image_path: product.image_path,
                                  //     // ));
                                  //   });
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(
                                  //         content: Text('Added to Cart')),
                                  //   );
                                  // },
                                  onPressed: () {
                                        // Example product to add to the list
                                        log("${product.name}");

                                        FavModel newProduct = FavModel(
                                          productName: product.name,
                                          productImage: product.image_path!, // You can use an image URL
                                          productPrice: product.price,
                                        );
                                        addToBasket(newProduct);
                                        setState(() {
                                          if (isBasket) {
                                            basketIndices.remove(
                                                index); // Remove from favorites
                                          } else {
                                            basketIndices
                                                .add(index); // Add to favorites
                                          }
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Added to Cart')),
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
                        ),
                       
                      ],
                    ),
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
