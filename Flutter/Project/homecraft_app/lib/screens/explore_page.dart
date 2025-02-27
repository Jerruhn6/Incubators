import 'dart:async';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/bed_room/bed_room.dart';
import 'package:homecraft_app/commanScreen.dart/allLists.dart';
import 'package:homecraft_app/commanScreen.dart/commanScreen.dart';
import 'package:homecraft_app/decor/decor.dart';
import 'package:homecraft_app/favourite/favouriteScreen.dart';
import 'package:homecraft_app/furnishing/furnishingScreen.dart';
import 'package:homecraft_app/kitchen/kitchenScreen.dart';
import 'package:homecraft_app/livingroom/living_room.dart';

import 'package:homecraft_app/notification/notification_screen.dart';

import 'package:homecraft_app/screens/gridmodel.dart';

Alllists alllistsExp = Alllists();

class ExploreScreen extends StatelessWidget {
  final NotchBottomBarController? controller;

  ExploreScreen({super.key, this.controller});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplorePage(),
    );
  }
}

class ExplorePage extends StatefulWidget {
  ExplorePage({super.key});

    

  @override
  State createState() => _ExplorePageState();
}

class _ExplorePageState extends State {


  List<String> newArrivalsTitleList = [
    "Home Decor",
    "Tableware",
    "Curtains",
    "Sofas",
    "Bedding",
    "Dining Sets",
    
  ]; //add titles in list


  List<List<Map<String, dynamic>>> newArrival = [
    alllistsExp.homeAccessorieslist +
        alllistsExp.lampslist +
        alllistsExp.wallAccentslist,
    alllistsExp.diningTableslist,
    alllistsExp.curtainslist,
    alllistsExp.sofasList + alllistsExp.occasionalChairList,
    alllistsExp.bedslist + alllistsExp.wardrobeslist + alllistsExp.drawerslist,
    alllistsExp.diningtableSetslist
  ];

  List pageImages = [
    "assets/Images/img1.jpg",
    "assets/Images/img2.jpg",
    "assets/Images/img3.jpg",
    "assets/Images/img4.jpg",
    "assets/Images/img5.jpg",
  ];

  List<GridModel> gridCard = [
    GridModel(
      title: "Home Decor",
      image: "assets/Images/grid1.jpg",
    ),
    GridModel(
      title: "Tableware",
      image: "assets/Images/grid2.jpg",
    ),
    GridModel(
      title: "Curtains",
      image: "assets/Images/grid3.jpg",
    ),
    GridModel(
      title: "Sofas",
      image: "assets/Images/grid4.jpg",
    ),
    GridModel(
      title: "Beds & Wardrobes",
      image: "assets/Images/grid5.jpg",
    ),
    GridModel(
      title: "Dining Sets",
      image: "assets/Images/grid6.jpg",
    ),
  ];
//--------------------------cult fav list--------------------------------//
  List<GridModel> cultFav = [
    GridModel(
      title: "Bedding from ₹349",
      image: "assets/Images/Bedding2.jpg",
    ),
    GridModel(
      title: "Cushions from ₹149",
      image: "assets/Furnishing/Cushions/cush4.jpg",
    ),
    GridModel(
      title: "Tableware from ₹99",
      image: "assets/Images/tableware2.jpg",
    ),
    GridModel(
      title: "Kitchen Storage from ₹129",
      image: "assets/Images/kitchenStorage.jpg",
    ),
    GridModel(
      title: "Home Decor from ₹149",
      image: "assets/Decor/Lamps/lamp4.jpg",
    ),
    GridModel(
      title: "Bath & Laundry",
      image: "assets/Images/bath.jpg",
    ),
  ];

  //CustomNavbar b1=CustomNavbar();

  bool viewChange = false;

  late PageController pageController = PageController();

  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        //backgroundColor:Color(0xFFFFE082),
        title: Row(
          children: [
            Text(
              "Homecraft",
              style: GoogleFonts.alegreya(
                fontSize: 33,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  "assets/Images/logo2.png",
                  fit: BoxFit.fill,
                )),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const MyFavourite();
              }));
            },
            // style:const ButtonStyle(
            //   backgroundColor: WidgetStatePropertyAll(Colors.black)
            // ),
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
            color: Colors.black,
          ),
          //SizedBox(width: 5),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const NotificationScreen();
              }));
            },
            //  style:const ButtonStyle(
            //   backgroundColor: WidgetStatePropertyAll(Colors.transparent)
            // ),
            icon:const Icon(
              Icons.notifications_none,
              size: 30,
            ),
            color: Colors.black,
          ),
         // SizedBox(width: 5),
         Padding(
            padding: EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
          )
        ],
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LivingRoom(),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/Images/living_room.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Living Room",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const BedRoom(),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/Images/bed_room.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Bed Room",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/Images/dinning_room.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Dining Room",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Decor(),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/Images/decor.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Decor",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const FurnishingScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/Images/furnishing.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Furnishings",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Kitchenscreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/Images/kitchen_room.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Kitchen",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/Images/tableware.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Tableware",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/Images/bath_room.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Bath",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 10,
              thickness: 5,
              color: Colors.grey[300],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageNo = index;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      onPanDown: (d) {
                        carasouelTmer?.cancel();
                        carasouelTmer = null;
                      },
                      onPanCancel: () {
                        carasouelTmer = getTimer();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          left: 8,
                          top: 8,
                          bottom: 8,
                        ),
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            pageImages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? const Color(0xFFFFE082)
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Align(
              alignment: Alignment.center,
              child: Text("New Arrivals",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: gridCard.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: viewChange ? 1 : 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 2,
                    mainAxisExtent: 180,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(16),
                              child: GestureDetector(
                                onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return SofaScreen();
                              return Commanscreen(
                                list: newArrival[index],
                                title: newArrivalsTitleList[index],
                              );
                            }));
                          },
                                child: Image.asset(
                                  gridCard[index].image,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              gridCard[index].title,
                              style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10), // Optional: Add rounded corners
                  child: Stack(
                    children: [
                      // Background image
                      Image.asset(
                        "assets/Images/living_room2.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      // Text overlay at the top
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Living Room",
                              style: GoogleFonts.quicksand(
                                color: Colors.white, // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(
                                        0.7), // Add a shadow effect
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 5), // Space between the texts
                            Text(
                              "New stories unfold & laughter lingers",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.sofasList,
                                          title: "Sofas",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "SOFAS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.entertainmentList,
                                          title: "TV Units",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "TV UNITS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "TABLES",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.shoeRackList,
                                          title: "Shoe Racks",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "SHOE RACKS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/Images/exp_table.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Table Decor",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/Images/exp_wall.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Wall Decor",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/Images/exp_lamp.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Lamps",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
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
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Cult Favourites",
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            //-----------------------------------------------------------------------------------------------------------//
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cultFav.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: viewChange ? 1 : 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 2,
                    mainAxisExtent: 180,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                cultFav[index].image,
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              cultFav[index].title,
                              style: GoogleFonts.quicksand(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Divider(
              height: 10,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/Images/dining_room2.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      Positioned(
                        top: 10,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dining Room",
                              style: GoogleFonts.quicksand(
                                color: Colors.white, // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(
                                        0.7), // Add a shadow effect
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 5), // Space between the texts
                            Text(
                              "Crafted for every mood,",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "perfect for every hosting",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Buttons at the bottom center
                      Positioned(
                        bottom: 10, // Position near the bottom
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.diningtableSetslist,
                                          title: "Dining Sets",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "DINING SETS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.diningTableslist,
                                          title: "Dining Tables",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "DINING TAB...",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.diningChairslist,
                                          title: "Dining Chairs",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "DINING CHA...",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.barlist,
                                          title: "Bars",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "BARS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return SofaScreen();
                              return Commanscreen(
                                list: objlist.cookWarelist,
                                title: "Cookware",
                              );
                            }));
                          },
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/Images/cookware.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Cookware",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/Images/serving_trolley.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Serveware",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/Images/storageandcontainer.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Storage & Containers",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
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
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10), // Optional: Add rounded corners
                  child: Stack(
                    children: [
                      // Background image
                      Image.asset(
                        "assets/Images/bed_room2.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),

                      // Text overlay at the top
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BedRoom",
                              style: GoogleFonts.quicksand(
                                color: Colors.white, // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(
                                        0.7), // Add a shadow effect
                                  ),
                                ],
                              ),
                            ),
                            // Space between the texts
                            Text(
                              "Crafted for comfort,designed",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "for sweet dreams",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Buttons at the bottom center
                      Positioned(
                        bottom: 10, // Position near the bottom
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.bedslist,
                                          title: "Beds",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "BEDS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.wardrobeslist,
                                          title: "Wardrobes",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "WARDROBES",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.drawerslist,
                                          title: "Drawers",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "DRAWERS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120, // Set fixed width for each button
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        //return SofaScreen();
                                        return Commanscreen(
                                          list: objlist.mattresseslist,
                                          title: "Mattressers",
                                        );
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFE082),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                    ),
                                    child: Text(
                                      "MATTRESSERS",
                                      style: GoogleFonts.quicksand(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return SofaScreen();
                              return Commanscreen(
                                list: objlist.bedslist +
                                    objlist.cushionslist +
                                    objlist.wardrobeslist,
                                title: "Bedding",
                              );
                            }));
                          },
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/Images/bedding.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Bedding",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return SofaScreen();
                              return Commanscreen(
                                list: objlist.curtainslist,
                                title: "Curtains",
                              );
                            }));
                          },
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: ClipRRect(
                              child: Image.asset(
                                "assets/Images/curtains1.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Curtains",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/Images/towel.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Towels",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        )
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
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Social Media Presence',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.facebook_outlined,
                        size: 65,
                        color: Colors.blue[900],
                      ),
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                              "assets/Images/socialmedia/insta_logo.jpg")),
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                              "assets/Images/socialmedia/tw_logo.jpg")),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.store_mall_directory_outlined,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Find our stores",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
