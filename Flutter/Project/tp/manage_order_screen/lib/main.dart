import 'package:flutter/material.dart';
import 'package:manage_order_screen/ordersPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrdersPage()
    );
  }
}
