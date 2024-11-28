import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todoMod.dart';
import "main.dart";


class TodoAdvance extends StatefulWidget {
  const TodoAdvance({super.key});

  @override
  State createState() => _TodoAdvance();
}

class _TodoAdvance extends State {

btshet(BuildContext context, List<TodoModel> todoCards) {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Create To-Do",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700, fontSize: 25)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("title",
                  style: TextStyle(
                    color: Color.fromRGBO(89, 57, 241, 1),
                  )),
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),

                      //filled:true,
                      hintText: "Enter Title. ",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 170, 168, 168))))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("description",
                  style: TextStyle(
                    color: Color.fromRGBO(89, 57, 241, 1),
                  )),
              TextField(
                  controller: descriptionController,
                  style: const TextStyle(height: 0),
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Enter Description. ",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 170, 168, 168)))),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 23),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Date",
                  style: TextStyle(
                    color: Color.fromRGBO(89, 57, 241, 1),
                  )),
              TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Enter Date. ",
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: Color.fromARGB(255, 155, 151, 151),
                      ),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 170, 168, 168)))),
            ]),
          ),
          const SizedBox(height: 18),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
               
                if (titleController.text.trim().isNotEmpty &&
                    descriptionController.text.trim().isNotEmpty &&
                    dateController.text.trim().isNotEmpty) {
                  // todoCards.add(
                  //   todoModel(
                  //       title: titleController.text,
                  //       description: descriptionController.text,
                  //       date: dateController.text),
                  // );

                  insertData(
                    TodoModel(
                        id: i,
                         title: titleController.text,
                         description: descriptionController.text,
                        date: dateController.text
                    )
                    
                  );
                  Navigator.of(context).pop();
                  setState((){});
                }
              },
              child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(89, 57, 241, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("Submit",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )),
            )
          ])
        ]);
      });
}

 
 List<TodoModel> todoCards = [];

  fun(){
    setState((){});
  }
 //TextEditingController tit
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 65, left: 25),
            child: Text("Good Morning",
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0, left: 25),
            child: Text("Durgesh",
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
          const SizedBox(height:40),
          Container(
              height: 699,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color.fromRGBO(217, 217, 217, 1)),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(top:20.0,bottom:5),
                  child: Text(" CREATE TO DO LIST ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                        //height: 693,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            color: Color.fromRGBO(255, 255, 255, 1)),
                          child :Padding(
                            padding: const EdgeInsets.only(top:35),
                            child: ListView.builder(
                              itemCount:todoCards.length,
                              itemBuilder:(context,index){
                                return Slidable(
                                  endActionPane: 
                                   ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            
                                            children:[
                                               Padding(
                                                 padding: const EdgeInsets.only(top:15  ),
                                                 child: SizedBox(
                                                  height:90,
                                                  width:80,
                                                
                                                  child: Column(
                                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      
                                                      Container(
                                                        height:40,
                                                        width:40,
                                                        decoration:const BoxDecoration(
                                                          color:Color.fromRGBO(89, 57, 241, 1),
                                                          shape:BoxShape.circle,
                                                        ),
                                                        child: 
                                                          const Icon(Icons.edit_outlined,color:Colors.white)
                                                        ),
                                                        Container(
                            
                                                        height:40,
                                                        width:40,
                                                        decoration:const BoxDecoration(
                                                          color:Color.fromRGBO(89, 57, 241, 1),
                                                          shape:BoxShape.circle,
                                                        ),
                                                        child: 
                                                          const Icon(Icons.delete_outline_outlined,color:Colors.white)
                                                        ),
                                                       
                                                    ],
                                                  )
                                                ),
                                               ),
                                             
                                            ]
                                          ),
                                        )
                                       
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                        height: 100,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 0.16),
                                                spreadRadius: 0,
                                                blurRadius: 12,
                                                offset: Offset(0, 3),
                                              )
                                            ]),
                                        child: Row(children: [
                                          const SizedBox(width:15),
                                          Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      217, 217, 217, 1),
                                                  shape: BoxShape.circle),
                                              child: const Icon(Icons.image,
                                                  size: 30, color: Colors.white)),
                                           Padding(
                                            padding: const EdgeInsets.only(left:15,top:8.0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      (todoData[index].toString()
                                                      ),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                              const SizedBox(height:5),
                                                  Expanded(
                                                      child: SizedBox(
                                                          width: 300,
                                                          child: Text(
                                                            "${todoCards[index].description}",
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      12)))),
                                                   Padding(
                                                    padding: const EdgeInsets.only(bottom:8.0),
                                                    child: Text("${todoCards[index].date}",
                                                        style:
                                                            const TextStyle(fontSize: 12)),
                                                  )
                                                ]),
                                          )
                                        ])),
                                  ),
                                );
                            
                              }
                            ),
                          )
                      ),
                  ),
                ),
              ]))
        ]
      ),
      floatingActionButton:FloatingActionButton(
         backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
              onPressed: () {
                btshet(context,todoCards);
              },
              child: const Icon(Icons.add, color: Colors.white, size: 35)
      ),
      
    
    );
  }
}
