import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: IconButton(
              icon: const Icon(
                Icons.menu
              ),
              onPressed: () {},color: Colors.black,
            ),
          ),
        ],
      ),
      body:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.light,
            size:80,
            color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Congrat!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(35.0),
            child: Text('Thank for purchesing. Your order will be shipping in 2-4 working days.',
            style: TextStyle(color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500),),
          ),
          const SizedBox(height: 300),
          ElevatedButton(
            //clipBehavior: Clip.antiAlias,
            onPressed: () {
              //Navigate back to shopping or home screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text("Continue Shopping",
            style: TextStyle(fontSize: 20,color: Colors.black),
            ),
          ),
          ],
        ),
      )
    );
  }
}