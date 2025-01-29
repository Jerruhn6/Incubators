import 'package:flutter/material.dart';
import 'package:inherited_widget/Controller/employee.dart';

class EmployeeScreen2 extends StatefulWidget {
  const EmployeeScreen2({super.key});

  @override
  State<EmployeeScreen2> createState() => _EmployeeScreen2State();
}

class _EmployeeScreen2State extends State<EmployeeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(onPressed:(){
          Navigator.of(context).pop();
        },icon:  Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
        
        title: const Text(
          "Employee Screen 2",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Employee Name: ${Employee.of(context).empName}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Employee Id: ${Employee.of(context).empId}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Employee Salary: ${Employee.of(context).salary} LPA",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
