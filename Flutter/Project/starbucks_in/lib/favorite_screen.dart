// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:starbucks_in/Model/coffee_model.dart';
// import 'package:starbucks_in/Model/favModel.dart';
// import 'package:starbucks_in/View/homeScreen.dart';
// import 'package:starbucks_in/cart.dart';
// //import 'coffee_model.dart';

// // dynamic cartItems;

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});
//   @override
//   State<FavoriteScreen> createState()=> _FavoriteScreenState();

// }

//   class _FavoriteScreenState extends State<FavoriteScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Favourite',
//           style: GoogleFonts.lato(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         //centerTitle: true,
//         backgroundColor: Colors.brown[600],
//         elevation: 5,
//       ),
//       body: favoriteItems.isEmpty
//           ? const Center(
//               child: Text('No Favorites yet!',
//                   style: TextStyle(fontSize: 18, color: Colors.grey)),
//             )
//           : ListView.builder(
//               itemCount: favoriteItems.length,
//               itemBuilder: (context, index) {
//                 final item = favoriteItems[index]!;
//                 return ListTile(
//                   leading: Image.network(item.image_path, width: 50),
//                   title: Text(item.name),
//                   subtitle: Text('\$${item.price}'),
//                   trailing: const Icon(Icons.favorite, color: Colors.red),
//                 );
//               },
//             ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/Model/favModel.dart';
import 'package:starbucks_in/productInfoScreen.dart';

List<FavModel> wishlist = [];

int? favCount;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State createState() => _TodoListUIState();
}

class _TodoListUIState extends State {
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
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getDataFromFirebase();
    });
    super.initState();
  }

  QuerySnapshot? response;
  Future<void> getDataFromFirebase() async {
//playersList.clear();

    response = await FirebaseFirestore.instance.collection("favourites").get();
    wishlist.clear();
    for (var value in response!.docs) {
      log("Value:${value['productName']}");

      wishlist.add(
        FavModel(
          productName: value['productName'],
          productPrice: value['productPrice'],
          productImage: value['productImage'],
        ),
      );
    }
    print("LENGTH OF PLAYERS LIST:${wishlist.length}");
    favCount = wishlist.length;
    setState(() {});
  }

  int quantity = 1;
   
  List<Color> colorsList = [
    //Color.fromARGB(131, 233, 227, 227),
    const Color.fromARGB(162, 255, 255, 255),
  ];

  //task list
  List<FavModel> todoCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(
          "Favourites",
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),

      ///Body
      body: wishlist.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add Your Favourites!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: wishlist.length, //todoCards.length+,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3.5,
                              blurRadius: 4,
                              offset: Offset(4, 4))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //return SofaScreen();
                                return ProductDetailsScreen(
                                  title: wishlist[index].productName,
                                  price: wishlist[index].productPrice,
                                  image: wishlist[index].productImage,
                                );
                              }));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 90,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)
                                          // shape: BoxShape.circle,
                                          ),
                                      child: Image.network(
                                        wishlist[index].productImage,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                     
                                      //const SizedBox(width: 15),
                                      Text(
                                        wishlist[index].productName,
                                        style: GoogleFonts.quicksand(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                      ),

                                       Text(
                                        "₹ ${wishlist[index].productPrice}",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            height: 10,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("favourites")
                                        .doc(response!.docs[index].id)
                                        .delete();
                                    wishlist.removeAt(index);
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  // height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,

                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              FirebaseFirestore.instance
                                                  .collection("favourites")
                                                  .doc(response!.docs[index].id)
                                                  .delete();
                                              wishlist.removeAt(index);
                                            });
                                          },
                                          icon: Icon(Icons.delete)),
                                      Text(
                                        "Remove",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 2,
                                color: Colors.grey,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   todoCards.removeAt(index);});
                                },
                                child: Container(
                                  // height: 50,
                                  // color: Colors.amber,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            log("${wishlist[index].productName}");

                                        FavModel newProduct = FavModel(
                                          productName:wishlist[index].productName,
                                          productImage: wishlist[index].productImage, // You can use an image URL
                                          productPrice: wishlist[index].productPrice,
                                        );
                                        addToBasket(newProduct);
                                        setState(() {
                                          // if (isBasket) {
                                          //   basketIndices.remove(
                                          //       index); // Remove from favorites
                                          // } else {
                                          //   basketIndices
                                          //       .add(index); // Add to favorites
                                          // }
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Added to Cart')),
                                    );
                                          },
                                          icon: Icon(Icons.shopping_cart)),
                                      Text(
                                        "Add To basket",
                                        style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

//ProductDetailsScreen
