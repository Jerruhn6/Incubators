import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cafe_data.db');
    return await openDatabase(
      path,
      version: 2, // Incremented version to support schema changes
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE coffee(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price REAL,
          image_path TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE breakfast(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price REAL,
          image_path TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE dessert(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price REAL,
          image_path TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE icecream(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          price REAL,
          image_path TEXT
        )
      ''');

      print("Tables created successfully.");
    } catch (e) {
      print("Error during table creation: $e");
    }
  }

  // Check if data exists before inserting
  Future<bool> doesDataExist(String tableName, String name) async {
    Database db = await instance.database;
    var result = await db.query(
      tableName,
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }

  Future<void> insertData(String tableName, Map<String, dynamic> data) async {
    try {
      Database db = await instance.database;
      String name = data['name'];
      // Check if the data already exists
      bool exists = await doesDataExist(tableName, name);
      if (!exists) {
        await db.insert(tableName, data);
        print("Data inserted into $tableName successfully.");
      } else {
        print("Data already exists in $tableName.");
      }
    } catch (e) {
      print("Error inserting data into $tableName: $e");
    }
  }
}

// Fetch data from Firebase and store it in SQLite
Future<void> fetchDataFromFirebase() async {
  final dbHelper = DatabaseHelper.instance;

  Future<void> fetchAndStoreData(String collectionName, String tableName) async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();
      log("$snapshot");

      for (var doc in snapshot.docs) {
        await dbHelper.insertData(tableName, {
          'name': doc['name'] as String,
          'price': double.tryParse(doc['price']) ?? 0.0, // Ensure proper type
          'image_path': doc['image_path'] as String,
        });
      }
      print("$collectionName data fetched and stored in $tableName.");
    } catch (e) {
      print("Error fetching data from $collectionName: $e");
    }
  }

  // Only fetch data once and prevent overwriting existing data
  await fetchAndStoreData("COFFEE", "coffee");
  await fetchAndStoreData("BREAKFAST", "breakfast");
  await fetchAndStoreData("DESSERT", "dessert");
  await fetchAndStoreData("ICECREAM", "icecream");
}

class CoffeeScreen extends StatefulWidget {
  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  List<Map<String, dynamic>> coffeeList = [];

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  // Initialize database and fetch data
  Future<void> initializeDatabase() async {
    try {
      final db = await DatabaseHelper.instance.database;
      await fetchDataFromFirebase();
      await fetchCoffeeData(db);
    } catch (e) {
      log("Error initializing database: $e");
    }
  }

  Future<void> fetchCoffeeData(Database db) async {
    try {
      final List<Map<String, dynamic>> data = await db.query('coffee');
      setState(() {
        coffeeList = data;
      });
      log("Fetched coffee data: $coffeeList");
    } catch (e) {
      log("Error fetching coffee data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee List'),
        backgroundColor: Colors.brown,
      ),
      body: coffeeList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final coffee = coffeeList[index];
                return ListTile(
                  leading: coffee['image_path'] != null &&
                          coffee['image_path'].isNotEmpty
                      ? Image.network(
                          coffee['image_path'],
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported);
                          },
                        )
                      : Icon(Icons.local_cafe, size: 50),
                  title: Text(coffee['name'] ?? 'Unknown Coffee'),
                  subtitle: Text(
                    "Price: \$${coffee['price']?.toStringAsFixed(2) ?? '0.00'}",
                  ),
                );
              },
            ),
    );
  }
}
