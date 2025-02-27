import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SofaScreen extends StatefulWidget {
  const SofaScreen({super.key});

  @override
  State<SofaScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<SofaScreen> {
  final List<Map<String, dynamic>> favProducts = [];

  final List<Map<String, dynamic>> products = [
    {
      'image': "assets/LivingRoom/Sofas/sofa1.jpg",
      'price': '₹39,999',
      'title': 'Walter Half Leather 3-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa2.jpg",
      'price': '₹92,997',
      'title': 'Walter Half Leather 3+2+1 Seater Sofa Set - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa3.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa4.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa5.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa6.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa7.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa8.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa9.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa10.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa11.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa12.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa13.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa14.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa15.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa1.jpg",
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'image': "assets/LivingRoom/Sofas/sofa1.jpg",
      'price': '₹17,999',
      'discountPrice': '₹34,018',
      'discount': '50% OFF',
      'extraOffer': 'EXTRA 10% C...',
      'title': 'Helios Emily Fabric 3-Seater Sofa - Brown',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sofas',
          style: GoogleFonts.quicksand(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                size: 20, color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.favorite_border, color: Colors.black),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 6.8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${favProducts.length}',
                      style: GoogleFonts.quicksand(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${products.length} Products',
              style: GoogleFonts.quicksand(fontSize: 16, color: Colors.grey),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                // return buildUnifiedContainer(product);
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Colored background
                      Container(
                        clipBehavior: Clip.antiAlias,
                        //height: 150,
                        //width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          // child: product['image'], // Use color from the product data
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Favorite Icon

                            Image.asset(
                              product['image'],
                              fit: BoxFit.fill,
                            ),

                            //product['image'],
                            Positioned(
                              top: 3,
                              right: 2,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: IconButton(
                                  icon:  Icon(
                                    Icons.favorite_border,
                                    color: buttonColor,
                                  ),
                                  onPressed: () {
                                    //add item/product into fav list
                                    favProducts.add(product);
                                      buttonColor=Colors.red;
                                    setState(() {
                                      
                                    });
                                  },
                                ),
                              ),
                            ),
                            // Discount and offer details
                            if (product.containsKey('discount'))
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (product.containsKey('extraOffer'))
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        color: Colors.red,
                                        child: Text(
                                          product['extraOffer']!,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      color: Colors.red.shade300,
                                      child: Text(
                                        product['discount']!,
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      // Price and title
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['price'],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              if (product.containsKey('discountPrice'))
                                Text(
                                  product['discountPrice']!,
                                  style: GoogleFonts.quicksand(
                                    //decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              const SizedBox(height: 2),
                              Expanded(
                                child: Text(
                                  product['title'],
                                  style: GoogleFonts.quicksand(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
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
  // Widget buildUnifiedContainer(Map<String, dynamic> product) {
  //   return Placeholder();
    // return Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.grey),
    //     borderRadius: BorderRadius.circular(10),

    //   ),
    //   child: Column(
    //     children: [
    //       // Colored background
    //       Container(
    //         clipBehavior: Clip.antiAlias,
    //         height: 150,
    //         width: double.infinity,
    //         decoration:const BoxDecoration(
    //           color: Colors.red,
    //           // child: product['image'], // Use color from the product data
    //           borderRadius: const BorderRadius.vertical(
    //             top: Radius.circular(10),
    //           ),
    //         ),
    //         child: Stack(
    //           children: [
    //             // Favorite Icon

    //            Image.asset(product['image'], fit: BoxFit.fill,),
    //             //product['image'],
    //             Positioned(
    //               top: 8,
    //               right: 8,
    //               child: CircleAvatar(
    //                 backgroundColor: Colors.transparent,
    //                 child: IconButton(
    //                   icon: const Icon(Icons.favorite_border,
    //                       color: Colors.black,
    //                      ),
    //                   onPressed: () {

    //                   },
    //                 ),
    //               ),
    //             ),
    //             // Discount and offer details
    //             if (product.containsKey('discount'))
    //               Positioned(
    //                 bottom: 8,
    //                 left: 8,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     if (product.containsKey('extraOffer'))
    //                       Container(
    //                         padding: const EdgeInsets.symmetric(
    //                             horizontal: 8, vertical: 4),
    //                         color: Colors.red,
    //                         child: Text(
    //                           product['extraOffer']!,
    //                           style: GoogleFonts.quicksand(
    //                               color: Colors.white, fontSize: 10),
    //                         ),
    //                       ),
    //                     Container(
    //                       padding: const EdgeInsets.symmetric(
    //                           horizontal: 8, vertical: 4),
    //                       color: Colors.red.shade300,
    //                       child: Text(
    //                         product['discount']!,
    //                         style: GoogleFonts.quicksand(
    //                             color: Colors.white, fontSize: 10),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //           ],
    //         ),
    //       ),
    //       // Price and title
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 product['price'],
    //                 style: GoogleFonts.quicksand(
    //                     fontWeight: FontWeight.bold, fontSize: 16),
    //               ),
    //               if (product.containsKey('discountPrice'))
    //                 Text(
    //                   product['discountPrice']!,
    //                   style: GoogleFonts.quicksand(
    //                     decoration: TextDecoration.lineThrough,
    //                     color: Colors.grey,
    //                     fontSize: 12,
    //                   ),
    //                 ),
    //               const SizedBox(height: 4),
    //               Text(
    //                 product['title'],
    //                 style: GoogleFonts.quicksand(fontSize: 14),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
//     );
//   }
// }
