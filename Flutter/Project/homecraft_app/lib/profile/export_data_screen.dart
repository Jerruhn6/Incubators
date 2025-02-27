
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// class ExportDataScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('Order History',style: GoogleFonts.quicksand(fontSize: 22,fontWeight: FontWeight.w500),),
//         backgroundColor: const Color(0xFFFFE082),
//         leading: GestureDetector(onTap: (){ Navigator.of(context).pop();},child: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,)),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Export your data',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Click the button below to export your data as a CSV file.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Placeholder function for data export
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Data exported successfully!')),
//                   );
//                 },
//                 icon: const Icon(Icons.download),
//                 label: const Text('Export Data'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

///
///import 'package:flutter/material.dart';

// class ExportDataScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return OrderHistoryScreen();
    
//   }
// }

  

class OrderHistoryScreen extends StatelessWidget {

  late final List<Order> orderHistory = [
    Order(
      imageUrl: 'assets/Images/grid1.jpg',
      title:'Dining Table',
      description: 'Comfortable wooden chair for your home.',
      quantity: 1,
      price: "1500.0",
      deliveryTime: 'Delivered on Nov 20, 2024',
    ),
    Order(
      imageUrl: "assets/Decor/Lamps/lamp2.jpg",
      title: "Lamp 1",
      description: 'Elegant dining table for six.',
      quantity: 1,
      price: "1000",
      deliveryTime: 'Delivered on Nov 18, 2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFFFFE082),
        leading: GestureDetector(
          onTap: (){ Navigator.of(context).pop();},
            // onTap: () {
            //   //Navigator.pop(context);
            //   Navigator.of(context).pop();
            // },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: 2,
        itemBuilder: (context, index) {
          final order = orderHistory[index];
          return Card(
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
                     order.imageUrl,
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
                          order.title,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          order.description,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Quantity: ${order.quantity}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          'Price: ₹${order.price}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          order.deliveryTime,
                          style: TextStyle(color: Colors.green[700]),
                        ),
                        SizedBox(height: 10.0),
                        // horizontal Line
                            Container(
                              height: 1.0, 
                              width: 300, 
                              color: Colors.black, // Border color
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                            ),
                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Return action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: const Text('Return',
                                style: TextStyle(
                                  color: Colors.black
                                ),),
                              ),
                            ),
                            // Vertical Line
                            Container(
                              height: 40.0, // Height of the border
                              width: 1.0, // Thickness of the border
                              color: Colors.black, // Border color
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Buy Again action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: const Text('Buy Again',
                                style: TextStyle(color: Colors.black),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Order {
  final String imageUrl;
  final String title;
  final String description;
  final int quantity;
  final String price;
  final String deliveryTime;

  Order({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.deliveryTime,
  });
}
