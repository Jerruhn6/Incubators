import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/MyBasket/todo_app_ui.dart';
import 'package:homecraft_app/favourite/favouriteScreen.dart';
import 'package:homecraft_app/screens/bottom_navbar.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/Images/getStarted.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Title Text
          Positioned(
            top: 140,
            left: 20,
            child: Text(
              "HomeCraft",
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          // Subtitle Text
          Positioned(
            top: 220,
            left: 20,
            child: Text(
              "Craft Your Dream Home with Ease!",
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Sign Up Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) {
                        return AnimatedNavbar(basketCount:basketList.length, favCount:wishlist.length);
                      },
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 245, 245),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Text(
                    'Start Shopping',
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
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
