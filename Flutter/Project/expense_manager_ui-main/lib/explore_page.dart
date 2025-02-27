
import 'package:expense_manager_app/explore_page_body.dart';

import 'package:expense_manager_app/menu_bar_page.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "November 2024",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.expand_more_outlined),
          ],
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
      ),
      drawer: const MenuBarPage(),
      body:const ExplorePageBody(),
    );
  }
}


