import 'package:flutter/material.dart';
import 'package:inherited_widget/Controller/employee.dart';
import 'package:inherited_widget/view/employee_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  final String empName = "Ashish";
  final int empId = 1001;
  final double salary = 3.5;

   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Employee(
      empName: empName,
      empId: empId,
      salary: salary,
      child: const MaterialApp(
        home: EmployeeScreen1(),
      ),
    );
  }
}