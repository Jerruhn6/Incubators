import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/Model/favModel.dart';
import 'package:starbucks_in/Model/orderModel.dart';
import 'package:starbucks_in/Model/payment_model.dart';
import 'package:starbucks_in/orderTrack.dart';

class PaymentScreen extends StatelessWidget {
  final double totalAmount;
  final String title;
  final String image;
  final String price;

  PaymentScreen(
      {super.key,
      required this.totalAmount,
      required this.title,
      required this.image,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose Payment Method',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Payment Method Options
                    PaymentMethodTile(
                      icon: Icons.credit_card,
                      title: 'Credit/Debit Card',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Credit/Debit Card selected')),
                        );
                      },
                    ),
                    PaymentMethodTile(
                      icon: Icons.account_balance_wallet,
                      title: 'Wallet',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wallet selected')),
                        );
                      },
                    ),
                    PaymentMethodTile(
                      icon: Icons.paypal,
                      title: 'PayPal',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('PayPal selected')),
                        );
                      },
                    ),
                    PaymentMethodTile(
                      icon: Icons.money_sharp,
                      title: 'Cash on delivery',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cash on delivery')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Confirm Payment Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Example product to add to the list

                  log("${title}");

                  Ordermodel newProduct = Ordermodel(
                    productName: title,
                    productImage: image, // You can use an image URL
                    productPrice: price,
                    isConfirmed:false,
                    
                    
                  );
                  addToFavorites(newProduct);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderTrack()),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment Successful!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Confirm Payment',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  QuerySnapshot? response;
  // Function to add product to the list and store it to Firebase
  void addToFavorites( Ordermodel product2) async {
    // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    try {
      await FirebaseFirestore.instance
          .collection("Orders")
          .add(product2.toMap());
      // Add the product to the 'favorites' collection in Firebase
      // await _dbRef.child('favorites').push().set(product.toMap());
      print("Orders successfully.");
    } catch (e) {
      print("Error adding product to favorites: $e");
    }
  }
}
