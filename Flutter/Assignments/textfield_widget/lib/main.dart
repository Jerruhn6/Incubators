import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(const MainApp());
}
class MainApp extends StatefulWidget{
  const MainApp({super.key});

  @override
  State<MainApp> createState()=> _MainAppState();
}
class _MainAppState extends State<MainApp>{
  
  TextEditingController nameController=TextEditingController();
  String? myName;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text(
            "TextField Demo",
            style: GoogleFonts.actor(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
             const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                style: const TextStyle(
                  fontSize: 30
                ),
                obscureText: true,
                decoration: const InputDecoration(
                  suffix: Icon(Icons.visibility),
                  hintText: "Enter Name",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val){
                 // print("Value: $val");
                },
                onEditingComplete: (){
                 // print("Editing completed");
                },
                onSubmitted: (value) {
                 // print("Value Submitted: $value");
                },
              ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
             // print("Add Date");
              myName = nameController.text;
              //print("My Name: $myName");

              nameController.clear();
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text("Add Data",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Name: $myName",
            style: const TextStyle(
              fontSize: 20,
            ),
          )
        ],),
      ),
    );
  }
}