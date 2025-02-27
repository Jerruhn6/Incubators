import 'package:flutter/material.dart';
import 'package:homecraft_app/screens/Shipping_InfoModel.dart';

class Payment extends StatelessWidget {
  final ShippingInfo Lobj;

  Payment(this.Lobj, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shipping",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Text("Name :${Lobj.name}"),
          ),
          Container(
            child: Text("Address :${Lobj.address}"),
          ),
          Container(
            child: Text("City :${Lobj.city}"),
          ),
          Container(
            child: Text("PayMent Type :${Lobj.method}"),
          ),
          Container(
            child: Text("Total Amount :${Lobj.amount}"),
          ),
          SizedBox(
            height: 30,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
               
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Handle payment functionality here
              },
              child: const Text(
                "Pay",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
