import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Text("VEGG_MART",style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(66, 107, 31, 100)),
          ),
          actions: const [
            Text("Shop",style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black
            ),),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 20,
              width: 40,
              child: Text("Basket",
              fontSize:15),
            ),
          ],
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
