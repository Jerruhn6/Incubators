import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyCqIJOq2rLH9mpMVdOP2I9MY0wPzotkN3c", appId: "1:512625998670:android:4109b190bf674f6e26bc1f", messagingSenderId: "512625998670", projectId: "employeeinfo-a6b48")
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EmployeeInfo(),
    );
  }
}

class EmployeeInfo extends StatefulWidget {
  const EmployeeInfo({super.key});

  @override
  State<EmployeeInfo> createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {

  TextEditingController empNameTextEditingController = TextEditingController();
  TextEditingController empSalTextEditingController = TextEditingController();
  TextEditingController devTypeTextEditingController = TextEditingController();

  double hightSal = 0;
  Map<String,dynamic> empData ={};

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Employee Info"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  Column(
        children: [
          TextField(
            controller: empNameTextEditingController,
            decoration: const InputDecoration(
              hintText:"Enter Employee Name" ,
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: empSalTextEditingController,
            decoration: const InputDecoration(
              hintText:"Enter Employee Salary" ,
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: devTypeTextEditingController,
            decoration: const InputDecoration(
            hintText:"Enter Employee Dev Type" ,
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: ()async{
              Map<String,dynamic> data = {
                "empName" : empNameTextEditingController.text,
                "empSal" : empSalTextEditingController.text,
                "devType" : devTypeTextEditingController.text,
              };
              await FirebaseFirestore.instance.collection("empInfo").add(data);
            },
            child: const Text("Add Data"),
          ),
          const SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: ()async {
                QuerySnapshot responce = await FirebaseFirestore.instance
                    .collection("EmployeeData")
                    .get();

                // int idx;
                for (dynamic value in responce.docs) {
                  // log("value::${value.data()['empName']}");
                  if (hightSal < double.parse(value.data()['empSal'])) {
                    hightSal = double.parse(value.data()['empSal']);
                  }
                }
                for (dynamic value in responce.docs) {
                  // log("value::${value.data()['empName']}");
                  if (hightSal == double.parse(value.data()['empSal'])) {
                    log("Employee Name::${value.data()['empName']}");
                    log("Employee Salary::${value.data()['empSal']}");
                    log("Employee Name::${value.data()['empType']}");
                    empData = {
                      "empName": value.data()['empName'],
                      "empSal": value.data()['empSal'],
                      "empType": value.data()['empType'],
                    };
                    setState(() {});
                  }
                }
              },
            child: const Text("Get Data"),
          ),
        ],
        
      ),
      
    );
  }
}