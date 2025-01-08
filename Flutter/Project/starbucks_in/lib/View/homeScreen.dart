//--------------------------------------------new------------------------------------------//

import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/Model/breakfast_model.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
import 'package:starbucks_in/Model/dessert_model.dart';
import 'package:starbucks_in/Model/favModel.dart';

import 'package:starbucks_in/Model/icecram_model.dart';

import 'package:starbucks_in/View/commanScreen.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/favorite_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starbucks_in/not%20used/database.dart';


dynamic cartProducts;
dynamic favoriteItems;

List<Map<String, dynamic>>? list2;
String? appBarTitle;

class HomeScreen extends StatefulWidget {
  final NotchBottomBarController? controller;
  final String? email;
  const HomeScreen({super.key, this.email, this.controller});

  @override
  State<HomeScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<HomeScreen> {

   dynamic coffeeListsqflite = [];
   dynamic dessertListsqflite = [];
   dynamic icecreamListsqflite = [];
   dynamic breakfastListsqflite = [];
  bool changeColour = false;

  final Set<int> favoriteIndices = {};
  final Set<int> basketIndices = {};
  QuerySnapshot? response;

  List<BreakfastModel> breakFastList = [];
  List<CoffeeModel> coffeeList = [];
  List<DessertModel> dessertList = [];
  List<IcecreamModel> icecreamList = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await getCoffeeListFromFirebase();
      await getBreakfastListFromFirebase();
      await getIceCreamListFromFirebase();
      await getDessertListFromFirebase();

      await getFavListFromFirebase();
      await getCartListFromFirebase();
       await initializeDatabase();
       await fetchDataFromFirebase();
    });
    super.initState();
  }



  // Initialize database and fetch data
  Future<void> initializeDatabase() async {
    try {
      final db = await _initDatabase();
      
      await fetchCoffeeData(db);
      await fetchBreakfastData(db);
      await fetchDessertData(db);
      await fetchIceCreamData(db);
    } catch (e) {
      log("Error initializing database: $e");
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cafe_data.db');
    log('Database Path: $path');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        log('Creating coffee table...');
        await db.execute('''
          CREATE TABLE coffee(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL,
            image_path TEXT
          )
        ''');
      },
    );
  }


  Future<void> fetchCoffeeData(Database db) async {
    try {
      final List<Map<String, dynamic>> data = await db.query('coffee');
      setState(() {
        coffeeListsqflite = data;
      });
      log("Fetched coffee data: $coffeeListsqflite");
    } catch (e) {
      log("Error fetching coffee data: $e");
    }
  }


  Future<void> fetchBreakfastData(Database db) async {
    try {
      final List<Map<String, dynamic>> data = await db.query('breakfast');
      setState(() {
        breakfastListsqflite = data;
      });
      log("Fetched coffee data: $breakfastListsqflite");
    } catch (e) {
      log("Error fetching coffee data: $e");
    }
  }
  Future<void> fetchDessertData(Database db) async {
    try {
      final List<Map<String, dynamic>> data = await db.query('dessert');
      setState(() {
        dessertListsqflite = data;
      });
      log("Fetched coffee data: $dessertListsqflite");
    } catch (e) {
      log("Error fetching coffee data: $e");
    }
  }
  
  Future<void> fetchIceCreamData(Database db) async {
    try {
      final List<Map<String, dynamic>> data = await db.query('icecream');
      setState(() {
        icecreamListsqflite = data;
      });
      log("Fetched coffee data: $icecreamListsqflite");
    } catch (e) {
      log("Error fetching coffee data: $e");
    }
  }

//--------------------get cofee list-----------------//
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
    // product= coffeeList;
    log("coffeeList in function Lenght:${coffeeList.length}");
    setState(() {});
  }

//--------------------get BreakfastListFromFirebase-----------------//
  Future<void> getBreakfastListFromFirebase() async {
    breakFastList.clear();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("BREAKFAST").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      breakFastList.add(
        BreakfastModel(
            name: value['name'],
            price: value['price'],
            image_path: value['image_path']),
      );
    }
    log("BreakfastList in function Lenght:${breakFastList.length}");
    setState(() {});
  }

  //--------------------get DessertFromFirebase-----------------//
  Future<void> getDessertListFromFirebase() async {
    dessertList.clear();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("DESSERT").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      dessertList.add(
        DessertModel(
            name: value['name'],
            price: value['price'],
            image_path: value['image_path']),
      );
    }
    log("BreakfastList in function Lenght:${breakFastList.length}");
    setState(() {});
  }

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

  //---------------------get fav list --------------------------------//

  Future<void> getFavListFromFirebase() async {
    favoriteItems.clear();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("favourites").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      favoriteItems.add(
        FavModel(
            productName: value['productDes'],
            productPrice: value['productPrice'],
            productImage: value['productImage']),
      );
    }
    // product= coffeeList;

    setState(() {});
  }

  //---------------------get fav list --------------------------------//

  Future<void> getCartListFromFirebase() async {
    cartProducts.clear();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("basket").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      cartProducts.add(
        FavModel(
            productName: value['productDes'],
            productPrice: value['productPrice'],
            productImage: value['productImage']),
      );
    }
    // product= coffeeList;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> allLists = [
      coffeeList,
      breakFastList,
      icecreamList,
      dessertList
    ];
    List<Map<String, dynamic>> categoryNames = [
      {"name": "COFFEE", "image_url": "assets/coffee.jpg"},
      {"name": "BREAKFAST", "image_url": "assets/breakfast.jpg"},
      {"name": "ICECREAM", "image_url": "assets/icecream2.jpg"},
      {"name": "DESSERT", "image_url": "assets/dessert.jpg"},
    ];
    dynamic products = coffeeList;
    bool isSelected = false;
    return Scaffold(
      // backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          "CAFE-IN",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        leading: const Icon(
          Icons.menu,
          size: 26,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
        //centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 2,
      ),
      // onPressed: () {},

      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/bg.jpg",
              )),
          Center(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 85),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                // return buildUnifiedContainer(product);
                return GestureDetector(
                  onTap: () {
                    log("in Comman Screen Container Tab");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (conext) {
                      return Commanscreen(
                          list: allLists[index],
                          title: categoryNames[index]["name"]);
                    }));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   //return SofaScreen();
                    //   return ProductDetailsScreen(
                    //     title: product.name,
                    //     price: product.price,
                    //     image: product.image_path,
                    //   );
                    // }));
                  },
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.23,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Stack(
                            children: [
                              Image.asset(
                                categoryNames[index]["image_url"],
                                height: 177,
                                //height: MediaQuery.of(context).size.height * 0.19,
                                
                               
                                width: MediaQuery.of(context).size.width * 0.5,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                        // Price and title

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 48.0,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.brown,
                                ),
                                child: Text(
                                  categoryNames[index]["name"],
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
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
