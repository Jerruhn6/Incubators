
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

}
class _MainAppState extends State<MainApp>{
  TextEditingController nameController= TextEditingController();
  String? myName;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Textfield ListView Demo",
            style: TextStyle(
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
                  fontSize: 30,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  hintStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val) =>("Value: $val"),
                onEditingComplete: () =>("Editing Completed"),
                onSubmitted: (String val) =>("Editing Completed"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                print("Add Data");
                myName=nameController.text.trim();
                print("My Name: $myName");
                if(myName !=""){
                  playerList.add(myName!);
                  print("PlayersList lenght: ${PlayersList.lenght}");
                  nameController.clear()
                }
              },
            )
          ],
        )
      ),
    );
  }
}
