import 'package:complete_todo_app_basic/todo_model.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TodoAppUI extends StatefulWidget{
  const TodoAppUI({super.key});

  @override
  State createState() => _TodoAppUIState();
}
class _TodoAppUIState extends State {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //list of cards
  List<TodoModel> todoCards = [

   /* TodoModel(
      title:"Flutter",
      description: "Execption, OOP",
      date:"18 october,2024"
    ),
    TodoModel(0
      title:"JAVA",
      description: "Execption Handeling, OOP, DSA",
      date:"19 october,2024"
    ),
    TodoModel(

      title:"PYTHON",
      description: "Execption, OOP, Matchine learning, Deep Learning",
      date:"20 october,2024"
    ),
    TodoModel(

      title:"CPP",
      description: "Execption, OOP",
      date:"21 october,2024"
    ),*/
  ];
  //List of colors

  List<Color> cardColorsList =[

    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];
  void submit(bool doEdit,[TodoModel? todoObj]){
    if(titleController.text.trim().isNotEmpty && descriptionController.text.trim().isNotEmpty && dateController.text.trim().isNotEmpty){
      if(doEdit){
        //Edit
        todoObj!.title = titleController.text;
        todoObj.description = descriptionController.text;
        todoObj.date = dateController.text;
      }else{
        //New add
        todoCards.add(
          TodoModel (
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text,
          ),
        );
      }
    }
    
    Navigator.of(context).pop();
    clearControllers();
    setState(() { });
  }
  void clearControllers(){
      titleController.clear();
      descriptionController.clear();
      dateController.clear();
    }

  
  void showBottomSheet(bool doEdit, [TodoModel? todoObj]){
    
   showModalBottomSheet(
    isScrollControlled: true,
    context: context, 
   builder: (context){
    return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 12.0,
          right: 12.0,
          left: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create Todo",
                style: GoogleFonts.quicksand(
                  fontWeight:FontWeight.w600,
                  fontSize:24,
                  color: Colors.black,
                  ),
                ),
              ],
            ),
            //title textField
            Text(
              "Title",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color:const Color.fromRGBO(0, 139, 148, 1.0)
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter Title",
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0,139,148,1.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Description
            Text(
              "Description",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color:const Color.fromRGBO(0, 139, 148, 1.0)
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0,139,148,1.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Date",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color:const Color.fromRGBO(0, 139, 148, 1.0)
              ),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0,139,148,1.0),
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2025),
                );

                String formattedDate= DateFormat.yMMMd().format(pickedDate!);

                setState(() {
                  dateController.text= formattedDate;
                });
              },
            ),
            Center(
              child:ElevatedButton(
                onPressed: () {
                  if (doEdit == true){
                    submit(true, todoObj);
                  }else{
                    submit(false);
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(0, 139, 148, 1),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do-List",
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w700,
          fontSize: 26,
          color: Colors.white,
        ),
        ),
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1.0),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: todoCards.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding:const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: cardColorsList[index % cardColorsList.length],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      //Image
                     
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                            child: const Icon(Icons.image),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      //card Content
                      Expanded(child: Column(
                        children: [
                          //Title
                          Text(todoCards[index].title,
                          style:const TextStyle(
                            fontSize: 20,
                          fontWeight: FontWeight.bold
                          ) ,),

                          //Description
                          Text(todoCards[index].description,
                          ),
                        ],
                      ),
                      )
                    ],
                  ),
                  Padding(
                    padding:const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          todoCards[index].date,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                          ),
                        ),
                        const Spacer(),

                        //Edit Icon
                        GestureDetector(
                          onTap: (){
                            titleController.text = todoCards[index].title;
                            descriptionController.text = todoCards[index].description;
                            dateController.text = todoCards[index].date;

                            showBottomSheet(
                              true,
                              todoCards[index],
                            );
                            setState(() { });
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Color.fromRGBO(0, 139, 148, 1.0),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            todoCards.remove(todoCards[index]);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: Color.fromRGBO(0, 139, 148, 1.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showBottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1.0),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}


