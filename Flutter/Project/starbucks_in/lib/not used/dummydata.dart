import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:starbucks_in/not%20used/database.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({super.key});

  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  List<Map<String, dynamic>> coffeeList = [];

  @override
  void initState() {
    super.initState();
    initializeDatabase();
    fetchDataFromFirebase();
  }

  // Initialize database and fetch data
  Future<void> initializeDatabase() async {
    try {
      final db = await _initDatabase();
      
      await fetchCoffeeData(db);
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
        title: const Text('Coffee List'),
        backgroundColor: Colors.brown,
      ),
      body: coffeeList.isEmpty
          ? const Center(child: CircularProgressIndicator())
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
                            return const Icon(Icons.image_not_supported);
                          },
                        )
                      : const Icon(Icons.local_cafe, size: 50),
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
