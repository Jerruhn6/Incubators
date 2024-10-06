import 'package:flutter/material.dart';

void main(){

  runApp(const MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "India Flag",
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("India Flag"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  
       Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width: 300,
              height: 45,
              color: Colors.orange,
            ),
            Container(
              width: 300,
              height: 45,
              color: Colors.white,
              child: Image.network("data:image/png;base64,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",
              ),
            ),
            Container(
              width: 300,
              height: 45,
              color: Colors.green,
            )

          ],
        ),
      ),
    );

  }
}