
import 'package:expense_manager_app/menu_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphState();
}

class _GraphState extends State<GraphScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "icon": "assets/SVG/food_icon.svg",
      "title": "Food",
      "color": const Color.fromRGBO(214, 3, 3, 0.7),
      "expense": "₹ 650.00"
    },
    {
      "icon": "assets/SVG/fuel_icon.svg",
      "title": "Fuel",
      "color": const Color.fromRGBO(0, 148, 255, 0.7),
      "expense": "₹ 650.00"
    },
    {
      "icon": "assets/SVG/Vector (3).svg",
      "title": "Medicine",
      "color": const Color.fromRGBO(0, 174, 91, 0.7),
      "expense": "₹ 650.00"
    },
    {
      "icon": "assets/SVG/Vector (2).svg",
      "title": "Shopping",
      "color": const Color.fromRGBO(241, 38, 197, 0.7),
      "expense": "₹ 650.00"
    },
    {
      "icon": "assets/SVG/entertainment_icon.svg",
      "title": "Shopping",
      "color": const Color.fromRGBO(100, 62, 255, 0.7),
      "expense": "₹ 650.00"
    },
  ];

  double totalAmount = 0;
  Map<String, double> dataMap = {
    "Food": 475,
    "Fuel": 325,
    "Medicine": 650,
    "Entertainment": 300,
    "Shopping": 700,
  };

  List<Color> colorList = [
    const Color.fromRGBO(214, 3, 3, 0.7),
    const Color.fromRGBO(0, 148, 255, 0.7),
    const Color.fromRGBO(0, 174, 91, 0.7),
    const Color.fromRGBO(100, 62, 255, 0.7),
    const Color.fromRGBO(241, 38, 196, 0.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Graphs",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
        ),

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,  
          ),
          PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 50,
            chartRadius: MediaQuery.of(context).size.width * 0.3,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 34,
            centerText: "Total $totalAmount",
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),

          const SizedBox(
            height: 40,  
          ),

          const Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24),
            child: Divider(
              height: 2,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
          const SizedBox(
            height: 15,  
          ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: categories[index]['color'],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  categories[index]['icon'],
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          categories[index]["title"],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Row(
                            children: [
                              Text(
                                categories[index]['expense'],
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

         const Padding(
            padding:  EdgeInsets.only(
              left: 24,
              right: 24,
              top: 30
            ),
            child: Divider(
              height: 2,
             
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(
                  width: 40,
                ),
                Text(
                  "₹ $totalAmount",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

            
        ],
      ),

      drawer: const MenuBarPage(),
    );
  }
}

 
