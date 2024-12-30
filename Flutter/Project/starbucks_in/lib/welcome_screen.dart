import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/custom_scaffold.dart';
import 'package:starbucks_in/signin_screen.dart';
import 'package:starbucks_in/signup_screen.dart';
import 'package:starbucks_in/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome!\n',
                        style: GoogleFonts.raleway(
                          color: Colors.orange[300],
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'Craft Your Dream Home with Ease!\n',
                        style: GoogleFonts.alegreya(
                          color: const Color.fromARGB(162, 255, 255, 255),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              )),

          //SizedBox(height: 300,),
           Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Admin',
                      onTap: SignInScreen(isUser: false,),
                      color: Colors.transparent,
                      textColor:const Color(0xFFFFA726),
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'User',
                      onTap: SignInScreen(isUser: true,),
                      color: Color.fromARGB(49, 255, 255, 255),
                      textColor:  const Color(0xFFFFA726),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
