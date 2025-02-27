import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(child: Image.network("https://files.softicons.com/download/android-icons/flat-icons-by-martz90/png/512x512/music.png",fit: BoxFit.fill,)),
          Positioned(bottom: 20,
            child: Column(
              children: [
                Text("Ashish",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
                 Text("Ashish",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
                 Text("Ashish",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}