import 'package:flutter/material.dart';

void main(){
  runApp(const ContainerApp());
}
class ContainerApp extends StatelessWidget{
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text("Container App"),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaEDaO5okxEoXFNrzRNcu2Ek4rzsMeT96D-Q&s",
            ),
          ),
        ),
      ),
    );
  }
}