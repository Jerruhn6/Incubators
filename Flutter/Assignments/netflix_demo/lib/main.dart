//import 'package:flutter/material.dar';
import 'package:flutter/material.dart';
void main(){
  runApp(const MainApp());
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: const Text("NETFLIX",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body:ListView.builder(
          itemCount: 1,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Action Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:[
                      Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJru4nlVSH50IWcSCGEF2q8TdnwE_Ba1BauQ&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7utH2P4eA0FTr99hjE_1nUzub4QF-HAOnOQ&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStS4ZK7KcI60t_ynejmksp12ARFbW1lEcC-w&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs3tVg7M6XQyGNv3wrc8rqHLPmSZs6rBVtpg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDOJNKg7sndqb4FbnC7p8C86j11QsuUOxWKg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s"),
                    ),
                    ],
                  ),
                ),
                const Text(
                  "Horror Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:[
                      Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR63mG2HMvUVbDXDy8KRypX9vkny8x5F613Sg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjzSXd9sAYQk6nXg0HuiqouvvmbYTHvpDqMQ&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtMc3mfuqCnENtPkORALkHl7mnrBE049tqpA&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs3tVg7M6XQyGNv3wrc8rqHLPmSZs6rBVtpg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDOJNKg7sndqb4FbnC7p8C86j11QsuUOxWKg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s"),
                    ),
                    ],
                  ),
                ),
                const Text(
                  "Romantic Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:[
                      Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa2-uSzo-2gk-CbsTcgpQrzkTMxAQ6NcDF5g&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL6352johC1O6X-3SQvBh-S6MEMMeg0lDreQ&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbhwa8Cjd4_EvQdsYAd5EsY23uoBJn7ARfkA&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD0lqIpKMGcnR5i2xyPtz7qp4PNLUErPkT4Q&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDOJNKg7sndqb4FbnC7p8C86j11QsuUOxWKg&s"),
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      height: 300,
                      width: 200,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi90VNmtJ409-_ERzqY8r7JXBzgo4rliei5w&s"),
                    ),
                    ],
                  ),
                ),
              ],
              
            );
            
          },
        ),
      ),
    );
  }
}