import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Employee extends InheritedWidget {
  final String empName;
  final int empId;
  double salary;

  Employee(
      {super.key,
      required this.empName,
      required this.empId,
      required this.salary,
      required super.child});

      static Employee of(BuildContext context){
        return context.dependOnInheritedWidgetOfExactType<Employee>()!;
      }

  @override
  bool updateShouldNotify(Employee oldWidget) {
    log("In updateShouldNotify");
    return salary != oldWidget.salary;
  }
}
