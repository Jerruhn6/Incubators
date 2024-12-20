import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/customSnackbar.dart';
// ignore: unused_import
import 'package:starbucks_in/homeScreen.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/register.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordtextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Theme.of(context).colorScheme.errorContainer,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
             Image.asset("assets/image_15.png"),
             Image.asset("assets/image_15.png"),
             Image.asset("assets/image_15.png"),
             Image.asset("assets/image_15.png"),
            // Image.asset("assets/image_15.png"),
            // Image.asset("assets/image_15.png"),
            // Image.asset("assets/image_15.png"),
            Positioned(
              top: MediaQuery.of(context).size.height - 13,
              //bottom: MediaQuery.of(context).size.height - 400,
              child: Image.asset("assets/image_15.png"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 890,
              //bottom: MediaQuery.of(context).size.height - 400,
              child: Image.asset("assets/image_15.png"),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 220,
                ),
                Text(
                  'WelCome BacK!',
                  style: GoogleFonts.raleway(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to your account.",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.brown),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _emailTextEditingController,
                   // obscureText: true,//to display keyborad on screen
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.brown),
                        hintText: 'Enter valid Email',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _passwordtextEditingController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter secure password',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 75,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.brown.shade300,
                            Colors.brown.shade800
                          ], // Gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius:
                            BorderRadius.circular(12), // Match button shape
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.brown,
                          //const Color.fromARGB(0, 160, 6, 6), // Transparent button
                          shadowColor:
                          Colors.brown[900], // Remove default shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Consistent radius
                          ),
                        ),
                        onPressed: () async {
                          if (_emailTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              _passwordtextEditingController.text
                                  .trim()
                                  .isNotEmpty) {
                            try {
                              UserCredential userCredential =
                                  await _firebaseAuth.signInWithEmailAndPassword(
                                email: _emailTextEditingController.text,
                                password: _passwordtextEditingController.text,
                              );
                              log("C2W :UserCredential:${userCredential.user!.email}");
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NavigationPage(
                                      email: userCredential.user!.email!,
                                    );
                                  },
                                ),
                              );
                            } on FirebaseAuthException catch (error) {
                              log("C2W : error : ${error.code}");
                              log("C2W : error : ${error.message}");
                              CustomSnackbar.showCustomSnackbar(
                                message: error.code,
                                context: context,
                              );
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const RegisterPage();
                      }));
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black,fontSize: 22),
                        
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 205, 26, 13),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            // Add an action here if needed
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        
                // SizedBox(
                //   height: 65,
                //   width: 360,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 20.0),
                //     child: ElevatedButton(
                //       style: const ButtonStyle(),
                //       onPressed: () {},
                //       child: Text(
                //         'Login ',
                //         style: GoogleFonts.lato(
                //           textStyle: Theme.of(context).textTheme.displayLarge,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           fontStyle: FontStyle.italic,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
        
                // Center(
                //   child: Image.asset('assets/Pride Standing.png'),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
