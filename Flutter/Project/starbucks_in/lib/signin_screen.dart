import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/ADMIN_SIDE/adminScreen.dart';
import 'package:starbucks_in/View/homeScreen.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/customSnackbar.dart';
import 'package:starbucks_in/custom_scaffold.dart';
import 'package:starbucks_in/favorite_screen.dart';
import 'package:starbucks_in/navigator.dart';
import 'package:starbucks_in/session.dart';
import 'package:starbucks_in/signup_screen.dart';
import 'package:icons_plus/icons_plus.dart';

class SignInScreen extends StatefulWidget {
  bool isUser;
  SignInScreen({super.key, required this.isUser});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final bool _showPassword = false;

  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
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
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.alegreya(
                          color: Colors.brown,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
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
                            labelStyle: const TextStyle(color: Colors.black),
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
                                borderSide: BorderSide(
                                    color: Colors.blue, //Color(0xFFFFE082),
                                    width: 1.5))),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _passwordTextEditingController,
                        obscureText: true,
                        obscuringCharacter: '•',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text('Password'),
                            hintText: 'Enter Password',
                            labelStyle: const TextStyle(color: Colors.black),
                            hintStyle: GoogleFonts.quicksand(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 1.5))),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                              Text(
                                'Remember me',
                                style: GoogleFonts.quicksand(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Forget password?',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formSignInKey.currentState!.validate() &&
                              rememberPassword &&
                              _emailTextEditingController.text
                                  .trim()
                                  .isNotEmpty &&
                              _passwordTextEditingController.text
                                  .trim()
                                  .isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Processing Data'),
                              ),
                            );
                            try {
                              UserCredential userCredential =
                                  await _firebaseAuth
                                      .signInWithEmailAndPassword(
                                email: _emailTextEditingController.text,
                                password: _passwordTextEditingController.text,
                              );
                              log("UserCredentials:${userCredential.user!.email}");
                              //-------sharedPreference
                              await SessionData.storeSessionData(
                                loginData: true,
                                emailId: userCredential.user!.email!,
                              );

                              // Navigator.of(context).pushAndRemoveUntil(
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return AnimatedNavbar(
                              //     basketCount:basketList.length,
                              //     favCount: wishlist.length,
                              //     // email: userCredential.user!.email!,
                              //   );
                              //     },
                              //   ),(route){
                              //     return false;
                              //   },
                              // );
                               if (widget.isUser) {
                          
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AnimatedNavbar(
                                      basketCount:basketList.length,
                                      favCount: wishlist.length,
                                      // email: userCredential.user!.email!,
                                    );
                                      },
                                    ),(route){
                                      return false;
                                    },
                                  );
                          
                        } else {
                          
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AdminScreen(
                                            userName:_emailTextEditingController.text ,
                                            mNo:"9325822114" ,
                                      // email: userCredential.user!.email!,
                                    );
                                      },
                                    ),(route){
                                      return false;
                                    },
                                  );
                        }
                            } on FirebaseAuthException catch (error) {
                              log("ERROR :${error.code}");
                              log("ERROR :${error.message}");
                              CustomSnackbar.showCustomSnackbar(
                                message: error.code,
                                context: context,
                              );
                            }
                          } else if (!rememberPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please agree to the processing of personal data'),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
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
                        height: 25.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.facebook,
                            size: 40,
                          ),
                          Icon(
                            Icons.facebook,
                            size: 40,
                          ),
                          Icon(
                            Icons.facebook,
                            size: 40,
                          ),
                          Icon(
                            Icons.facebook,
                            size: 40,
                          ),
                          //  Logo(Logos.facebook_logo),
                          //   Logo(Logos.instagram),
                          //   Logo(Logos.google),
                          //   Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: GoogleFonts.quicksand(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => SignUpScreen(
                                    isUser: widget.isUser,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
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
