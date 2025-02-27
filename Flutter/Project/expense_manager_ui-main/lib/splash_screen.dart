import 'dart:async';

import 'package:expense_manager_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(), 
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 144,
              width: 144,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(72),
                color: const Color.fromRGBO(234, 238, 235, 1),
              ),
              child: Image.asset("assets/Images/app_logo.png"),
            ),
          ),
          const Spacer(), 
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Text(
              "Expense Manager",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
