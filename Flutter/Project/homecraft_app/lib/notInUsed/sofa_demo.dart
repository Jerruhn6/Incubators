import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/screens/gridmodel.dart';



class SofaScreen extends StatefulWidget {
  const SofaScreen({super.key});

  @override
  State<SofaScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<SofaScreen> {
  // final List<Map<String, dynamic>> products = [
  //   {
  //     'color': Colors.grey.shade300,
  //     '': '₹39,999',
  //     'title': 'Walter Half Leather 3-Seater Sofa - Grey',
  //   },
  //   {
  //     'color': Colors.blue.shade100,
  //     '': '₹92,997',
  //     'title': 'Walter Half Leather 3+2+1 Seater Sofa Set - Grey',
  //   },
  //   {
  //     'color': Colors.green.shade200,
  //     '': '₹29,999',
  //     'title': 'Walter Half Leather 2-Seater Sofa - Grey',
  //   },
  //   {
  //     'color': Colors.brown.shade300,
  //     '': '₹17,999',
  //     'discountPrice': '₹34,018',
  //     'discount': '50% OFF',
  //     'extraOffer': 'EXTRA 10% C...',
  //     'title': 'Helios Emily Fabric 3-Seater Sofa - Brown',
  //   },
  // ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sofas',
          style: GoogleFonts.quicksand(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: GestureDetector(onTap:(){Navigator.of(context).pop();},
        
         child: const Icon(Icons.arrow_back_ios_new_rounded,size: 20, color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '1',
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),

      
              body:  

             
          
              GridView.builder(
                physics:  const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: gridCard.length,
                gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 250,
                        ),
                itemBuilder: (context,index){
                  return Container(
          
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      16.0
                      ),
                     
                   ),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          gridCard[index].image,
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          
                          )
                        ),
                        

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8
                          ),
                          child: Text(
                              gridCard[index].title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                          ),
                        ),

                         Padding(
                          padding: const EdgeInsets.only(
                            left: 8
                          ),
                          child: Text(
                              gridCard[index].title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                          ),
                        ),

                    ],
                   ),
          
                  );
          
                }
                ),

      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Text(
      //         '39 Products',
      //         style: GoogleFonts.quicksand(fontSize: 16, color: Colors.grey),
      //       ),
      //     ),
      //     Expanded(
      //       child: GridView.builder(
      //         padding: const EdgeInsets.symmetric(horizontal: 16),
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           childAspectRatio: 0.7,
      //           crossAxisSpacing: 16,
      //           mainAxisSpacing: 16,
      //         ),
      //         itemCount: products.length,
      //         itemBuilder: (context, index) {
      //           final product = products[index];
      //           return buildUnifiedContainer(product);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       TextButton.icon(
      //         onPressed: () {},
      //         icon: const Icon(Icons.sort, color: Colors.black),
      //         label: Text('SORT',
      //             style: GoogleFonts.quicksand(color: Colors.black)),
      //       ),
      //       TextButton.icon(
      //         onPressed: () {},
      //         icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
      //         label: Text('REFINE',
      //             style: GoogleFonts.quicksand(color: Colors.black)),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
  }

//   