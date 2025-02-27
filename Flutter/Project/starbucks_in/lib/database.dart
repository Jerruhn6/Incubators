import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';account_balance_wallet
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starbucks_in/Model/coffee_model.dart';
dynamic coffee;
class DatabaseHelper {
  static Database? _database;

  /// Initialize the SQLite database
  static Future<Database> initializeDatabase() async {
    log("initial");
    if (_database != null) return _database!;

    _database = await openDatabase(
      join(await getDatabasesPath(), 'transactions.db'),
      version: 2,
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          db.execute('ALTER TABLE transactions ADD COLUMN timestamp TEXT');
        }
      },
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE transactions('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'name TEXT NOT NULL,'
          'price INTEGER NOT NULL,'
          'path TEXT NOT NULL)'
        );
      },
    );

    return _database!;
  }

  /// Save an image to local storage and return its file path
  static Future<String> saveImageLocally(String imageUrl, String imageName) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = join(directory.path, '$imageName.jpg');
      final file = File(imagePath);
      await file.writeAsBytes(response.bodyBytes);
      return imagePath;
    } else {
      throw Exception('Failed to download image');
    }
  }

  /// Fetch Firestore data, save images locally, and store details in SQLite
  static Future<void> fetchAndSaveFirestoreData(String collectionName) async {
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("COFFEE").get();
    for (var value in responce.docs) {
      //log("Value:${value['title']}");
      // log("NAME :- ${value['name']}");
      coffee.add(
        CoffeeModel(
            name: value['name'],
            price: value['price'],
            image_path: value['image_path']),
      );

      try {
        final localImagePath = await saveImageLocally(coffee.image_path, coffee.name);
        Database db = await initializeDatabase();
        await db.insert(
          'transactions',
          {
            'name': coffee.name,
            'price': coffee.price,
            'path': localImagePath,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } catch (e) {
        print('Error saving image or transaction: $e');
      }
    }
  }

  /// Fetch all transactions from SQLite
  static Future<List<Map<String, dynamic>>> fetchAllTransactions() async {
    final db = await initializeDatabase();
    return await db.query('transactions', orderBy: 'name ASC');
  }

  /// Fetch a transaction by name from SQLite
  static Future<Map<String, dynamic>?> fetchTransactionByName(String name) async {
    final db = await initializeDatabase();
    final results = await db.query(
      'transactions',
      where: 'name = ?',
      whereArgs: [name],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  /// Clear all transactions from the SQLite database
  static Future<void> clearTransactions() async {
    final db = await initializeDatabase();
    await db.delete('transactions');
  }
}

Future<void> loadAllCategoriesFromFirebase() async {
  await DatabaseHelper.fetchAndSaveFirestoreData('COFFEE');
  await DatabaseHelper.fetchAndSaveFirestoreData('ICECREAM');
  await DatabaseHelper.fetchAndSaveFirestoreData('BREAKFAST');
  await DatabaseHelper.fetchAndSaveFirestoreData('DESERT');

  print('All categories loaded from Firebase and saved to SQLite.');
}
