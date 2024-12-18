import 'package:flutter/material.dart';
//import 'package:flutter/animation.dart' 

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List View Builder",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: 100,
          physics: const BouncingScrollPhysics(),
          itemBuilder:(BuildContext constext, int index){
            return Text(
              "Index:$index",
              style: const TextStyle(
                fontSize: 30,
                fontWeight:FontWeight.w500,
              ),
            );
          },
        ),
      ),
    );
  }
}