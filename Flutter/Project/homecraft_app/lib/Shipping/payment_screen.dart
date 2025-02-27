import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/Shipping/confirmation_screen.dart';
import 'package:homecraft_app/profile/export_data_screen.dart';

class PaymentScreen extends StatelessWidget {
  String name;
  String title;
  String number;
  String pincode;
  String city;
  String state;
  String buildingName;
  String price;
  String image;
  PaymentScreen(
      {super.key,
      required this.price,
      required this.image,
      required this.title,
      required this.name,
      required this.number,
      required this.pincode,
      required this.city,
      required this.state,
      required this.buildingName});

  final List<Order> orderHistory = [
    Order(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Wooden Chair',
      
      quantity: 1,
      price: 1500.0,
      
    ),
    Order(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Dining Table',
      
      quantity: 1,
      price: 5500.0,
      
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final order = orderHistory[1];
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment',
              style: GoogleFonts.quicksand(
                  fontSize: 25, fontWeight: FontWeight.w800)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          image,
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            
                            SizedBox(height: 4.0),
                            Text(
                              'Quantity: ${order.quantity}',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              'Price: ${price}',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(height: 4.0),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Amount: $price",
                style: GoogleFonts.quicksand(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  //OrderHistoryScreen(title1:title,price1:price,image1:image);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    //return SofaScreen();
                    return const ConfirmationScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: Text(
                  'PAY NOW',
                  style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}

class Order {
  final String imageUrl;
  final String title;
  final int quantity;
  final double price;


  Order({
    required this.imageUrl,
    required this.title,
    
    required this.quantity,
    required this.price,
    
  });
}
