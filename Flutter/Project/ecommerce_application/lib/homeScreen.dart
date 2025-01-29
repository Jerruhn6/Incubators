// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int selectedIndex = -1; // To track the selected category index
//   List<String> categoryList = [
//     "All",
//     "Men",
//     "Women",
//     "Kids",
//     "Other"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(
//           Icons.grid_view_outlined,
//           size: 30,
//         ),
//         actions: const [
//           Icon(
//             Icons.perm_identity_outlined,
//             size: 30,
//           ),
//           SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Explore",
//                     style: GoogleFonts.imprima(
//                       fontSize: 36,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     "Best trendy collection!",
//                     style: GoogleFonts.imprima(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 25,),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(
//                   categoryList.length,
//                   (index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 15.0),
//                       child: Container(
//                         height: 45,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           // border: Border.all(
//                           //   color: Colors.black,
//                           //   width: 2,
//                           // ),
//                           color: selectedIndex == index
//                               ? Color.fromRGBO( 255, 122, 0,1)
//                               : Colors.white,
//                         ),
//                         child: TextButton(
//                           onPressed: () {
//                             setState(() {
//                               // Toggle the selected state
//                               selectedIndex =
//                                   selectedIndex == index ? -1 : index;
//                             });
//                           },
//                           child: Text(
//                             categoryList[index],
//                             style: GoogleFonts.imprima(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: selectedIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//-------------------chatgpt-----------------
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1; // To track the selected category index
  List<String> categoryList = [
    "All",
    "Men",
    "Women",
    "Kids",
    "Other"
  ];

  List<Map<String, String>> productList = [
    {"name": "Tagerine Shirt", "price": "240.32", "image": "assets/tshirt1.png"},
    {"name": "Leather Coat", "price": "325.36", "image": "assets/coat1.png"},
    {"name": "Tagerine Shirt", "price": "126.47", "image": "assets/tshirt2.png"},
    {"name": "Leather Coat", "price": "257.85", "image": "assets/coat2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.grid_view_outlined,
          size: 30,
        ),
        actions: const [
          Icon(
            Icons.perm_identity_outlined,
            size: 30,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: GoogleFonts.imprima(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Best trendy collection!",
                    style: GoogleFonts.imprima(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categoryList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedIndex == index
                              ? const Color.fromRGBO(255, 122, 0, 1)
                              : Colors.white,
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex =
                                  selectedIndex == index ? -1 : index;
                            });
                          },
                          child: Text(
                            categoryList[index],
                            style: GoogleFonts.imprima(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              productList[index]['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${productList[index]['price']}",
                                style: GoogleFonts.imprima(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                productList[index]['name']!,
                                style: GoogleFonts.imprima(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.black54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black54,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
              color: Colors.black54,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              size: 30,
              color: Colors.black54,
            ),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
