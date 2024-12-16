import 'package:flutter/material.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/favouriteScreen.dart';
import 'package:starbucks_in/homeScreen.dart';
import 'package:starbucks_in/profileScreen.dart';
import 'package:starbucks_in/splashScreen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  List<Widget> navigationPages=[
    // const SplashScreen(),
    const HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
int currentIndex=0;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationPages[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.lightBlueAccent, 
        child: BottomNavigationBar(
          onTap: (value) {
            
            currentIndex=value;
            setState(() {
              
            });
          },
          backgroundColor:
              Colors.transparent, 
          currentIndex: currentIndex,
          selectedItemColor: Colors.black, 
          unselectedItemColor: Colors.brown, 
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: Text('10'),
                child: Icon(Icons.shopping_cart),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}