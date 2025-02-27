import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/all_list.dart';
import 'package:travel_app/view/view_screen.dart';

class PlaceDetailsScreen extends StatefulWidget {
final int homeIndex;
  const PlaceDetailsScreen({super.key,required this.homeIndex});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDeatilsScreenState();
}

class _PlaceDeatilsScreenState extends State<PlaceDetailsScreen> {

  AllList obj=AllList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          return SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                SizedBox(
                  height: screenHeight * 0.56,
                  width: screenWidth,
                  child: Image.asset(
                    obj.homeList[widget.homeIndex]['image'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  top: 55,
                  child: Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
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
                        Text(
                          "Details",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        IconButton(
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                    initialChildSize: 0.55,
                    minChildSize: 0.35,
                    maxChildSize: 0.9,
                    builder: (context, scrollController) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.antiAlias,
                        height: screenHeight * 0.779,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(180, 40),
                            topRight: Radius.elliptical(180, 40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 6,
                                width: screenWidth * 0.1016,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(125, 132, 141, 1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${obj.homeList[widget.homeIndex]['desName']}\n",
                                            style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.0677,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  27, 30, 40, 1),
                                            ),
                                          ),
                                          TextSpan(
                                            text:obj.homeList[widget.homeIndex]['location'],
                                            style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.0423,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  125, 132, 141, 1),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: screenWidth * 0.135,
                                      width: screenWidth * 0.135,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/Images/avatar1.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: screenWidth * 0.0338,
                                        color: const Color.fromRGBO(
                                            125, 132, 141, 1),
                                      ),
                                      Text(
                                        "Tekergot",
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.0423,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              125, 132, 141, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: screenWidth * 0.0342,
                                        color: const Color.fromRGBO(
                                            255, 211, 54, 1),
                                      ),
                                      Text(
                                        "4.7",
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.0424,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              27, 30, 40, 1),
                                        ),
                                      ),
                                      Text(
                                        "(2498)",
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.0424,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              125, 132, 141, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "59/",
                                          style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.0424,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                13, 110, 253, 1),
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Person",
                                          style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.0424,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                125, 132, 141, 1),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.02525,
                              ),
                              SizedBox(
                                  height: screenWidth * 0.1185,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                     
                                    ),
                                    child: ListView.separated(
                                         separatorBuilder: (context, index) =>
                                                            SizedBox(width: screenWidth * 0.0651),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        if (index < 4) {
                                          return Container(
                                            width: screenWidth * 0.1185,
                                            height: screenWidth * 0.1185,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Image.asset(
                                              "assets/Images/home_image3.png",
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: screenWidth * 0.1185,
                                            height: screenWidth * 0.1185,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/Images/home_image3.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "+16",
                                                style: GoogleFonts.poppins(
                                                  fontSize: screenWidth * 0.0595,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  )),
                              SizedBox(
                                height: screenHeight * 0.02525,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18, right: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "About Destination",
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth * 0.0564,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            const Color.fromRGBO(27, 30, 40, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: 15), // Space between two texts
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Have you ever been on holiday to the Greek ETC...",
                                            style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.03669,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  125, 132, 141, 1),
                                            ),
                                          ),
                                          TextSpan(
                                            text: " Read More",
                                            style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.0366,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  255, 112, 41, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.024,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return ViewScreen();
                                    })
                                  );
                                },
                                child: Container(
                                  height: screenHeight * 0.0768,
                                  width: screenWidth * 0.9295,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:
                                          const Color.fromRGBO(13, 110, 253, 1)),
                                  child: Text(
                                    "Book Now",
                                    style: GoogleFonts.poppins(
                                        fontSize: screenWidth * 0.0451,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
