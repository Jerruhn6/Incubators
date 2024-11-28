import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(

      ),
    );
  }
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
   
   @override
  State createState()=> _MyAppState();
}

class _MyAppState extends State{

  TextEditingController nameController=TextEditingController();
  TextEditingController compController=TextEditingController();

  List<Map> dataSubmit=[];
  void addData(){
    setState(() {
       
      
      dataSubmit.add({
        "Name":nameController.text.trim(),
        "Company":compController.text.trim(),
      
      });
       

       
    
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "INFO",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                hintStyle: TextStyle(
                  fontSize: 24,
                ),
                
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: compController,
                decoration: const InputDecoration(
                  hintText: "Dream Company",
                  hintStyle: TextStyle(
                    fontSize: 24,
                  ),
                  
                  border: OutlineInputBorder(),
                ),
              ),
          ),

          GestureDetector(
            onTap:(){
              addData();
              

            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
            
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(

              shrinkWrap: true,
              itemCount: dataSubmit.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5
                    ),
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      Text("Name:${dataSubmit[index]["Name"]}"),
                       Text("Company:${dataSubmit[index]["Company"]}"),
                    ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}