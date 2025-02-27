import 'package:expense_manager_app/menu_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "About us",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
        ),

        leading: 
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu_outlined),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }
            ),
          
        
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      drawer: const MenuBarPage(),
    );
  }
}