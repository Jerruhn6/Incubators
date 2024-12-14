import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? email;
  const HomeScreen({super.key,this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Row(
                  children: [
                    _buildCategoryChip('COFFEE', true),
                  ],
                ),
                _buildCategoryChip('ALCOHOL FREE', true),
                _buildCategoryChip('DESSERTS', false),
                _buildCategoryChip('ALCOHOL', false),
                _buildCategoryChip('BREAKFAST', false),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: 10, // Replace with the actual number of items
              itemBuilder: (context, index) {
                return _buildCoffeeItem('Cappuccino', '35'); // Replace with actual item details
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.brown : Colors.grey[300],
      ),
    );
  }

  Widget _buildCoffeeItem(String name, String price) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Frame 9.png'), // Replace with actual image
          Text(name),
          Text('\$$price'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {}, // Add to cart functionality
          ),
        ],
      ),
    );
  }
}
