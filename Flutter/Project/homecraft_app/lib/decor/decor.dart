import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/commanScreen.dart/commanScreen.dart';
import 'package:homecraft_app/livingroom/living_room.dart';

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
      home: Decor(),
    );
  }
}

class Decor extends StatefulWidget {
  const Decor({super.key});

  @override
  State<Decor> createState() => _DecorState();
}

class _DecorState extends State<Decor> {
  List<String> items = [
    "assets/Decor/Sofas/sofaimg.jpg",
  ];

  // CustomNavbar b1=CustomNavbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Decor",
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
                    return Commanscreen(list:objlist.homeAccessorieslist,title: "Home Accessories",);
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Home Accessories",
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
                //     //return const SofaScreen();
                //     return Commanscreen(list:objlist.mattresseslist);
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Home Fragrance",
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
                 onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.wallAccentslist,title: "Wall Accents");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Wall Accents",
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
                    return Commanscreen(list:objlist.sofasList+objlist.cushionslist+objlist.curtainslist,title: "Furnishing",);
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Furnishing",
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
                    return Commanscreen(list:objlist.homeAccessorieslist,title: "Home Accessories",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Decor/HomeAccessories/decor3.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Home Accessories",
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
                    return Commanscreen(list:objlist.lampslist,title: "Lighting",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Decor/Lamps/lamp3.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Lighting",
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
                             onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.wallAccentslist,title: "Wall Accents");
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Decor/WallAccents/wall2.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Wall Accents",
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
                //             onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     //return const SofaScreen();
                //     return Commanscreen(list:objlist.wardrobeslist,title: "",);
                //   }));
                // },
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
                            "Garden",
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
                            "Table Accents",
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
                     
                      const SizedBox(
                        width: 15,
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

             
              
            ],
          ),

        ),
      
      ),
    );
  }
}
