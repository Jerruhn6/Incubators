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
      //home: Decor(),
    );
  }
}

class Kitchenscreen extends StatefulWidget {
  const Kitchenscreen({super.key});

  @override
  State<Kitchenscreen> createState() => _DecorState();
}

class _DecorState extends State<Kitchenscreen> {
  List<String> items = [
    "assets/Decor/Sofas/sofaimg.jpg",
  ];

  // CustomNavbar b1=CustomNavbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kitchen",
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
                    return Commanscreen(list:objlist.cookWarelist,title: "Cooking",);
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Cooking",
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
                //     return Commanscreen(list:objlist.curtainslist);
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Kichenware",
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
                //  onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     //return const SofaScreen();
                //     return Commanscreen(list:objlist.cushionslist);
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Storage & Containers",
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
                //  onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     //return const SofaScreen();
                //     return Commanscreen(list:objlist.sofasList+objlist.cushionslist+objlist.curtainslist);
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Serveware",
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
                    return Commanscreen(list:objlist.kitchenLinenslist,title: "Kitchen Linens",);
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Kitchen Linens",
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
                //             onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     //return const SofaScreen();
                //     return Commanscreen(list:objlist.homeAccessorieslist);
                //   }));
                // },
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
                            "Storage & Container",
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
                    return Commanscreen(list:objlist.cookWarelist,title:"Cooking" ,);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Kitchen/CookWare/cook4.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cooking",
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
                    return Commanscreen(list:objlist.kitchenLinenslist+objlist.cookWarelist,title:"Kitchenware" ,);
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
                            "Kitchenware",
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
                //     return Commanscreen(list:objlist.wardrobeslist);
                //   }));
                // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Furnishing/Cushions/cush1.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Bakeware",
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
                //     return Commanscreen(list:objlist.homeAccessorieslist+objlist.lampslist+objlist.kitchenLinenslist);
                //   }));
                // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Decor/Lamps/lamp6.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Outdoor",
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
