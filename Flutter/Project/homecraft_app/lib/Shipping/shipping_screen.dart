import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/Shipping/payment_screen.dart';

class ShippingScreen extends StatefulWidget {
  String price;
  String title;
  String image;
  ShippingScreen(
      {super.key,
      required this.price,
      required this.title,
      required this.image});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add your shipping address',
                style: GoogleFonts.quicksand(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number (For order or delivery updates)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: stateController,
                decoration: const InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: buildingController,
                decoration: const InputDecoration(
                  labelText: 'Building name or number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.quicksand(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.price,
                        style: GoogleFonts.quicksand(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Inclusive of all taxes',
                        style: GoogleFonts.quicksand(color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.trim().isNotEmpty &&
                          phoneController.text.trim().isNotEmpty &&
                          pincodeController.text.trim().isNotEmpty &&
                          cityController.text.trim().isNotEmpty &&
                          stateController.text.trim().isNotEmpty &&
                          buildingController.text.trim().isNotEmpty) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          //return SofaScreen();
                          return PaymentScreen(
                              name: nameController.text.trim(),
                              number: phoneController.text.trim(),
                              city: cityController.text.trim(),
                              pincode: pincodeController.text.trim(),
                              state: stateController.text.trim(),
                              buildingName: buildingController.text.trim(),
                              price: widget.price,
                              title: widget.title,
                              image: widget.image);
                        }));
                      } else {
                         ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please Enter Valid Data'),
                                  ),
                                );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    child: Text(
                      'CONTINUE',
                      style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
