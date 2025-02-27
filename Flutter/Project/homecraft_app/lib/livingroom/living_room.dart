import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/commanScreen.dart/allLists.dart';
import 'package:homecraft_app/commanScreen.dart/commanScreen.dart';

// import 'package:homecraft_app/screens/navbar.dart';
// import 'package:homecraft_app/screens/navbar2.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:home_center/occational.dart';
// import 'package:home_center/recliners.dart';
// import 'package:home_center/sofas.dart';
// import 'package:home_center/tables.dart';
// import 'package:home_center/tv.dart';
// import 'package:home_center/wall_shelves.dart';
Alllists objlist =Alllists();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LivingRoom(),
    );
  }
}

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  List<String> items = [
    "assets/LivingRoom/Sofas/sofaimg.jpg",
  ];

  // CustomNavbar b1=CustomNavbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Living Room Furniture",
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
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.sofasList,title: "Sofas",);
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Sofas",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        //color:Colors.black,
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
                    return Commanscreen(list:objlist.sofasList, title: "Recliners");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Recliners",
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
                    return Commanscreen(list:objlist.occasionalChairList,title: "Occasional Chairs");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Occasional Chairs",
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
                    return Commanscreen(list:objlist.entertainmentList,title: "Entertainment Units");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Entertainment Units",
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
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       //return const SofaScreen();
              //       return Commanscreen(list:objlist.List);
              //     }));
              //   },
                child: Row(
                  children: [
                    Text(
                      "Tables",
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
                    return Commanscreen(list:objlist.shoeRackList, title: "Shoe Rack");
                  }));
                },
                child: Row(
                  children: [
                    Text(
                      "Shoe Rack",
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
                //     return const WallShelves();
                //   }));
                // },
                child: Row(
                  children: [
                    Text(
                      "Wall Shelves",
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
                    return Commanscreen(list:objlist.sofasList,title: "Sofas");
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/Sofas.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Sofas",
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
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.sofasList,title: "Recliners",);
                  }));
                },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/recliners.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Recliners",
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
                            //     return const Recliners();
                            //   }));
                            // },
                            child: Container(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/Images/customized furniture.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Custmized furiture",
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
                                "assets/Images/Wall shelves.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Wall Shelves",
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
                                "assets/Images/Tables.jpg",
                                // height: 100, // Ensure image fits properly
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Tables",
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
                    return Commanscreen(list:objlist.entertainmentList,title: "TV Units");
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.shoeRackList,title: "Shoe Racks",);
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //return const SofaScreen();
                    return Commanscreen(list:objlist.occasionalChairList,title: "Ocassional Chairs",);
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

              Text("Customized Sofas",style: GoogleFonts.quicksand(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ClipRRect(child: Image.asset("assets/Images/living_gif.gif",fit: BoxFit.fill,),),),
              
            ],
          ),

        ),
      
      ),
    );
  }
}
