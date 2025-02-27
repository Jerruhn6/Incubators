import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/MyBasket/basketModel.dart';
import 'package:homecraft_app/commanScreen.dart/allLists.dart';
import 'package:homecraft_app/favourite/favModel.dart';
import 'package:homecraft_app/favourite/favouriteScreen.dart';
import 'package:homecraft_app/productDetails/product%20details%20screen.dart';
import 'package:homecraft_app/screens/bottom_navbar.dart';


//final GlobalKey<ExplorePage> childKey = GlobalKey<ExplorePage>();

Alllists objCart = Alllists();
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
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getDataFromFirebase();
    });
  }

  QuerySnapshot? response;
  Future<void> getDataFromFirebase() async {
//playersList.clear();

    response = await FirebaseFirestore.instance.collection("basket").get();
    basketList.clear();
    for (var value in response!.docs) {
      print("Value:${value['productDes']}");
      basketList.add(
        FavModel(
          productDes: value['productDes'],
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

  List<Color> colorsList = [
    //Color.fromARGB(131, 233, 227, 227),
    const Color.fromARGB(162, 255, 255, 255),
  ];

  //task list
  List<ToDoListModal> todoCards = [
    ToDoListModal(
        title: objCart.bedslist[8]["price"],
        description: objCart.bedslist[8]["title"],
        image: objCart.bedslist[8]["image"]),
    ToDoListModal(
        title: objCart.bedslist[4]["price"],
        description: objCart.bedslist[4]["title"],
        image: objCart.bedslist[4]["image"]),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Basket",
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE082),
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
                        color: colorsList[index % colorsList.length],
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
                                  title: basketList[index].productDes,
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
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)
                                          // shape: BoxShape.circle,
                                          ),
                                      child: Image.asset(
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
                                      Text(
                                        basketList[index].productPrice,
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      //const SizedBox(width: 15),
                                      Text(
                                        basketList[index].productDes,
                                        style: GoogleFonts.quicksand(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              84, 84, 84, 1),
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
                                  title: basketList[index].productDes,
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
