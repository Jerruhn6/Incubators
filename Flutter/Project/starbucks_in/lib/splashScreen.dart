import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks_in/View/commanScreen.dart';
import 'package:starbucks_in/View/homeScreen.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/favorite_screen.dart';
// ignore: unused_import
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/Model/productModel.dart';
// ignore: unused_import
import 'package:starbucks_in/session.dart';
import 'package:starbucks_in/welcomeScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void navigate(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        bool status = false;
        await SessionData.getSessionData();
        print("IS LOGIN : ${SessionData.isLogin}");
        if (SessionData.isLogin!) {
          print("NAVIGATE TO HOME");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return AnimatedNavbar(basketCount: wishlist.length, favCount:basketList.length);
              },
            ),
          );
        } else {
          print("NAVIGATE TO LOGIN");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const Welcomescreen();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    log("BUILD METHOD");
    navigate(context);
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Center(
          child: Stack(
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Image.asset("assets/images/background.jpg"),
          // ),
          Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.asset("assets/coffeeCup.png"),
            ),
          ),
        ],
      )),
    );
  }
}
