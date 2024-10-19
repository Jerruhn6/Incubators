import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatefulWidget{
  const MainApp({super.key});
  @override
  State<MainApp> createState()=> _MainAppState();
}

class _MainAppState extends State<MainApp> {


  TextEditingController nameController=TextEditingController();
  TextEditingController compnayController=TextEditingController();

  String? name;
  String? cmpName;

  List<Map> data=[];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("Info",
          style: TextStyle(fontSize: 40,
          fontWeight: FontWeight.w400,
          color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: compnayController,
                decoration: const InputDecoration(
                  hintText: "Dream Company",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
             style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black),),
              onPressed:() {
                name=nameController.text;
                cmpName=compnayController.text;

                data.add({
                  "name":name,
                  "cmpName":cmpName,
                });
                nameController.clear();
                compnayController.clear();
                setState(() {
                  
                });
              }, 
              child: const Text("Submit",
              style: TextStyle(fontSize:25,
              color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                width: 350,
                child: ListView.builder(itemCount: data.length, 
                itemBuilder:(BuildContext context, int index){
                  return Container(
                    child: (
                         Column(
                        children: [
                          Text("Name : ${data[index]['name']}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.grey),
                          ),
                          Text("Dream Company : ${data[index]['cmpName']}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.grey),
                          ),
                        ],
                      )
                    ),
                  );
                },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.black,
          ),
        ),
        ),
      );
  }
}
