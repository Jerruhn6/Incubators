import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int _profiterolQuantity = 0;

  void _incrementProfiterolQuantity() {
    setState(() {
      _profiterolQuantity++;
    });
  }

  void _decrementProfiterolQuantity() {
    setState(() {
      if (_profiterolQuantity > 0) {
        _profiterolQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.brown[100],
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text("Restaurant Menu"),
      // ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          _buildMenuItem("Tuna Salad", "14.22\$", 4.8),
          _buildMenuItem("White Wine", "20.45\$", 4.4),
          _buildMenuItem("Espresso", "2\$", 4.7),
          _buildMenuItem("Profiterol", "1\$", 4.8,
              quantity: _profiterolQuantity,
              onIncrement: _incrementProfiterolQuantity,
              onDecrement: _decrementProfiterolQuantity),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String name, String price, double rating,
      {int quantity = 0, Function? onIncrement, Function? onDecrement}) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
             Image.asset("assets/food.png", height: 100.0, width: 80.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black, // Ensure contrast with gradient
                        ),),
                    Text(price),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        Text("$rating"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (quantity > 0) ...[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove,),
              ),
              Text("$quantity"),
            ],
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
