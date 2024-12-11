import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      // ignore: sized_box_for_whitespace
      body: Center(
        //child:
          //height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/coffeeCup.png',fit: BoxFit.cover
        ),
      ),
    );
  }
}