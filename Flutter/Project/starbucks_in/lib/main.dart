// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/favorite_screen.dart';
import 'package:starbucks_in/View/commanScreen.dart';
import 'package:starbucks_in/manageOrder.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/orderStatusDetails.dart';
import 'package:starbucks_in/orderTrack.dart';
import 'package:starbucks_in/payment_screen.dart';
import 'package:starbucks_in/register.dart';
import 'package:starbucks_in/splashScreen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const  FirebaseOptions(apiKey: "AIzaSyBrCZXEu-B5wzevQ_P0USzY3f1VlhEGAsg", appId: "1:463124172443:android:f3575496c6a0e35b5e003e", messagingSenderId: "463124172443", projectId: "caffe-in-76cfc"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/profile',
    
    home: SplashScreen(),
    //home: Welcomescreen(),
    //home: RegisterPage(),
    //home: OrdersPage(),
    // home: NavigationPage(),
    // home: HomeScreen(),
    //home: PaymentScreen(cartProducts: [],),
    );
  }
}
//assets/coffeeCup.png