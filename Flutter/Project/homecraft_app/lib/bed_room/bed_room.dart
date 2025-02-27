import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/commanScreen.dart/commanScreen.dart';
import 'package:homecraft_app/livingroom/living_room.dart';
import 'package:homecraft_app/livingroom/occational.dart';
import 'package:homecraft_app/livingroom/tables.dart';



// import 'package:homecraft_app/screens/navbar.dart';
// import 'package:homecraft_app/screens/navbar2.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:home_center/occational.dart';
// import 'package:home_center/recliners.dart';
// import 'package:home_center/sofas.dart';
// import 'package:home_center/tables.dart';
// import 'package:home_center/tv.dart';
// import 'package:home_center/wall_shelves.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BedRoom(),
    );
  }
}

class BedRoom extends StatefulWidget {
  const BedRoom({super.key});

  @override
  State<BedRoom> createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  List<String> items = [
    "assets/BedRoom/Sofas/sofaimg.jpg",
  ];

  // CustomNavbar b1=CustomNavbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bedroom Furniture",
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new,
                size: 20, color: Colors.black)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey,
      ),
      body: SingleChildScrollView(
      
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 23),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.bedslist,title: "Beds");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Beds",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.mattresseslist,title:"Mattresses");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Mattresses",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                // onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return const Recliners();
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Bed Side Table",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                // onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return const Occational();
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Dressing Tables",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.wardrobeslist,title:"Bedroom Wardrobes");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Bedroom Wardrobes",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.drawerslist,title: "Bedroom Chestofdrawers");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Bedroom Chestofdrawers",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15),
              
              Text(
                "Shop By Categories",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.bedslist,title: "Beds",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/BedRoom/Beds/bed5.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Beds",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      //
                      const SizedBox(
                        width: 15,
                      ),
                //       Column(
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     //return const SofaScreen();
                //     return Commanscreen(list:objlist.sofasList);
                //   }));
                // },
                //             child: Container(
                //               height: 150,
                //               width: 150,
                //               child: Image.asset(
                //                 "assets/Images/recliners.jpg",
                //                 // height: 100, // Ensure image fits properly
                //                 // width: 100,
                //                 fit: BoxFit.fill,
                //               ),
                //             ),
                //           ),
                //           const SizedBox(height: 8),
                //           Text(
                //             "Recliners",
                //             style: GoogleFonts.quicksand(
                //               fontSize: 15,
                //               fontWeight: FontWeight.w400,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ],
                //       ),
                      const SizedBox(
                        width: 15,
                      ),
        
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.mattresseslist,title: "Mattresses",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/BedRoom/Mattresses/mat3.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Mattresses",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
        
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            // onTap: () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return const Tables();
                            //   }));
                            // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/outDoor furniture.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "OutDoor Furniture ",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.wardrobeslist,title:"Wardrobes" ,);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/BedRoom/Wardrobes/ward1.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Wardrobes",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            // onTap: () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return const Recliners();
                            //   }));
                            // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/Bean bags.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Bean Bags",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
        
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                           onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.drawerslist,title: "Chest of Drawers",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/BedRoom/Drawers/draw4.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Chest of Drawers",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.entertainmentList,title: "TV Units ",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/TV uints.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "TV Units ",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            // onTap: () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return const Occational();
                            //   }));
                            // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/Book case.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Book Case And Cabinets",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            // onTap: () {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return const WallShelves();
                            //   }));
                            // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/tea sets.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Tea Sets",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Occational();
                              }));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/Shoe Racks.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Shoe Racks",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Tables();
                              }));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/bench and Stools.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Bench And Stools",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Occational();
                              }));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/occasional chair.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Occasinal Chairs",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          
                        ],
                      ),
                      
                    ],
                    
                  ),
                  
                ),
                
              ),
              Divider(
                height: 20,
                thickness: 5,
                color: Colors.grey[300],
              ),

              // Text("Customized Sofas",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.bold),),
              // SizedBox(height: 10,),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 200,
              //   child: ClipRRect(child: Image.asset("assets/Images/living_gif.gif",fit: BoxFit.fill,),),),
              
            ],
          ),

        ),
      
      ),
    );
  }
}
