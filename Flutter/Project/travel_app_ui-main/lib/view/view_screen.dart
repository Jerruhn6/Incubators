import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          return Stack(
        children: [
         SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Image.asset(
              "assets/Images/image.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: screenHeight*0.0833,
            left: screenWidth*0.0846,
            child: IconButton(
                            constraints: const BoxConstraints(
                              minHeight: 45,
                              minWidth: 45,
                            ),
                            alignment: Alignment.center,
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(27, 30, 40, 0.3),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
          ),

          Positioned(
             top: screenHeight*0.0933,
            left: screenWidth*0.4657,
            child: Text(
              "View",
              style: GoogleFonts.poppins(
                fontSize: screenWidth*0.0508,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
          ),

          Positioned(
            top: screenHeight*0.1717,
            left: screenWidth*0.431,
            child: Container(
              height: screenHeight*0.0984,
              width: screenWidth*0.519,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 62, 62,0.8),
                // boxShadow:const [
                //    BoxShadow(
                //     blurRadius: 100
                //   )
                // ],
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: screenWidth*0.177,
                    height: screenWidth*0.177,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                     
                  
                    ),
                    child: Image.asset(
                      "assets/Images/home_image3.png",
                      fit: BoxFit.cover,

                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "La-Hotel",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth*0.0452,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),

                      Text(
                        "2.09 mi",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth*0.0395,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight*0.2689,
            left: screenWidth*0.8425,
            child: Container(
              width: 2,
              height: screenHeight*0.0631,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(62, 62, 62, 1)
              ),
            ),
          ),

           Positioned(
            top: screenHeight*0.3295,
            left: screenWidth*0.8125,
            child: Container(
              width: screenWidth*0.0677,
              height: screenWidth*0.0677,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(62, 62, 62, 1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 200,
                  )
                ]
              ),
              child: Container(
                width: screenWidth*0.0388,
                height:screenWidth*0.0388,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(13, 110, 253, 1),
                  shape: BoxShape.circle
                ),
              ),
            ),
          ),


           Positioned(
            top: screenHeight*0.471,
            left: screenWidth*0.065,
            child: Container(
              height: screenHeight*0.0984,
              width: screenWidth*0.619,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 62, 62,0.8),
                boxShadow: const[
                   BoxShadow(
                    blurRadius: 200
                  )
                ],
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: screenWidth*0.177,
                    height: screenWidth*0.177,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                     
                  
                    ),
                    child: Image.asset(
                      "assets/Images/home_image3.png",
                      fit: BoxFit.cover,

                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lemon Garden",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth*0.0452,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),

                      Text(
                        "2.09 mi",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth*0.0395,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight*0.5681,
            left: screenWidth*0.15,
            child: Container(
              width: 2,
              height: screenHeight*0.0631,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(62, 62, 62, 1)
              ),
            ),
          ),

           Positioned(
            top: screenHeight*0.629,
            left: screenWidth*0.119,
            child: Container(
              width: screenWidth*0.0677,
              height: screenWidth*0.0677,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(62, 62, 62, 1),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 200,
                  )
                ]
              ),
              child: Container(
                width: screenWidth*0.0388,
                height:screenWidth*0.0388,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(13, 110, 253, 1),
                  shape: BoxShape.circle
                ),
              ),
            ),
          ),


          Positioned(
            top: screenHeight*0.7171,
            left: screenWidth*0.0564,
            right: screenWidth*0.0564,
            bottom: screenWidth*0.0964,
            child: Container(
              height: screenHeight*0.2575,
              width: screenWidth*0.946,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 62, 62,0.7),
                borderRadius: BorderRadius.circular(20)

              ),
              child: Padding(
                padding:  EdgeInsets.only(
                  top: screenHeight*0.02525,
                  left: screenWidth*0.0423,
                  right: screenWidth*0.0423,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Niladri Reservoir",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth*0.0508,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                        ),
                        const Spacer(),
                
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: const Color.fromRGBO(255, 211, 54, 1),
                              size: screenWidth*0.0342,
                            ),
                
                            Text(
                              "4.7",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth*0.0423,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                   SizedBox(
                      height: screenHeight*0.0112
                    ),

                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: screenWidth*0.0338,
                              color: Colors.white,
                            ),

                            Text(
                              "Tekergat, Sunamgnj",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth*0.0367,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              size: screenWidth*0.0338,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 3,),

                            Text(
                              "45 Minutes",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth*0.0367,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: screenHeight*0.0222
                    ),

                    Container(
                      width: screenWidth*0.8327,
                      height: screenHeight*0.0707,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(13, 110, 253, 1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Text(
                        "See On The Map",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth*0.0451,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          )
        ],
      );
        },
      )
    );
  }
}