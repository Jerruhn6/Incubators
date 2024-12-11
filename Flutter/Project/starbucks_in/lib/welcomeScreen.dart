import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Stack(
          children: [
            Image.asset("assets/image_15.png"),
            Image.asset("assets/image_15.png"),
            Image.asset("assets/image_15.png"),
            Image.asset("assets/image_15.png"),
            Image.asset("assets/image_15.png"),
            // Image.asset("assets/image_15.png"),
            // Image.asset("assets/image_15.png"),
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.lato(
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
                const Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.brown),
                        hintText: 'Enter valid Username',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
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
                  height: 65,
                  width: 360,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
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
                              Colors.transparent, // Transparent button
                          shadowColor:
                              Colors.transparent, // Remove default shadow
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Consistent radius
                          ),
                        ),
                        onPressed: () {
                          print('Login button pressed');
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color:
                                Colors.white, // Ensure contrast with gradient
                          ),
                        ),
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
            Positioned(
              top: MediaQuery.of(context).size.height - 413,
              //bottom: MediaQuery.of(context).size.height - 400,
              child: Image.asset("assets/image_15.png"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 210,
              //bottom: MediaQuery.of(context).size.height - 400,
              child: Image.asset("assets/image_15.png"),
            ),
          ],
        ),
      ),
    );
  }
}
