import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar Color App',
      home: AppbarColorApp(),
    
    );
  }
}
class AppbarColorApp extends StatefulWidget {
  const AppbarColorApp({super.key});

  @override
  State<AppbarColorApp> createState() => _AppbarColorAppState();
}
class _AppbarColorAppState extends State<AppbarColorApp>{
  bool colorChange = true;
  // int count=0; `
  @override
  Widget build(BuildContext contex){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar:AppBar(
        title: const Text("AppBar App"),
        centerTitle: true,
        backgroundColor: (colorChange)? Colors.amber : Colors.blue,
        ),
        body: Container(
          decoration: const  BoxDecoration(
            image: DecorationImage(
            image: NetworkImage("https://4kwallpapers.com/images/walls/thumbs_2t/8324.png"),
            fit: BoxFit.cover,
          ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color:colorChange?Colors.red:Colors.black,
                ),
              ],
            ),
          ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(colorChange){
              colorChange = false;
            }else{
              colorChange = true;
            }
            setState(() {
              
            });
          },
          child: const Icon(Icons.add),
          ),
       ),
    );
  }
}