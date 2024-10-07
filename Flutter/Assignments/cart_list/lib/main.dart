import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Recomended());
 
}
class Recomended extends StatefulWidget{
  const Recomended({super.key});

  @override
  State<Recomended>createState()=>_RecomendedState();
}
class _RecomendedState extends State<Recomended>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Recomended",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Color.fromRGBO(0,91,135,1),),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
             const Text("Start a new career",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 30,
                    
                  ),
                  Text("Data Science"),
                  Container(
                    height: 20,
                    width: 30,
                    color: Color.fromRGBO(0, 91, 135, 1),
                  ),
                  const Text("Machines Learning"),
                  Container(
                    height: 20,
                    width: 30,
                    color: Color.fromRGBO(0, 91, 135, 1),
                  ),
                  const Text("Apache Sparx"),
                  Container(
                    height: 20,
                    width: 30,
                    color: Color.fromRGBO(0, 91, 135, 1),
                  ),
                  const Text("Big Data"),
                  Container(
                    height:20,
                    width: 30,
                    color: Color.fromRGBO(0, 91, 135, 1),
                  ),
                  const Text("Docker"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}