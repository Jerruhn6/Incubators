
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/favourite/favModel.dart';
import 'package:homecraft_app/favourite/favouriteScreen.dart';
import 'package:homecraft_app/MyBasket/todo_app_ui.dart';
import 'package:homecraft_app/profile/profile_screen.dart';
import 'package:homecraft_app/screens/category.dart';
import 'package:homecraft_app/screens/explore_page.dart';

String? basketitemLabel, favitemLabel;
Widget? basketactiveItem, favactiveItem;
Widget? basketinactiveItem, favinactiveItem;

class AnimatedNavbar extends StatefulWidget {
  int basketCount,favCount;
   AnimatedNavbar({super.key,required this.basketCount,required this.favCount});

  @override
  State<AnimatedNavbar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnimatedNavbar> {

  @override
void initState() {
  super.initState();
  setupRealTimeListeners();
  basketCheckItemList(basketCount: basketList.length);
}

void setupRealTimeListeners() {
  // Listener for Favourites
  FirebaseFirestore.instance.collection("favourites").snapshots().listen((snapshot) {
    wishlist.clear();
    for (var doc in snapshot.docs) {
      wishlist.add(
        FavModel(
          productDes: doc['productDes'],
          productPrice: doc['productPrice'],
          productImage: doc['productImage'],
        ),
      );
    }
    setState(() {
      widget.favCount = wishlist.length;
      favCheckItemList(favCount: widget.favCount);
    });
  });

  // Listener for Basket
  FirebaseFirestore.instance.collection("basket").snapshots().listen((snapshot) {
    basketList.clear();
    for (var doc in snapshot.docs) {
      basketList.add(
        FavModel(
          productDes: doc['productDes'],
          productPrice: doc['productPrice'],
          productImage: doc['productImage'],
        ),
      );
    }
    setState(() {
      widget.basketCount = basketList.length;
      basketCheckItemList(basketCount: widget.basketCount);
    });
  });
}


//   @override
//  void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () async {
//       await getDataFromFirebase();
//     });
//   }
  


// QuerySnapshot? response ;
//   Future<void> getDataFromFirebase() async {
// //playersList.clear();
    
//        response= await FirebaseFirestore.instance.collection("favourites").get();
//        wishlist.clear();
//     for (var value in response!.docs) {
//       print("Value:${value['productDes']}");
      
//       wishlist.add(
//         FavModel(
//           productDes: value['productDes'],
//           productPrice: value['productPrice'],
//           productImage: value['productImage'],
//         ),
//       );
//     }
//     // print("LENGTH OF PLAYERS LIST:${wishlist.length}");
    
//     // setState(() {
//     //   widget.favCount=wishlist.length;
//     // });

//       response = await FirebaseFirestore.instance.collection("basket").get();
//     basketList.clear();
//     for (var value in response!.docs) {
//       print("Value:${value['productDes']}");
//       basketList.add(
//         FavModel(
//           productDes: value['productDes'],
//           productPrice: value['productPrice'],
//           productImage: value['productImage'],
//         ),
//       );
//     }
//     print("LENGTH OF PLAYERS LIST:${basketList.length}");
//     setState(() {
//     widget.basketCount=basketList.length;
//      widget.favCount=wishlist.length;
//     });
  

//   }
//basket responce




  
  
  void basketCheckItemList({required basketCount}) {
    if (basketCount > 0) {
      basketinactiveItem = Stack(
        children: [
          const Icon(
            Icons.local_mall_outlined,
            color: Colors.black,
            //size: 30,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 6.8,
              backgroundColor: Colors.red,
              child: Text(
                '$basketCount',
                style: GoogleFonts.quicksand(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
      basketactiveItem = Stack(
        children: [
          const Icon(
            Icons.local_mall_outlined,
            color: Colors.white,
            //size: 30,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 6.8,
              backgroundColor: Colors.red,
              child: Text(
                '$basketCount',
                style: GoogleFonts.quicksand(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      basketinactiveItem = const Icon(
        Icons.local_mall_outlined,
        color: Colors.black,
      );
      basketactiveItem = const Icon(
        Icons.local_mall_outlined,
        color: Colors.white,
      );
    }
    basketitemLabel = 'Basket';
    //  setState(() {

    //   });
  }

  void favCheckItemList({required favCount}) {
    if (favCount > 0) {
      favinactiveItem = Stack(
        children: [
          const Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
            size: 27,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 6.9,
              backgroundColor: Colors.red,
              child: Text(
                '${favCount}',
                style: GoogleFonts.quicksand(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
      favactiveItem = Stack(
        children: [
          const Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
            size: 27,

            //size: 30,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 6.8,
              backgroundColor: Colors.red,
              child: Text(
                '${favCount}',
                style: GoogleFonts.quicksand(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      favinactiveItem = const Icon(
        Icons.favorite_border_outlined,
        color: Colors.black,
        size: 27,
      );
      favactiveItem = const Icon(
        Icons.favorite_border_outlined,
        color: Colors.white,
        size: 27,
      );
    }
    favitemLabel = 'Favourites';
    //setState(() {});
  }

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
    //int basketCount = basketList.length, favCount = wishlist.length;

    basketCheckItemList(basketCount: widget.basketCount);
    favCheckItemList(favCount: widget.favCount);

    /// widget list
    final List<Widget> bottomBarPages = [
      ExploreScreen(
        controller: (_controller),
      ),
      
      CategoryScreen(),
      const MyBag(),
      const MyFavourite(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: const Color(0xFFFFE082),
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0, //Changed
              //textAlign: TextAlign.justify, //Changed

              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Color.fromARGB(255, 15, 15, 15), Color.fromARGB(255, 53, 53, 53), Color.fromARGB(255, 233, 231, 230)],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 20.0)),
              notchColor: Colors.black,
              
              //circleMargin: 1,

//notchShader: Shader.,
              /// restart app if you change removeMargins
              removeMargins: true, //Changed

              bottomBarWidth: 500,
              showShadow: true,
              durationInMilliSeconds: 250,

              itemLabelStyle: GoogleFonts.quicksand(
                  fontSize: 12, fontWeight: FontWeight.w900), //Changed

              elevation: 1,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 27,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 27,
                  ),
                  itemLabel: 'Home',
                ),

                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.manage_search,
                    color: Colors.black,
                    size: 27,
                  ),
                  activeItem: Icon(
                    Icons.manage_search,
                    color: Colors.white,
                    size: 27,
                  ),
                  itemLabel: 'Category',
                ),
//---------------------------------------------------------------------------------------------------//
                BottomBarItem(
                  activeItem: basketactiveItem!,
                  inActiveItem: basketinactiveItem!,
                  itemLabel: basketitemLabel!,
                ),

                BottomBarItem(
                  activeItem: favactiveItem!,
                  inActiveItem: favinactiveItem!,
                  itemLabel: favitemLabel!,
                ),
               
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 27,
                  ),
                  activeItem: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 27,
                  ),
                  itemLabel: 'Account',
                ),
              ],
              onTap: (index) {
              //log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 25.0,
            )
          : null,
    );
  }
}

/// add controller to check weather index through change or not. in page 1





