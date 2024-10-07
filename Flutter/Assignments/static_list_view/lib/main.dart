import 'package:flutter/material.dart';

void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Text("Static List View",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            Image.network("https://g2.img-dpreview.com/81C81CB44922409EA3C99FA3E42369CD.jpg"
            ),
            const Icon(Icons.favorite,color: Colors.redAccent,),
            const Icon(Icons.message,color: Colors.black,),
            const Icon(Icons.share,),
            const Spacer(),
            const Icon(Icons.bookmark),
            
            const Text(
              "Nature LandScap",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,
              ),
            ),
            Image.network("https://g2.img-dpreview.com/81C81CB44922409EA3C99FA3E42369CD.jpg"
            ),
            GestureDetector(
              onTap:(){
                print("Button pressed");
              },
              child: Container(
                height: 60,
                color: Colors.amber,
                child: const Text("PRESS ME",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
