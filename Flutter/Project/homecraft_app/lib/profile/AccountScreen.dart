import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentPhone;

  const AccountScreen({
    Key? key,
    required this.currentName,
    required this.currentEmail,
    required this.currentPhone,
  }) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    emailController = TextEditingController(text: widget.currentEmail);
    phoneController = TextEditingController(text: widget.currentPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Account Information',style: GoogleFonts.quicksand(fontSize: 22,fontWeight: FontWeight.w500),),
        backgroundColor:  const Color(0xFFFFE082),
        leading: GestureDetector(onTap: (){
          Navigator.of(context).pop();
        }, 
        child: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Boxed Text Field for Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white,
                labelStyle: GoogleFonts.quicksand(),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color:   Color(0xFFFFE082),),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Boxed Text Field for Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                labelStyle: GoogleFonts.quicksand(),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color:   Color(0xFFFFE082),),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Boxed Text Field for Phone Number
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                filled: true,
                fillColor: Colors.white,
                labelStyle: GoogleFonts.quicksand(),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color:   Color(0xFFFFE082),),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 30),

            // Save Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color(0xFFFFE082),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              ),
              child: Text('Save', style: GoogleFonts.quicksand(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}


