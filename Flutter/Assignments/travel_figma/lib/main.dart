import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(27, 28, 101, 100),
          title:const Text("Where do you want to travel?",
          style: TextStyle(fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const SizedBox (
              height: 30,
              width: 80,
             // Colors.blue
            ),
            Row(
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 15,top: 20),
                  child: Container(
                    height: 41,
                    width: 314,

                    decoration: BoxDecoration(
                      color:const  Color.fromRGBO(233, 237, 248, 1),

                      borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select Destination",style: TextStyle(color: Colors.blue),
                        ),
                        Icon(Icons.keyboard_arrow_down_sharp,color: Colors.blue,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Container(
                    height: 41,
                    width: 41,

                    decoration: BoxDecoration(
                      //color:const  Color.fromARGB(1, 53, 110, 249),
                      color: Colors.blue,

                      borderRadius: BorderRadiusDirectional.circular(100)
                    ),
                    child: const Icon(Icons.search,color: Colors.white,),
                    // child:const Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("Select Destination",style: TextStyle(color: Colors.blue),
                    //     ),
                    //     Icon(Icons.keyboard_arrow_down_sharp,color: Colors.blue,)
                    //   ],
                    // ),
                  ),

                ), 
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height:145,
              width: 467, 
              child:const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                     padding: EdgeInsets.only(top: 50),
                     child: Text("Best Deals",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                     ),
                   ),
                   Row(
                     children: [
                       Text("Sorted by lower price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Color.fromARGB(255, 129, 125, 125)), //Color.fromARGB(1, 179, 182, 187)),
                       ),
                       Icon(Icons.keyboard_arrow_down_sharp,color: Color.fromARGB(255, 129, 125, 125),),
                     ],
                   ), 
                 ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 145,
                  width: 145,
                  color: const Color.fromARGB(1, 233, 237, 248),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}