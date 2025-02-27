import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<Tables> {
  final List<Map<String, dynamic>> products = [
    {
      'color': Colors.grey.shade300,
      'price': '₹39,999',
      'title': 'Walter Half Leather 3-Seater Sofa - Grey',
    },
    {
      'color': Colors.blue.shade100,
      'price': '₹92,997',
      'title': 'Walter Half Leather 3+2+1 Seater Sofa Set - Grey',
    },
    {
      'color': Colors.green.shade200,
      'price': '₹29,999',
      'title': 'Walter Half Leather 2-Seater Sofa - Grey',
    },
    {
      'color': Colors.brown.shade300,
      'price': '₹17,999',
      'discountPrice': '₹34,018',
      'discount': '50% OFF',
      'extraOffer': 'EXTRA 10% C...',
      'title': 'Helios Emily Fabric 3-Seater Sofa - Brown',
    },
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
        leading: GestureDetector(onTap:(){Navigator.of(context).pop();},child: const Icon(Icons.arrow_back, color: Colors.black)),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '39 Products',
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
                return buildUnifiedContainer(product);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sort, color: Colors.black),
              label: Text('SORT',
                  style: GoogleFonts.quicksand(color: Colors.black)),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
              label: Text('REFINE',
                  style: GoogleFonts.quicksand(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUnifiedContainer(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Colored background
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: product['color'], // Use color from the product data
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: Stack(
              children: [
                // Favorite Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.black),
                      onPressed: () {},
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
                                  color: Colors.white, fontSize: 10),
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
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    product['title'],
                    style: GoogleFonts.quicksand(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
