import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BookMyShowHomePage(),
    );
  }
}

class BookMyShowHomePage extends StatefulWidget {
  const BookMyShowHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookMyShowHomePageState createState() => _BookMyShowHomePageState();
}

class _BookMyShowHomePageState extends State<BookMyShowHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('It All Starts Here!'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // children: [
          //   _buildSearchBar(),
          //   _buildCategoryTabs(),
          //   _buildCreditCardBanner(),
          //   _buildAmazonPrimeBanner(),
          //   _buildRecommendedMoviesSection(),
          // ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Live Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // ... other methods to build individual components
}