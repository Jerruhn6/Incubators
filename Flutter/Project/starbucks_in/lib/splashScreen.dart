import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:starbucks_in/homeScreen.dart';
import 'package:starbucks_in/session.dart';
import 'package:starbucks_in/welcomeScreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void navigate(BuildContext context) {
    log("NAVIGATE METHOD");
      //  log(" EMAIL DATA ${SessionData.emailId!}");

    Future.delayed(const Duration(seconds: 3), () async {
          log("NAVIGATE METHODS");

      // ignore: unused_local_variable
    //  bool status=false;

    //  await SessionData.getSessionData();


        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
        {
          return HomeScreen();
        }
        ));

      // if(SessionData.isLogin!){
      //   log("Screen");
      
      // }
      // else{
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)
      //   {
      //     return Welcomescreen();
      //   }
      //   ));
     // }
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return const WelcomeScreen();
      //     },
      //   ),
      // );
    }
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