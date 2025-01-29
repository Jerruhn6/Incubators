import 'package:flutter/material.dart';
void main(){
    runApp(const MainApp());
}
class MainApp extends StatelessWidget{
    const MainApp({super.key});

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            home:Scaffold(
                backgroundColor: Colors.black,
                appBar:AppBar(
                    title: const Text("Container Gradient",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.black,
                ),
                body:
                Center(
                    child:Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.bottomLeft,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                    Colors.black,
                                    Colors.pink,
                                ],
                            ),
                        ),
                        child: const Text(
                            "Jerry",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                            ),
                        ),
                ) ,),
            ),
        );
    }
}