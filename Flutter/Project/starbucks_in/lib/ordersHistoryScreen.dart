import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/Model/orderModel.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Ordermodel> orderHistoryList = [];

  @override
  void initState() {
    super.initState();
    fetchOrderHistory();
  }

  Future<void> fetchOrderHistory() async {
    try {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection("OrdersHistory").get();
      List<Ordermodel> tempList = response.docs.map((doc) {
        return Ordermodel(
          productName: doc['productName'],
          productPrice: doc['productPrice'],
          productImage: doc['productImage'],
          isConfirmed: doc['isConfirmed'],
          status: doc['status'],
        );
      }).toList();
      setState(() {
        orderHistoryList = tempList;
      });
      log("Order history fetched: ${orderHistoryList.length} items");
    } catch (e) {
      log("Error fetching order history: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
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
          'Order History',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
        ),
      ),
      body: orderHistoryList.isEmpty
          ? Center(
              child: Text(
                'No orders yet.',
                style: GoogleFonts.lato(color: Colors.black54, fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: orderHistoryList.length,
              itemBuilder: (context, index) {
                final order = orderHistoryList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    //margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 90,
                                width: 150,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  order.productImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.productName,
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '₹${order.productPrice}',
                                      style: GoogleFonts.lato(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Status: ${order.status}',
                                      style: GoogleFonts.lato(
                                          color: _getStatusColor(order.isConfirmed),
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Color _getStatusColor(bool isConfirmed) {
    // switch (isConfirmed) {
    //   case 'Confirmed':
    //     return Colors.green;
    //   case 'Preparing':
    //     return Colors.orange;
    //   case 'On the Way':
    //     return Colors.blue;
    //   case 'Delivered':
    //     return Colors.teal;
    //   case 'Declined':
    //     return Colors.red;
    //   default:
    //     return Colors.black45;
    // }
    if(isConfirmed){
       return Colors.green;
    }
    else{
       return Colors.red;
    }
  }
}
