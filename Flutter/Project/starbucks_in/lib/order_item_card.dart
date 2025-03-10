import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final int itemQuantity;
  final double itemRating;

  const OrderItemCard({super.key, 
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset('assets/food.png'), // Replace with actual image
        title: Text(itemName),
        subtitle: Text('\$${itemPrice.toString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                // Decrease quantity
              },
            ),
            Text(itemQuantity.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Increase quantity
              },
            ),
          ],
        ),
      ),
    );
  }
}