import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihox_task/domain/usecase/login_usecase.dart';
import 'package:unihox_task/presentation/controllers/chat_controller.dart';
import 'package:unihox_task/presentation/screens/chatbot_screen.dart';
import 'package:unihox_task/presentation/screens/signup_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  Get.put(ChatController());
  Get.put(AuthController());



  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth App',
      home: isLoggedIn ? ChatbotScreen() : LoginScreen(),
    );
  }
}
