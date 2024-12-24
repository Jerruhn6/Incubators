import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starbucks_in/Model/favModel.dart';

class Adddata {
  void addToFavorites(FavModel product2) async {
    // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    try {
      await FirebaseFirestore.instance
          .collection("favourites")
          .add(product2.toMap());
      // Add the product to the 'favorites' collection in Firebase
      // await _dbRef.child('favorites').push().set(product.toMap());
      print("Product added to favorites successfully.");
    } catch (e) {
      print("Error adding product to favorites: $e");
    }
  }

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
}