import 'dart:convert';
import 'dart:developer';

import 'package:api_binding/display_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIBinding extends StatefulWidget {
  const APIBinding({super.key});

  @override
  State<APIBinding> createState() => _APIBindingState();
}

class _APIBindingState extends State<APIBinding> {

  void getAllDeviceData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    http.Response response = await http.get(url);
    log(response.body);

    dynamic jsonData = json.decode(response.body);
    

    Navigator.push(context, MaterialPageRoute(builder: (Context) {
      return DisplayDataScreen(
        data: jsonData,);
    }));
  }
  
  // void postDeviceData()async{

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "API Binding",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: getAllDeviceData,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3.5,
                              blurRadius: 4,
                              offset: const Offset(4, 4))
                        ],
                        color: Colors.black,
                      ),
                      child: const Text(
                        "Get Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3.5,
                              blurRadius: 4,
                              offset: const Offset(4, 4))
                        ],
                        color: Colors.black,
                      ),
                      child: const Text(
                        "post Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3.5,
                              blurRadius: 4,
                              offset: const Offset(4, 4))
                        ],
                        color: Colors.black,
                      ),
                      child: const Text(
                        "Update Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 3.5,
                            blurRadius: 4,
                            offset: const Offset(4, 4))
                      ], color: Colors.black),
                      child: const Text(
                        "Delete Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
