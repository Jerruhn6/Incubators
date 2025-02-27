import 'package:expense_manager_app/about_us_screen.dart';
import 'package:expense_manager_app/category_screen.dart';
import 'package:expense_manager_app/explore_page.dart';
import 'package:expense_manager_app/graph_screen.dart';
import 'package:expense_manager_app/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBarPage extends StatefulWidget {
  const MenuBarPage({super.key});

  @override
  State<MenuBarPage> createState() => _MenuBarPageState();
}

class _MenuBarPageState extends State<MenuBarPage> {
  List<Map<String, dynamic>> menuItems = [
    {
      'icon': 'assets/SVG/transaction_icon.svg',
      'label': 'Transaction',
      'onTap': (BuildContext context) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ExplorePage()),
        );
      },
    },
    {
      'icon': 'assets/SVG/graph_icon.svg',
      'label': 'Graphs',
      'onTap': (BuildContext context) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GraphScreen()),
        );
      },
    },
    {
      'icon': 'assets/SVG/category_icon.svg',
      'label': 'Category',
      'onTap': (BuildContext context) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CategoryScreen()),
        );
      },
    },
    {
      'icon': 'assets/SVG/trash_icon.svg',
      'label': 'Trash',
      'onTap': (BuildContext context) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const TrashScreen()),
        );
      },
    },
    {
      'icon': 'assets/SVG/contact_icon.svg',
      'label': 'About us',
      'onTap': (BuildContext context) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AboutUsScreen()),
        );
      },
    },
  ];
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        color: Colors.white,
        width: 216,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expense Manager',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Saves all your Transactions',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: GestureDetector(
                        onTap: item['onTap'] != null
                            ? () => item['onTap']!(context)
                            : null,
                        child: Container(
                          height: 45,
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                           // color: Color.fromRGBO(14, 161, 125, 0.15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(item['icon']!),
                                const SizedBox(width: 10),
                                Text(
                                  item['label']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    
  }
}
