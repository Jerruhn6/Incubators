

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_lifecycle/screen2.dart';

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({super.key});

  @override
  State<WidgetLifecycle> createState() { 
    log("In createState()");
    return _WidgetLifecycleState();}
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  String str = "C2W";

  @override
  Widget build(BuildContext context) {
    log("In build");
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
        "Widget Lifecycle",)
      ),
      body: Center(
        child: Column(
          children: [
             const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  log("In setState()");
                  str = (str == "C2W")? "Core2Web" : "C2W";
                });
              }, child: const Text("change Data"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return Screen2(text: str);
        }));
      },),
    );
  }
  @override
  void initState(){
    super.initState();
    log("In initState()");
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    log("In didChangeDependencies()");
  }
  
  @override
  void deactivate(){
    super.deactivate();
    log("In deactivate()");
  }
  @override
  void dispose(){
    super.dispose();
    log("In dispose()");
  }
}