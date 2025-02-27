import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/page_view_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override

  void initState(){
    super.initState();

    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context){
          return  PageViewScreen();
        })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(
          color: Color.fromRGBO(13, 110, 253, 1),

        ),
        child: Center(
          child: Text(
            "Travenor",
            style: GoogleFonts.aclonica(
              fontSize: 34,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(255, 255, 255, 1)
            ),
          ),
        ),
      ),
    );
  }
}