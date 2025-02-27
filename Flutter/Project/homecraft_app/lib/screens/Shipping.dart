import 'package:flutter/material.dart';
import 'package:homecraft_app/screens/Shipping_InfoModel.dart';
import 'package:homecraft_app/screens/payment.dart';

class Shipping extends StatelessWidget {
  final dynamic total;
  Shipping(this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    String PayOption = "";

    TextEditingController name = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController city = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shipping",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Name:",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Address:",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: city,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "City:",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Payment Method",
                ),
                items: const [
                  DropdownMenuItem(value: "Card", child: Text("Card")),
                  DropdownMenuItem(value: "UPI", child: Text("UPI")),
                  DropdownMenuItem(value: "Gift Card", child: Text("Gift Card")),
                  DropdownMenuItem(value: "Net Banking", child: Text("Net Banking")),
                ],
                onChanged: (value) {
                  PayOption = value!;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ShippingInfo shippingInfoObj = ShippingInfo(
                    name: name.text,
                    address: address.text,
                    city: city.text,
                    amount: total,
                    method: PayOption,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Payment(shippingInfoObj);
                  }));
                },
                child: const Text(
                  "Continue to Payment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
