

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/screens/bottom_navbar.dart';


class ConfirmationScreen extends StatelessWidget {
 
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      // appBar:  AppBar(
      //   title: Text('Payment',
      //       style: GoogleFonts.quicksand(
      //           fontSize: 25, fontWeight: FontWeight.w800)),
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       size: 20,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   centerTitle: true,
      // ),

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(clipBehavior: Clip.none, child: Image.asset("assets/Images/orderImg.gif",fit: BoxFit.fill,)),

            SizedBox(height: 20,),

            ElevatedButton(
                    onPressed: () {
                       Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) {
                        return AnimatedNavbar(basketCount:0,favCount:0);
                      },
                    ),
                    (route) => false,
                  );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.green[500],//const Color(0xFFFFE082),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child:  Text(
                      'DONE',
                    style: GoogleFonts.quicksand(fontSize:18,fontWeight:FontWeight.w900 ,color:  Colors.black),),
                  ),
          ],
        ),
      )
    );
  }
}
