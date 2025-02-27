import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, dynamic>> profileList = [
    {
      "image": "assets/SVG/bookmark.svg",
      "title": "Bookmarked",
    },
    {
      "image": "assets/SVG/plane.svg",
      "title": "Previous Trips",
    },
    {
      "image": "assets/SVG/settings.svg",
      "title": "Settings",
    },
    {
      "image": "assets/SVG/version.svg",
      "title": "Version",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(125, 132, 141, 0),
      appBar: AppBar(
        title: LayoutBuilder(
          builder: (context, constraints) {
            return Text(
              "Profile",
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width * 0.0508,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/SVG/Edit.svg"),
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(125, 132, 141, 0),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: screenHeight*0.0405,
                ),
                Container(
                  width: screenWidth * 0.2709,
                  height: screenWidth * 0.2709,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 234, 223, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Leonardo",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.0677,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(27, 30, 40, 1),
                  ),
                ),
                Text(
                  "leonardo@gmail.com",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.0395,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(125, 132, 141, 1),
                  ),
                ),
                SizedBox(height: screenHeight * 0.0352),
                Container(
                  height: screenHeight * 0.09848,
                  width: screenWidth * 0.9455,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 6),
                        blurRadius: 16,
                        spreadRadius: 0,
                        color: Color.fromRGBO(189, 198, 211, 0.12),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Reward Points",
                            style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.0366,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1)),
                          ),
                          Text(
                            "360",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.0451,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(13, 110, 253, 1),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: screenHeight * 0.2201,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color.fromRGBO(247, 247, 249, 1),
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Travel Trips",
                            style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.0366,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1)),
                          ),
                          Text(
                            "238",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.0451,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(13, 110, 253, 1),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: screenHeight * 0.2201,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color.fromRGBO(247, 247, 249, 1),
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bucket List",
                            style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.0366,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1)),
                          ),
                          Text(
                            "473",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.0451,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(13, 110, 253, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.0631,
                ),
                Container(
                    height: screenHeight * 0.4535,
                    width: screenWidth * 0.9455,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 6),
                              spreadRadius: 0,
                              blurRadius: 16,
                              color: const Color.fromRGBO(189, 198, 211, 0.12))
                        ],
                        color: const Color.fromRGBO(255, 255, 255, 1)
                        ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: profileList.length,
                      itemBuilder: (context, index) { 
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 13,
                                right: 13,
                                top: 28
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    profileList[index]["image"],
                                  ),
            
                                   SizedBox(
                                    width: screenWidth*0.0382,
            
                                  ),
            
                                  Text(
                                     profileList[index]["title"],
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.0451,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios_outlined,
                                      size: screenWidth * 0.0324,
                                      color: const Color.fromRGBO(125, 132, 141, 1))
                                ],
                              ),
                            ),
                            SizedBox(
                  height: screenHeight * 0.0231,
                ),
                            Container(
                              width: screenWidth,
                              height: 1,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(247, 247, 249, 1)),
                            ),
                          ],
                        );
                      },
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
