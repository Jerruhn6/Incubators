import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

//   @override
//   State createState()=>_MainAppState();
// }
// class _MainAppState extends State{
  
  @override
  Widget build(BuildContext context){

    print("Device width :${MediaQuery.of(context).size.width}");
    print("Device height :${MediaQuery.of(context).size.height}");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: const Text("COLUMN SCENARIO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor:const Color.fromARGB(255, 46, 46, 46),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 261,
                width: 133,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}