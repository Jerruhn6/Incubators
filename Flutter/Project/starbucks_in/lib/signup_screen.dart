import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/customSnackbar.dart';
import 'package:starbucks_in/custom_scaffold.dart';
import 'package:starbucks_in/signin_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordtextEditingController =
      TextEditingController();
      final TextEditingController _numbertextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final bool _showPassword = false;

  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Get Started',
                         style: GoogleFonts.alegreya(
                            color: Colors.brown,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // full name
                      TextFormField(
                        controller: _nameTextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Full Name',),
                          labelStyle: GoogleFonts.quicksand(
                            color: Colors.black
                          ),
                          hintText: 'Enter Full Name',
                          hintStyle: GoogleFonts.quicksand(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                           
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                              color: Colors.blue,
                              width: 1.5
                            )
                          )
                        ),
                        
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // email
                      TextFormField(
                        controller: _emailTextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          labelStyle: TextStyle(
                            color: Colors.black
                          ),
                          hintStyle: GoogleFonts.quicksand(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:BorderSide(
                              color: Colors.blue,
                              width: 1.5
                            )
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // password
                      TextFormField(
                        controller: _passwordtextEditingController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          labelStyle: TextStyle(
                            color: Colors.black
                          ),
                          hintStyle: GoogleFonts.quicksand(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:BorderSide(
                              color: Colors.blue,
                              width: 1.5
                            )
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                       TextFormField(
                        controller: _numbertextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return 'Please enter Mobile Number';
                          }
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                  return 'Please enter a valid 10-digit Mobile Number';
                                }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Mobile Number',),
                          labelStyle: const TextStyle(
                            color: Colors.black
                          ),
                          hintText: 'Enter Mobile Number',
                          hintStyle: GoogleFonts.quicksand(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                           
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:BorderSide(
                              color:Colors.blue,
                              width: 1.5
                            )
                          )
                        ),
                        
                      ),
                       const SizedBox(
                        height: 25.0,
                      ),
                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          Text(
                            'I agree to the processing of ',
                            style: GoogleFonts.quicksand(
                              color: Colors.black45,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      GestureDetector(
                                   onTap: () async {
                              
                              if (_formSignupKey.currentState!.validate() &&
                                  agreePersonalData &&
                                  _emailTextEditingController.text
                                      .trim()
                                      .isNotEmpty &&
                                  _passwordtextEditingController.text
                                      .trim()
                                      .isNotEmpty && _nameTextEditingController.text.trim().isNotEmpty 
                                      && _numbertextEditingController.text.trim().isNotEmpty
                                      ) {
                                try {
                                  UserCredential userCredential =
                                      await _firebaseAuth
                                          .createUserWithEmailAndPassword(
                                    email:
                                        _emailTextEditingController.text.trim(),
                                    password: _passwordtextEditingController.text
                                        .trim(),
                                    
                                  );
                                  log("USER CREDENTIALS :$userCredential");
                                  CustomSnackbar.showCustomSnackbar(
                                    message: "User Register Successfully",
                                    context: context,
                                  );
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                                    return const SignInScreen();
                                  }));
                                } on FirebaseAuthException catch (error) {
                                  print(error.code);
                                  print("${error.message}");
                                  CustomSnackbar.showCustomSnackbar(
                                    message: error.message!,
                                    context: context,
                                  );
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //     content: Text('Processing Data'),
                                  //   ),
                                  // );
                                }
                              } else if (!agreePersonalData) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please agree to the processing of personal data')),
                                );
                              } else {
                                CustomSnackbar.showCustomSnackbar(
                                  message: "Please enter valid fields",
                                  context: context,
                                );
                              }
                            },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          
                           alignment: Alignment.center,   
                           decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(8)
                           ), 
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: GoogleFonts.quicksand(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up social media logo
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.facebook,size: 40,),
                          Icon(Icons.facebook ,size: 40,),
                          Icon(Icons.facebook,size: 40,),
                          Icon(Icons.facebook,size: 40,),
                          // Logo(Logos.facebook_logo),
                          // Logo(Logos.instagram),
                          // Logo(Logos.google),
                          // Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.quicksand(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
