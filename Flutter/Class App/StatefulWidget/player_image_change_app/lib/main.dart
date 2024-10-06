import 'package:flutter/material.dart';

void main(){
  runApp(const PlayersApp());
}
class PlayersApp extends StatefulWidget{
  const PlayersApp({super.key});

  @override
  State<PlayersApp> createState()=>_PlayersAppState();
}
class _PlayersAppState extends State<PlayersApp>{
  int _counter = 0;

  List<String>playerList = <String>
  [

    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJVmhl_Mnerm8pFZzRtyH36VNOnYkoO9VjzA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR66kwbFfohApprFnmZkxMz9hGj--i8QPN2cg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKQNu-pLiRLZ_jZIgsiMDgQtmVqHM-3W8tYw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlE9UxeqNJ4DxhLeIi4PkyIL0koIaJ1A6rYw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmAvs1hO6Rv2Ud_oiWVMEKn3MxBua3Yhrpzw&s",

  ];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Players",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("Players",
          style: TextStyle(
            color:Colors.white
          ),
          ),
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                playerList[_counter],
                height: 300,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(_counter <playerList.length - 1){
              _counter++;
            }else{
              _counter=0;
            }
            setState(() {});
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add,
          color: Colors.white,
          ),
        ),
      ),
    );
  }
}