import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/all_list.dart';
import 'package:travel_app/view/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<int> _savedItems = {};

  AllList destList = AllList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(125, 132, 141, 0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 44,
                    width: 130,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 37,
                            width: 37,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 234, 223, 1)),
                          ),
                          const Spacer(),
                          Text(
                            "Leonardo",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(27, 30, 40, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 44,
                    width: 44,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                    child: const Icon(
                      Icons.notifications_outlined,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Explore the\n",
                    style: GoogleFonts.poppins(
                        fontSize: 38,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(46, 50, 62, 1))),
                TextSpan(
                    text: "Beautiful ",
                    style: GoogleFonts.poppins(
                        fontSize: 38,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(27, 30, 40, 1))),
                TextSpan(
                    text: "World!",
                    style: GoogleFonts.poppins(
                        fontSize: 38,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 112, 41, 1))),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  Text("Best Destination",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(27, 30, 40, 1))),
                  const Spacer(),
                  Text("View all",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(13, 110, 253, 1))),
                ],
              ),
            ),
            SizedBox(
              height: 430,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: destList.homeList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return PlaceDetailsScreen(homeIndex:index);
                        }));
                      },
                      child: Container(
                        width: 268,
                        height: 384,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(180, 188, 201, 0.12))
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 240,
                                    height: 286,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      destList.homeList[index]["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
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
                                        setState(() {
                                          if (_savedItems.contains(index)) {
                                            _savedItems.remove(index);
                                          } else {
                                            _savedItems.add(index);
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.bookmark_outline,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15, left: 15, right: 15),
                              child: Row(
                                children: [
                                  Text(
                                    destList.homeList[index]["desName"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            27, 30, 40, 1)),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(255, 211, 54, 1),
                                        size: 15,
                                      ),
                                      Text(
                                        "4.7",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                27, 30, 40, 1)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  Text(
                                    destList.homeList[index]['location'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            125, 132, 141, 1)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
