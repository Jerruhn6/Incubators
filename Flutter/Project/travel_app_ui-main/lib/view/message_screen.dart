import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Padding(
            padding: const EdgeInsets.only( right: 10, top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left:150
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Messages",
                        style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.0503,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(27, 30, 40, 1)),
                      ),
                      const Spacer(),
                      IconButton(
                          constraints: const BoxConstraints(
                            minHeight: 45,
                            minWidth: 45,
                          ),
                          alignment: Alignment.center,
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.more_vert_outlined,
                            size: 20,
                            color:  Color.fromRGBO(27, 30, 40, 1)
                          ),
                        ),
                    ],
                  ),
                ),
                   
                   SizedBox(
                    height: screenHeight*0.0379,
                   ),

                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 10),
                   child: Column(
                     children: [
                       Row(
                        
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Messages",
                              style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.05645,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(27, 30, 40, 1)),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              "assets/SVG/note.svg"
                            )
                          ],
                        ),

                        SizedBox(
                          height: screenHeight*0.02525,
                        ),

                        TextField(
                  decoration: InputDecoration(
                   hintText: "Search for chats & messages",
                   hintStyle: GoogleFonts.poppins(
                    fontSize: screenWidth*0.0452,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(125, 132, 141, 1)
                   ),
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                   ),
                   prefixIcon: IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromRGBO(125, 132, 141, 1)
                    ),
                   ),
                   fillColor:Colors.white
                  ),
                 )


                     ],
                   ),
                 ),

                 
              ],
            ),
          );
        },
      ),
    );
  }
}
