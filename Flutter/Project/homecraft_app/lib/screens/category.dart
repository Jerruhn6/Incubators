import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homecraft_app/commanScreen.dart/allLists.dart';
import 'package:homecraft_app/commanScreen.dart/commanScreen.dart';


// import 'package:homecraft_app/screens/navbar.dart';
// Categorylists alllists= Categorylists();
Alllists alllists = Alllists();

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  List<List<Map<String, dynamic>>> allLivingRoom = [
    alllists.sofasList,
    alllists.sofasList,
    alllists.occasionalChairList,
    alllists.entertainmentList,
    alllists.diningTableslist,
    alllists.shoeRackList
  ];
  List<String> categoryImgList = [
    alllists.sofasList[0]["image"]!,
    alllists.sofasList[9]["image"]!,
    alllists.occasionalChairList[1]["image"]!,
    alllists.entertainmentList[6]["image"]!,
    alllists.diningTableslist[4]["image"]!,
    alllists.shoeRackList[3]["image"]!
  ];
  List<String> categoryTitleList = [
    "Sofas",
    "Recliners",
    "Chairs",
    "TV Units",
    "Tables",
    "Shoe Rack",
    
  ]; //add titles in list

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  //  CustomNavbar b1=CustomNavbar();

  ///----------------------------------------------------------------------------------------------------------//
  bool colorChange = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: (){
        //     Navigator.of(context).pop();
        //   },
        //   child: const Icon(
        //     Icons.arrow_back_ios_new_sharp,

        //   ),
        // ),
        title: Text(
          "Shop by Categories",
          style: GoogleFonts.quicksand(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "What are you looking for?",
                hintStyle: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFFFE082),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Living Room",
                        style: GoogleFonts.quicksand(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      colorChange = true;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Bedroom",
                        style: GoogleFonts.quicksand(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Diningroom",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Homeoffice",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Decor",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Furnishing",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Kitchen",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Dining",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Bath & Laundry",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Appliances",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Refurbished",
                      style: GoogleFonts.quicksand(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Colors.grey[300],
          ),

          Text(
            "  CATAGORIES ",
            style: GoogleFonts.quicksand(
                fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),

          //------------------------------------------------------------------------------//

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.categoryImgList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            //clipBehavior: Clip.antiAlias,
                            //borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return SofaScreen();
                              return Commanscreen(
                                list: widget.allLivingRoom[index],
                                title: widget.categoryTitleList[index],
                              );
                            }));
                          },
                          child: Image.asset(
                            widget.categoryImgList[index],
                            //height: MediaQuery.of(context).size.height * 0.16,              //---------Changed
                            fit: BoxFit.fill,
                          ),
                        )),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.categoryTitleList[index],
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
        ],
      ),
    );
  }
}
