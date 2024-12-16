import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/productModel.dart';

class HomeScreen extends StatefulWidget {
  final String? email;
  const HomeScreen({super.key, this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // void initState(){
  //   FirebaseFirestore.instance.
  //   super.initState();
  // }
  
  final List<Product> products = [
    Product(name: 'Cappuccino', price: '35', imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHuVUzalj8u6ZhME5u5jBmpj3RmqHfoVhe9dt8TLLgBV-_UN7ZuQ2z8ixJpaONvWLFIoc&usqp=CAU'),
    Product(name: 'Latte', price: '30', imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_YMTkc4612BVbFxrUPi7k0qjypWpLlwOVfQ&s'),
    Product(name: 'Espresso', price: '25', imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR29C2VVZ3QGzijZLfVrQs6JX6qoZB52Gg4mA&s'),
    Product(name: 'Mocha', price: '40', imagePath: 'https://milkandpop.com/wp-content/uploads/2020/11/mocha-latte-13.jpg'),
    Product(name: 'Macchiato', price: '38', imagePath: 'https://img.freepik.com/premium-photo/coffee-latte-macchiato-with-whipped-cream-coffee-beans-glasses-with-delicious-latte-macchiato-with-coffee-ai-generated_538213-3336.jpg'),
    Product(name: 'Flat White', price: '32', imagePath: 'https://athome.starbucks.com/sites/default/files/styles/recipe_banner_xlarge/public/2024-05/Flatwhite_RecipeHeader_848x539_%402x.jpg.webp?itok=pY1IvezE'),
    Product(name: 'Americano', price: '28', imagePath: 'https://img.freepik.com/premium-photo/classic-americano-coffee-with-milk-gray-background_112304-1304.jpg'),
    Product(name: 'Affogato', price: '45', imagePath: 'https://img.freepik.com/premium-photo/affogato-coffee-with-ice-cream-cup_756748-28005.jpg'),
    Product(name: 'Irish Coffee', price: '50', imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRRFJH69N631hJOye4kT1JugZA_IH7mVZtdw&s'),
    Product(name: 'Cold Brew', price: '35', imagePath: 'https://s3.amazonaws.com/shecodesio-production/uploads/files/000/108/829/original/cold_brew_coffee_4_%281%29.jpg?1704066531'),
  ];
  Future<void> _addProductsToFirestore() async {
    try {
      final CollectionReference productsRef = _firestore.collection('products');

      for (var product in products) {
        await productsRef.add({
          'name': product.name,
          'price': product.price,
          'imagePath': product.imagePath,
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Products added to Firestore!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add products: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:    Column(
        children: [
          const SizedBox(height: 40),
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
                _buildCategoryChip('COFFEE', true),
                _buildCategoryChip('ALCOHOL FREE', true),
                _buildCategoryChip('DESSERTS', false),
                _buildCategoryChip('ALCOHOL', false),
                _buildCategoryChip('BREAKFAST', false),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildCoffeeGridItem(product);
              },
            ),
          ),
        ],
      ),
    

bottomNavigationBar: NavigationPage(),  

       
    );
      
   
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        label: Text(label,style: TextStyle(color: Colors.white),),
        backgroundColor: isSelected ? Colors.brown : Colors.grey,
      ),
    );
  }

  Widget _buildCoffeeGridItem(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(product.imagePath, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {}, // Add to cart functionality
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}