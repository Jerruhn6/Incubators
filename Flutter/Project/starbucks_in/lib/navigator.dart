// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
import 'package:starbucks_in/all%20category/breakfastScreen.dart';
import 'package:starbucks_in/all%20category/dessertScreen.dart';
import 'package:starbucks_in/all%20category/iceCreamScreen.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/favorite_screen.dart';
import 'package:starbucks_in/homeScreen.dart';
// ignore: unused_import
import 'package:starbucks_in/Model/productModel.dart';
import 'package:starbucks_in/orderStatusDetails.dart';
import 'package:starbucks_in/profileScreen.dart';
// ignore: unused_import
import 'package:starbucks_in/splashScreen.dart';

int cartProductSum = 0;
List<CoffeeModel> coffeeList = [];

class NavigationPage extends StatefulWidget {

  
  final String? email;
  NavigationPage({super.key, this.email});
  final favoriteItems = coffeeList.where((coffee) => coffee.isFavorite).toList();


  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  

  List<Widget> navigationPages = [
    // const SplashScreen(),
    const HomeScreen(
      
    ),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const OrderStatusDetails(),
    const Dessertscreen(),
    const Icecreamscreen(),
    const Breakfastscreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: navigationPages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.lightBlueAccent,
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.brown,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text("$cartProductSum"),
                child: const Icon(Icons.shopping_cart),
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
