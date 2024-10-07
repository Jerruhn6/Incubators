import "package:flutter/material.dart";
void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Text(
            "Column Demo",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDBqbG4g53dPziSIbL-ITmLWMTpKmTjkvA-A&s"),

               Container(
                 height:200,
                 width:200,
                 color:Colors.amber,
               ),
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDBqbG4g53dPziSIbL-ITmLWMTpKmTjkvA-A&s"),
               Container(
                 height: 200,
                 width: 200,
                 color: const Color.fromARGB(255, 70, 68, 65),
               ),
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDBqbG4g53dPziSIbL-ITmLWMTpKmTjkvA-A&s"),
               Container(
                 height: 200,
                 width: 200,
                 color: const Color.fromARGB(255, 160, 156, 143),
               ),
            ],
          ),
        ),
      ),
    );
  }
}