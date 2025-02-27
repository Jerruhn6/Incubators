import 'package:expense_manager_app/explore_page.dart';
import 'package:expense_manager_app/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        
        children: [
          const SizedBox(height: 70),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Image.asset(
                  "assets/Images/app_logo.png",
                  width: 69.76, 
                  height: 58.82,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
      
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Login to your account",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
      
         
          Container(
            height: 49,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),
      
         
          Container(
            height: 49,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              obscureText: true, 
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context){
                  return const ExplorePage();
                })
              );
            },
            child: Container(
              width: 280,
              height: 49,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(14, 161, 125, 1),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(
                "Sign in",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color:Colors.white
                ),
              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(
              top: 250
            ),
           
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return const SignUpScreen();
                      })
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(14, 161, 125, 1),
                    ),
                  ),
                ),
            
              ],
            ),
          )
      
          
          
        ],
      ),
    );
  }
}
