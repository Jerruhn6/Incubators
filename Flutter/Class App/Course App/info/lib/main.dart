import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState()=> _MainAppState();
}
class _MainAppState extends State<MainApp>{

  TextEditingController nameController= TextEditingController();
  TextEditingController companyController = TextEditingController();

  String? name;
  String? cmpany;

  List<Map>data=[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Info",style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Enter Name",
                    hintStyle: TextStyle()
                  ),
                ),
              )
            ],
        ),
      ),
    );
  }
}
