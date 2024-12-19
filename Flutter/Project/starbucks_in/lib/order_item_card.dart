import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final int itemQuantity;
  final double itemRating;

  OrderItemCard({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset('assets/food.png'), // Replace with actual image
        title: Text(itemName),
        subtitle: Text('\$${itemPrice.toString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                // Decrease quantity
              },
            ),
            Text(itemQuantity.toString()),
            IconButton(
              icon: Icon(Icons.add),
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