import 'dart:developer';

import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String text;
  const Screen2({super.key ,required this.text});


  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void didUpdateWidget(Screen2 oldWidget){
    super.didUpdateWidget(oldWidget);
    log("In didUpdateWidgete()");
  }


  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}