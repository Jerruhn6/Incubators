import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/ods.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.brown[800],
      appBar: AppBar(
        title: const Text('Your Order'),
        actions: const [Icon(Icons.local_shipping)],
      ),
      body: Column(
        children: [
          //  Image.asset("assets/fooddish.png", height: 80.0, width: 80.0),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with actual order items
              itemBuilder: (context, index) {
                return OrderItemCard(
                  itemName: index == 0 ? 'Profiterol' : 'Espresso',
                  itemPrice: index == 0 ? 1 : 2,
                  itemQuantity: index == 0 ? 8 : 2,
                  itemRating: index == 0 ? 4.8 : 4.7,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  Spacer(),
                const Text('Total: \$14'),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Transparent button
                      shadowColor: Colors.grey, // Remove default shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Consistent radius
                      ),
                    ),
                    onPressed: () {
                      print('Go to Cart');
                    },
                    child: Text(
                      'Go to Cart',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white, // Ensure contrast with gradient
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.lightBlueAccent, // Background color of the Container
      //   child: BottomNavigationBar(
      //     backgroundColor:
      //         Colors.transparent, // Make BottomNavigationBar transparent
      //     currentIndex: 2,
      //     selectedItemColor: Colors.black, // Selected icon/text color
      //     unselectedItemColor: Colors.brown, // Unselected icon/text color
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite),
      //         label: 'Favourite',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Badge(
      //           label: Text('10'),
      //           child: Icon(Icons.shopping_cart),
      //         ),
      //         label: 'Cart',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final int itemQuantity;
  final double itemRating;

  OrderItemCard({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset('assets/food.png'), // Replace with actual image
        title: Text(itemName),
        subtitle: Text('\$${itemPrice.toString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                // Decrease quantity
              },
            ),
            Text(itemQuantity.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Increase quantity
              },
            ),
          ],
        ),
      ),
    );
  }
}
