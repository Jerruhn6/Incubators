import 'package:camera_app/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String,dynamic>> cardList=[
    {
      "image":"assets/Images/camera2.png",
      "title":"Canon EOS 30D",
      "price":"16000",

    },

     {
      "image":"assets/Images/camera3.png",
      "title":"SONY 200mm Zoom",
      "price":"10000",
      
    },

    {
      "image":"assets/Images/camera1.png",
      "title":"SONY 200mm Zoom",
      "price":"6000",
      
    },

    {
      "image":"assets/Images/camera4.png",
      "title":"SONY 200mm Zoom",
      "price":"16000",

    },

     {
      "image":"assets/Images/camera3.png",
      "title":"SONY 200mm Zoom",
      "price":"10000",
      
    },

    {
      "image":"assets/Images/camera4.png",
      "title":"SONY 200mm Zoom",
      "price":"6000",
      
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF393B42),
              Color(0xFF232529),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PixelsCo.",
                      style: GoogleFonts.dmSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    size:25,
                    color: Colors.white,
                  ),
                  ],
                ),
                const SizedBox(height: 20),

              
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF1D1F23),
                        Color(0xFF484C57),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                       
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New Vintage \nCollection",
                              style: GoogleFonts.dmSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color.fromRGBO(50, 52, 59, 1),
                                    Color.fromRGBO(114, 117, 129, 0),
                                  ],
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.4),
                                    offset: Offset(0, 10.41),
                                    blurRadius: 21.33,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Explore now",
                                style: GoogleFonts.dmSans(
                                  fontSize: 10.41,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            )
                          ],
                        ),

                        Expanded(
                          child: Container(
                            width: 400, // Adjusted width
                            height: 300,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.13),
                                  offset: Offset(0, 20),
                                  blurRadius: 29,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/Images/camera1.png",
                              fit: BoxFit.cover, // Ensures proper scaling
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Text(
                  "Popular",
                  style: GoogleFonts.dmSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),

                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                            left: 10,
                            right: 10
                            
                          ),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: cardList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 200,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 160,
                            height: 222,
                           
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(
                                      54, 57, 65, 1), 
                                  Color.fromRGBO(
                                      62, 66, 75, 0),
                                ],
                              ),
                              boxShadow:const[
                               BoxShadow(
                                  color:Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 20),
                                  blurRadius: 60,
                                  spreadRadius: 0,
                                ),
                              ],
                              
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 3,
                                
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                    
                                      top: 10
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 15,
                                          color:Color.fromRGBO(255, 197,103,1)
                                        ),
                                    
                                        const SizedBox(
                                          width: 2,
                                        ),
                                    
                                        Text(
                                          "4.5",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 10.65,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(255, 255, 255, 1)
                                    
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                  ),
                                  Container(  
                                    width: 132.23,
                                    height: 134,
                                    alignment: Alignment.center,
                                    decoration:const BoxDecoration(
                                      boxShadow:[
                                 BoxShadow(
                                    color:Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 16.89),
                                    blurRadius: 32.66,
                                    spreadRadius: 0,
                                  ),
                                ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context){
                                            return ProductDetailScreen();
                                          })
                                        );
                                      },
                                      child: Image.asset( 
                                        cardList[index]['image'] ,
                                       fit: BoxFit.cover,
                                        ),
                                    ),
                                  ),
                              
                                  Text(
                                    cardList[index]['title'],
                                    style: GoogleFonts.dmSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                              
                                  Row(
                                    children: [
                                      Text(
                                        cardList[index]['price'] ,
                                        style: GoogleFonts.dmSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                              
                                      const Spacer(),
                              
                                      Container(
                                        width: 23.57,
                                        height: 21.75,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.63,
                                            color: const Color.fromRGBO(55, 73, 87, 0.2),
                                          ),
                              
                                         gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(
                                        54, 57, 65, 1), 
                                    Color.fromRGBO(
                                        62, 66, 75, 0),
                                  ],
                                ),
                              
                                borderRadius: BorderRadius.circular(5)
                                        ),
                              
                                        child: const Icon(
                                          size: 15,
                                          Icons.arrow_forward_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          
                            
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
