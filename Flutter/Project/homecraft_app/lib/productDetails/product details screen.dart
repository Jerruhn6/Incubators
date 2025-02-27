

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/Shipping/shipping_screen.dart';


class ProductDetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final String price;
  ProductDetailsScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.price});
  //title=title1;
 
  

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
        ),
       // backgroundColor: const Color(0xFFFFE082),
        foregroundColor: Colors.black,
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
              child: Image.asset(
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
                        Container(
                          width: 270,
                          
                          child: Text(
                           widget.title,
                            style: GoogleFonts.quicksand(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Spacer(),
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
                      widget.price,
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                        Text(
                          "Pay in installments starting from ₹ 3,333.25 / month",
                          style: GoogleFonts.quicksand(fontSize: 12),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      height: 18,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        Text(
                          "1 Colours available",
                          style: GoogleFonts.quicksand(fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          "All Colours",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          
                          ),
                            child: Image.asset(
                                  widget.image,
               
                              
                              fit: BoxFit.cover,
                            ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Colour: Grey",
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            color: Colors.black,
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
                        return ShippingScreen(price:widget.price,title:widget.title,image:widget.image);
                      }));
                    
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
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

                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black),
                          child: Text(
                            "ADD TO BASKET",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}
