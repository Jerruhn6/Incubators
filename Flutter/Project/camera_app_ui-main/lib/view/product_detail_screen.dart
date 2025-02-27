import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF393B42),
              Color(0xFF232529),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    width: 35.75,
                    height: 33,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.95,
                          color: const Color.fromRGBO(55, 73, 87, 0.2),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(54, 57, 65, 1),
                            Color.fromRGBO(62, 66, 75, 0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 35.17),
                        blurRadius: 105.5,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 20),
                        blurRadius: 35,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Image.asset("assets/Images/camera4.png"),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF1D1F23),
                        Color(0xFF484C57),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SONY 200mm Zoom",
                          style: GoogleFonts.dmSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "6000",
                              style: GoogleFonts.dmSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromRGBO(97, 102, 113, 1),
                                          Color.fromRGBO(74, 78, 85, 0),
                                        ]),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: const Offset(0, 10),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "01",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 19.2,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 32,
                                  width: 32,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(97, 102, 113, 1),
                                          Color.fromRGBO(74, 78, 85, 0),
                                        ]),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: const Offset(0, 10),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                size: 26,
                                color: Color.fromRGBO(255, 197, 103, 1)),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "4.5",
                              style: GoogleFonts.dmSans(
                                  fontSize: 19.69,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "(500 reviews)",
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromRGBO(103, 105, 113, 1)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 16,
                          ),
                          child: Text.rich(TextSpan(
                              style: GoogleFonts.dmSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.8)),
                              children: const [
                                TextSpan(
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisis tellus, est lacus arcu ut ac in fermentum. Sit eget proin nunc felis quam rutrum metus. Et lacus, maecenas vel et arcu ut adipiscing morbi eget. At arcu varius ullamcorper eu varius. Et lacus, maecenas vel et arcu ut adipiscing morbi eget. ",
                                )
                              ])),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Row(children: [
                            Container(
                              height: 61,
                              width: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                 gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(57, 59, 64, 1),
                                      Color.fromRGBO(33, 35, 39, 0),
                                    ]),
                                borderRadius: BorderRadius.circular(18),
                                
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 41),
                                      spreadRadius: 0,
                                      blurRadius: 41,
                                      color: Color.fromRGBO(0, 0, 0, 0.4))
                                ],
                              ),
                              child: Icon(
                                Icons.bookmark_outline_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),

                            Spacer(),
                            
                            Stack(
  children: [
    // Gradient Border Container
    Container(
      width: 240,
      height: 61,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(250, 250, 250, 0.2),
            Color.fromRGBO(0, 0, 0, 0.25), 
          ],
        ),
      ),
    ),
    // Inner Content Container
    Positioned.fill(
      child: Container(
        margin: EdgeInsets.all(2), // Border Thickness
        decoration: BoxDecoration(
           // Inner background color
          borderRadius: BorderRadius.circular(16),

            gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(57, 59, 64, 1),
                                      Color.fromRGBO(33, 35, 39, 0),
                                    ]),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 30),
              spreadRadius: 0,
              blurRadius: 41,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Add to bag",
            style: GoogleFonts.dmSans(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  ],
)

                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
