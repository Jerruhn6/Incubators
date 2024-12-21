import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
//import 'coffee_model.dart';

final List<dynamic> favoriteItems = [];

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite',
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        //centerTitle: true,
        backgroundColor: Colors.brown[600],
        elevation: 5,
      ),
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
