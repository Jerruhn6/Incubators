
//-------------------------------------new -------------------------//
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_in/Model/favModel.dart';
import 'package:starbucks_in/View/commanScreen.dart';
import 'package:starbucks_in/payment_screen.dart';



class ProductDetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final String price;
  const ProductDetailsScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.price});
  //title=title1;
 
  

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  void addToBasket(FavModel product2) async {
    // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    try {
      await FirebaseFirestore.instance
          .collection("basket")
          .add(product2.toMap());
      // Add the product to the 'favorites' collection in Firebase
      // await _dbRef.child('favorites').push().set(product.toMap());
      print("Product added to favorites successfully.");
    } catch (e) {
      print("Error adding product to favorites: $e");
    }
  }
  // final Set<int> basketIndices = {};
  // final isBasket = basketIndices.contains(index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: Colors.white,
          ),
        
        ),
       backgroundColor: Colors.brown,
        //foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                borderRadius:  BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft:Radius.circular(40) ),
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover, // Replace with the sofa image URL
                height: MediaQuery.of(context).size.height*0.45,
                //width: 850,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          
                          child: Text(
                           widget.title,
                            style: GoogleFonts.quicksand(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "₹${widget.price}",
                      style: GoogleFonts.quicksand(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Inclusive of all taxes",
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // Icon(Icons.question_mark_outlined,
                        //     size: 16, color: Colors.grey),
                        // SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            style: GoogleFonts.quicksand(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      height: 18,
                      color: Colors.grey[300],
                    ),
                    
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        //return SofaScreen();
                        return PaymentScreen(totalAmount: double.parse(widget.price),title:    widget.title,price: widget.price,image: widget.image ,);
                      }));
                    
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.brown,
                            ),
                            child: Text(
                              "BUY NOW",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),

                        //SizedBox(width: 10,),

                        GestureDetector(
                          onTap: () {
                            log(widget.title);

                                        FavModel newProduct = FavModel(
                                          productName: widget.title,
                                          productImage: widget.image, // You can use an image URL
                                          productPrice: widget.price,
                                        );
                                        addToBasket(newProduct);
                                        setState(() {
                                          // if (isBasket) {
                                          //   basketIndices.remove(
                                          //       index); // Remove from favorites
                                          // } else {
                                          //   basketIndices
                                          //       .add(index); // Add to favorites
                                          // }
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Added to Cart')),
                                    );
                                        // Example product to add to the list
                                    //     //log("${product.name}");

                                    //     FavModel newProduct = FavModel(
                                    //       productName: widget.title,
                                    //       productImage: widget.image, // You can use an image URL
                                    //       productPrice:widget.price,
                                    //     );
                                    //     addToBasket(newProduct);
                                    //     setState(() {
                                    //       if (isBasket) {
                                    //         basketIndices.remove(
                                    //             index); // Remove from favorites
                                    //       } else {
                                    //         basketIndices
                                    //             .add(index); // Add to favorites
                                    //       }
                                    //     });
                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //       content: Text('Added to Cart')),
                                    // );
                                      },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.brown),
                            child: Text(
                              "ADD TO BASKET",
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}