import 'dart:math';

import 'package:flutter/material.dart';
import 'db_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SQLight Database",style: TextStyle(color: Colors.white
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: ()async{
              await DBHandler().insertData(3, 'Monika', 21);
              final data = await DBHandler().readData();
              log(data);
            },
            child: const Text("Insert",style: TextStyle(
              fontSize: 30,
            ),
          ),
            
          ),
          ),
        ],
      ),
    );
  }
}