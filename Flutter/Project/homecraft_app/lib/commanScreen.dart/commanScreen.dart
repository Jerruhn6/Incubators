import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/favourite/favModel.dart';

import 'package:homecraft_app/favourite/favouriteScreen.dart';
import 'package:homecraft_app/productDetails/product%20details%20screen.dart';

List<Map<String, dynamic>>? list2;
String? appBarTitle;

class Commanscreen extends StatefulWidget {
  final List<Map<String, dynamic>> list;
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
  final List<Map<String, dynamic>> favProducts = [];
  final List<Map<String, dynamic>> products = list2!;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle!,
          style: GoogleFonts.quicksand(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                size: 20, color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                //return SofaScreen();
                return const MyFavourite();
              }));
            },
            icon: Stack(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${products.length} Products',
              style: GoogleFonts.quicksand(fontSize: 16, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.red),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
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
                        title: product["title"],
                        price: product["price"],
                        image: product["image"],
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
                              Image.asset(
                                product['image'],
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fit: BoxFit.fill,
                              ),

                              //product['image'],
                              Positioned(
                                bottom: 2,
                                left: 4,
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

                                        log("${product["title"]}");

                                        FavModel newProduct = FavModel(
                                          productDes: product["title"]!,
                                          productImage: product[
                                              "image"]!, // You can use an image URL
                                          productPrice: product["price"]!,
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

                              Positioned(
                                bottom: 3,
                                right: 2,
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.local_mall,
                                        color: isBasket
                                            ? Colors.yellow
                                            : Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        // Example product to add to the list
                                        log("${product["title"]}");

                                        FavModel newProduct = FavModel(
                                          productDes: product["title"]!,
                                          productImage: product[
                                              "image"]!, // You can use an image URL
                                          productPrice: product["price"]!,
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
                                      },
                                    )),
                              ),
                              // Discount and offer details
                              if (product.containsKey('discount'))
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (product.containsKey('extraOffer'))
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          color: Colors.red,
                                          child: Text(
                                            product['extraOffer']!,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        color: Colors.red.shade300,
                                        child: Text(
                                          product['discount']!,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // Price and title
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['price'],
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                if (product.containsKey('discountPrice'))
                                  Text(
                                    product['discountPrice']!,
                                    style: GoogleFonts.quicksand(
                                      //decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                const SizedBox(height: 2),
                                Expanded(
                                  child: Text(
                                    product['title'],
                                    style: GoogleFonts.quicksand(fontSize: 14),
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
