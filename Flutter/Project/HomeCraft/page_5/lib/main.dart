import 'package:flutter/material.dart';

void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Minimalist\nStyle Decor",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/lamp.jpg"), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Simple Lifestyle",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildBlogCard(
              "Slow your home",
              "assets/chair.jpg", // Replace with your image
            ),
            _buildBlogCard(
              "The art of simple",
              "https://img.freepik.com/free-photo/wooden-board-empty-table-top-blurred-background_1253-1584.jpg?t=st=1732084003~exp=1732087603~hmac=ebbb54de588a396e91c3ca4268f86fe0db9a231ac8e7d5f6ee9bba7d3d5d378f&w=900", // Replace with your image
            ),
            _buildBlogCard(
              "The cozy corner",
              "assets/stool.jpg", // Replace with your image
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildBlogCard(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}