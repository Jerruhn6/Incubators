//import 'package:flutter/material.dar';
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
          title: const Text("NETFLIX",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body:ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Action Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                      padding:const EdgeInsets.all(1),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDJH-n02M3TtjnuBWjoFovi-uMJ_2gWRgSEA&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjzSXd9sAYQk6nXg0HuiqouvvmbYTHvpDqMQ&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtMc3mfuqCnENtPkORALkHl7mnrBE049tqpA&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs3tVg7M6XQyGNv3wrc8rqHLPmSZs6rBVtpg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDOJNKg7sndqb4FbnC7p8C86j11QsuUOxWKg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s"),
                    ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}