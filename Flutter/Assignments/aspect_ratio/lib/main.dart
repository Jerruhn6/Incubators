import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

}

class _MainAppState extends State<MainApp>{

  TextEditingController nameController =  TextEditingController();
  String? myName;
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Aspect Ratio'),
        ),
      ),
    );
  }
}
