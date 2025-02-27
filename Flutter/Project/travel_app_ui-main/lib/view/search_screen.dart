import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/all_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  AllList searchList=AllList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(125, 132, 141, 0),
        appBar: AppBar(
          title: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                "Search",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.0508,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "Cancel",
                style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.0451,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromRGBO(13, 110, 253, 1)),
              ),
            ),
          ],
          backgroundColor: const Color.fromRGBO(125, 132, 141, 0),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return Padding(
            padding: const EdgeInsets.only(
                    left: 16,
                    right: 16
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: [
            
                SizedBox(
                  height: screenHeight*0.05050,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Places',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: screenWidth*0.0451,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(125, 132, 141, 1)
                    ),
                    prefixIcon: const Icon(Icons.search,  color: Color.fromRGBO(125, 132, 141, 1)),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                                
                        Container(
                          height: screenHeight*0.0303,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: const Color.fromRGBO(125, 132, 141, 1)
                            )
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mic, color: Colors.grey),
                        ),
                      ],
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
            
                SizedBox(
                  height: screenHeight*0.02525,
                ),
            
                Text(
                  "Search Places",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth*0.0564,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(27, 30, 40, 1)
                  ),
                ),

                SizedBox(
                  height: screenHeight*0.03525,
                ),

                Expanded(
                  child: GridView.builder(
                    
                    shrinkWrap: true,
                    itemCount: searchList.homeList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenHeight*0.3327,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                  
                    ), 
                    itemBuilder:(context,index){
                      return Container(
                        height: screenHeight*0.2727,
                        width: screenWidth*0.4544,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow:const [
                            BoxShadow(
                              offset: Offset(0, 6),
                              blurRadius: 16,
                              spreadRadius: 0,
                              color: Color.fromRGBO(180, 188, 201, 0.12)
                            )
                          ],
                          color: Colors.white
                        ),
                      
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                          bottom: 5
                        ),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                height: screenHeight*0.186,
                                width: screenWidth*0.386,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  
                                ),
                                child: Image.asset(
                                  searchList.homeList[index]["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                             
                            ),
                      
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15
                              ),
                              child: Text(
                                searchList.homeList[index]["desName"],
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth*0.0395,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(27, 30, 40, 1)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                left: 15,
                                bottom: 5
                              ),
                              child: Row(
                                children: [
                                                    
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: screenWidth*0.0338,
                                    color: const Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                  
                                                    
                                  Text(
                                    searchList.homeList[index]["location"],
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth*0.0338,
                                      fontWeight: FontWeight.w400,
                                       color: const Color.fromRGBO(125, 132, 141, 1),
                                                    
                                    ),
                                  )
                                ],
                              ),
                            ),
                      
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15
                              ),
                              child: Row(
                                children: [
                                                    
                                   Text(
                                    "894/",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth*0.0338,
                                      fontWeight: FontWeight.w400,
                                       color: const Color.fromRGBO(13, 110, 253, 1)
                                                    
                                                    
                                    ),
                                  ),
                                                    
                                  Text(
                                    "Person",
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth*0.0338,
                                      fontWeight: FontWeight.w400,
                                       color: const Color.fromRGBO(125, 132, 141, 1),
                                                    
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    ),
                )
              ],
            ),
          );
        }
        ),
        );
  }
}
