import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:starbucks_in/Model/orderModel.dart';

List<dynamic> orderList = [];
int ordCount = 0;

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getDataFromFirebase();
    });
    super.initState();
  }

  QuerySnapshot? response;
  Future<void> getDataFromFirebase() async {
//playersList.clear();

    response = await FirebaseFirestore.instance.collection("Orders").get();
    orderList.clear();
    for (var value in response!.docs) {
      log("Value:${value['productName']}");

      orderList.add(
        Ordermodel(
            productName: value['productName'],
            productPrice: value['productPrice'],
            productImage: value['productImage'],
            isConfirmed: value['isConfirmed'],
          ),
      );
    }
    log("LENGTH OF PLAYERS LIST:${orderList.length}");
    ordCount = orderList.length;
    setState(() {});
  }

  final List<Map<String, dynamic>> orders = [
    {
      'orderId': '1',
      'productName': 'Profiterol',
      'status': '--',
      'isConfirmed': false
    },
    {
      'orderId': '2',
      'productName': 'Expresso',
      'status': '--',
      'isConfirmed': false
    },
    {
      'orderId': '3',
      'productName': 'Cappuccino',
      'status': '--',
      'isConfirmed': false
    },
  ];

  final bool isHotelOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.errorContainer,
      backgroundColor: Colors.brown[100],
      // backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined,size: 25,
          color: Colors.white,),
          
        ),
        title: Text(
          'Manage Orders',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: orderList.isEmpty
            ? Center(
                child: Text(
                  'No orders available.',
                  style: GoogleFonts.lato(color: Colors.black54, fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  clipBehavior: Clip.antiAlias,
                                  height: 90,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                      // shape: BoxShape.circle,
                                      ),
                                  child: Image.network(
                                    orderList[index].productImage,
                                    fit: BoxFit.fill,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderList[index].productName,
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Order Price: ₹${orderList[index].productPrice}',
                                      style: GoogleFonts.lato(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                
                                    
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                                    Text(
                                      'Order ID: ${index+1}',
                                      style: GoogleFonts.lato(
                                          color: Colors.black, fontSize: 10),
                                    ),
                          //const SizedBox(height: ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status: ${orderList[index].status}',
                                style: GoogleFonts.lato(
                                  color:
                                      _getStatusColor(orderList[index].status),
                                  fontSize: 15,
                                ),
                              ),
                              if (!isHotelOpen)
                                _buildStatusWidget(orderList[index])
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
        //.toList
      ),
    );
  }

  Widget _buildStatusWidget(dynamic order) {
    return ElevatedButton(
      onPressed: ()=> _showOrderActionDialog(context, order),
        
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.brown)
      ),
      child: const Text('Manage Order',style: TextStyle(color: Colors.white),),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Confirmed':
        return Colors.green;
      case 'Preparing':
        return Colors.orange;
      case 'On the Way':
        return Colors.blue;
      case 'Delivered':
        return Colors.teal;
      case 'Declined':
        return Colors.red;
      default:
        return Colors.black45;
    }
  }

  void _showOrderActionDialog(BuildContext context, dynamic order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Action'),
          content: const Text('Do you want to confirm or decline this order?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                
               Ordermodel newProduct = Ordermodel(
                    productName: order.productName,
                    productImage:order.productImage, // You can use an image URL
                    productPrice: order.productPrice,
                    isConfirmed:false,
                    status: "Declined"
                    
                    
                  );
                  addFirebaseOrder(newProduct);
                Navigator.pop(context);
                _updateOrderStatus(order, 'Declined', false);
              },
              child: const Text('Decline'),
            ),
            TextButton(
              onPressed: () {
                 Ordermodel newProduct = Ordermodel(
                    productName: order.productName,
                    productImage:order.productImage, // You can use an image URL
                    productPrice: order.productPrice,
                    isConfirmed:true,
                    status: "Confirmed"
                    
                    
                  );
                addFirebaseOrder(newProduct);
                Navigator.pop(context);
                _updateOrderStatus(order, 'Confirmed', true);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _updateOrderStatus(dynamic order, String newStatus, bool isConfirmed) {
    setState(() {
      final index =
          orderList.indexWhere((o) => o.productPrice == order.productPrice);
      if (index != -1) {
        orderList[index].status = newStatus;
        orderList[index].isConfirmed = isConfirmed;
      }
    });
  }

// to update orders status
  //QuerySnapshot? response;
  // Function to add product to the list and store it to Firebase
  void addFirebaseOrder( Ordermodel product2) async {
    // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    try {
      await FirebaseFirestore.instance
          .collection("OrdersHistory")
          .add(product2.toMap());
      // Add the product to the 'favorites' collection in Firebase
      // await _dbRef.child('favorites').push().set(product.toMap());
      print("Orders successfully.");
    } catch (e) {
      print("Error adding product to favorites: $e");
    }
  }
}
