import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To_do list",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TextEditingController title = TextEditingController();
  //TextEditingController description = TextEditingController();
  //TextEditingController date = TextEditingController();
  //String? myTitle;

  Color checkColor(int index) {
    if (index % 4 == 0) {
      return const Color.fromRGBO(250, 232, 232, 1);
    } else if (index % 4 == 1) {
      return const Color.fromRGBO(232, 237, 250, 1);
    } else if (index % 4 == 2) {
      return const Color.fromRGBO(250, 249, 232, 1);
    } else {
      return const Color.fromRGBO(250, 232, 250, 1);
    }
  }

  void openBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            right: 20,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Create To-do",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
              ]),
              const Text(
                "Title",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 137, 148, 1)),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(1, 167, 177, 1))),
                    hintText: "Enter Title"),
              ),
              const Text(
                "Description",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 137, 148, 1)),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 137, 148, 1))),
                    hintText: "Enter Description"),
              ),
              const Text(
                "Date",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 137, 148, 1)),
              ),
              TextField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(1, 167, 177, 1))),
                    hintText: "Enter Date"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do list",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        //physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 230,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: checkColor(index),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.image),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 267,
                                child: Text(
                                  "Lorem ipsum is simply industry",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 100,
                                  width: 250,
                                  child: Text(
                                    "simply dummy text of the printing and typesetting indunstry.Lorem ipsum has been the industry's standard dummy text ever since the 1500s ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            "10 july 2023",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Icon(
                            Icons.edit_outlined,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.delete_outline,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomSheet();
        },
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(0, 139, 148, 1),
        ),
      ),
    );
  }
}