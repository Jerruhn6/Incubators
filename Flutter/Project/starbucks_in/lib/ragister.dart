import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/customSnackbar.dart';
import 'package:starbucks_in/welcomeScreen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      //backgroundColor: Colors.brown[800],
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(
                'Sign Up',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                // style: GoogleFonts.lato(
                //   textStyle: Theme.of(context).textTheme.headline4,
                //   fontSize: 40,
                //   fontWeight: FontWeight.bold,
                //   fontStyle: FontStyle.italic,
                //   color: Colors.brown,
                // ),
              ),
              const SizedBox(height: 20),
              Text(
                "Create a new account",style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                
                // style: GoogleFonts.lato(
                //   textStyle: Theme.of(context).textTheme.subtitle1,
                //   fontSize: 20,
                //   fontStyle: FontStyle.italic,
                //   color: Colors.black54,
                // ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Re-enter your password',
                  hintStyle: TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 216, 6, 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _register,
                  child: Text(
                    'Register',
                    style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
               TextButton(
                style: ButtonStyle(
                //  backgroundColor:WidgetStatePropertyAll(),
                ),
                onPressed: () {
                  Navigator.pop(context); 
                },
                child: Text(
                  'Already have an account? Log in here',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      CustomSnackbar.showCustomSnackbar(
        message: 'All fields are required',
        context: context,
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      CustomSnackbar.showCustomSnackbar(
        message: 'Passwords do not match',
        context: context,
      );
      return;
    }

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      log("User registered: ${userCredential.user!.email}");
      CustomSnackbar.showCustomSnackbar(
        message: 'Registration successful!',
        context: context,
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Welcomescreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      log("Error: ${error.code}");
      CustomSnackbar.showCustomSnackbar(
        message: error.message ?? 'An error occurred',
        context: context,
      );
    }
  }
}
