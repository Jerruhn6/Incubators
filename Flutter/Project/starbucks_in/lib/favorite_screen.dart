import 'package:flutter/material.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
//import 'coffee_model.dart';

class FavoriteScreen extends StatelessWidget {
  final List<CoffeeModel> favoriteItems;

  const FavoriteScreen({super.key, required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Favorites'),
      //   //backgroundColor: Colors.brown,
      // ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text('No Favorites yet!',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return ListTile(
                  leading: Image.network(item.image_path, width: 50),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price}'),
                  trailing: const Icon(Icons.favorite, color: Colors.red),
                );
              },
            ),
    );
  }
}
