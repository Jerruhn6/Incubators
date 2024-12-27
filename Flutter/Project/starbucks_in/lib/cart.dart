// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:starbucks_in/Model/productModel.dart';
// import 'package:starbucks_in/View/commanScreen.dart';
// import 'package:starbucks_in/View/homeScreen.dart';
// import 'package:starbucks_in/ods.dart';
// import 'package:starbucks_in/order_item_card.dart';
// import 'package:starbucks_in/payment_screen.dart';



// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   double get totalPrice =>
//       cartProducts.fold(0, (sum, item) => sum + double.parse(item.price));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Cart',
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
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartProducts.length,
//               itemBuilder: (context, index) {
//                 final product = cartProducts[index];
//                 return Dismissible(
//                   key: Key(product.name), // Use a unique key for each product
//                   direction:
//                       DismissDirection.endToStart, // Swipe from right to left
//                   background: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: const Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                   onDismissed: (direction) {
//                     setState(() {
//                       cartProducts.removeAt(index);
//                     });

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${product.name} removed from cart'),
//                         duration: const Duration(seconds: 2),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 8.0,
//                       horizontal: 16.0,
//                     ),
//                     elevation: 4.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: ListTile(
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(8.0),
//                         child: Image.network(
//                           product.image_path,
//                           fit: BoxFit.cover,
//                           width: 60,
//                           height: 60,
//                         ),
//                       ),
//                       title: Text(
//                         product.name,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         '\$${product.price}',
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.remove_circle_outline),
//                         onPressed: () {
//                           setState(() {
//                             cartProducts.removeAt(index);
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total: \$${totalPrice.toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (cartProducts.isNotEmpty) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               PaymentScreen(totalAmount: totalPrice),
//                         ),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Your cart is empty')),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Payment',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
            
//           ),
//           const SizedBox(height: 100,),
//         ],
        
//       ),
//     );
//   }
// }


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/Model/favModel.dart';
import 'package:starbucks_in/favorite_screen.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/productInfoScreen.dart';


//final GlobalKey<ExplorePage> childKey = GlobalKey<ExplorePage>();

List<FavModel> basketList = [];

class MyBag extends StatefulWidget {
  const MyBag({super.key});

  @override
  State createState() => _TodoListUIState();
}

class _TodoListUIState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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

    response = await FirebaseFirestore.instance.collection("basket").get();
    basketList.clear();
    for (var value in response!.docs) {
      log("Value:${value['productName']}");
      basketList.add(
        FavModel(
          productName: value['productName'],
          productPrice: value['productPrice'],
          productImage: value['productImage'],
        ),
      );
    }
    print("LENGTH OF PLAYERS LIST:${basketList.length}");
    setState(() {
      
    });
  }

  int quantity = 1;

  //task list
  List<dynamic> todoCards = [
  
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basket",
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
      body: basketList.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_mall_outlined,
                    size: 100,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Your Basket is empty.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: basketList.length, //todoCards.length+,
           
              itemBuilder: (context, index) {
                   //AnimatedNavbar(basketCount: basketList.length,favCount: wishlist.length);
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(color:Colors.black.withOpacity(0.2),
                          spreadRadius: 3.5,blurRadius: 4,offset: Offset(4,4)
                          )

                        ]
                        ),
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
                                  title: basketList[index].productName,
                                  price: basketList[index].productPrice,
                                  image: basketList[index].productImage,
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
                                        basketList[index].productImage,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      
                                      //const SizedBox(width: 15),
                                      Text(
                                        basketList[index].productName,
                                        style: GoogleFonts.quicksand(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                      ),

                                       Text(
                                        "₹ ${basketList[index].productPrice}",
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
                              //ExplorePage();
                           //_MyHomePageState();
                          
                                  setState(() {


                                    FirebaseFirestore.instance
                                        .collection("basket")
                                        .doc(response!.docs[index].id)
                                        .delete();
                                    basketList.removeAt(index);
                                     AnimatedNavbar(basketCount:basketList.length,favCount:wishlist.length);
                                    
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
                                          onPressed: () {},
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
                                onTap: () {},
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
                                             Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                //return SofaScreen();
                                return ProductDetailsScreen(
                                  title: basketList[index].productName,
                                  price: basketList[index].productPrice,
                                  image: basketList[index].productImage,
                                );
                              }));
                                          },
                                          icon: Icon(Icons.shopping_cart)),
                                      Text(
                                        "Buy Now",
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