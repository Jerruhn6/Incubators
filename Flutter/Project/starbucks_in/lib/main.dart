import 'package:flutter/material.dart';
import 'package:starbucks_in/homeScreen.dart';
import 'package:starbucks_in/orderTrack.dart';
import 'package:starbucks_in/productInfo.dart';
import 'package:starbucks_in/splashScreen.dart';
import 'package:starbucks_in/welcomeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcomescreen(),
    );
  }
}
