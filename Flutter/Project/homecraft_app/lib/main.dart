import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homecraft_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options:const FirebaseOptions(
    apiKey: "AIzaSyBGs88y9uNZkAnie11REz60FL5nO1XQRj4",
     appId:"1:90828166014:android:1ffd311d998f88ee75d92f",
      messagingSenderId: "90828166014", 
      projectId: "homecraftauthentication"),);
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}

  