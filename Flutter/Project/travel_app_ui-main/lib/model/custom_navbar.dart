import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view/home_screen.dart';
import 'package:travel_app/view/message_screen.dart';
import 'package:travel_app/view/profile_screen.dart';
import 'package:travel_app/view/schedule_screen.dart';
import 'package:travel_app/view/search_screen.dart';


class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selectedIndex = 0;
  static const List<Widget> _pageOptions = <Widget>[
    HomeScreen(),
   ScheduleScreen(),
    SearchScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pageOptions,
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        height: 100,
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(180, 30),
            topRight: Radius.elliptical(180, 30),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return GoogleFonts.poppins(
                  color: Color.fromRGBO(13, 110, 253, 1),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                );
              }

              return GoogleFonts.poppins(
                color: Color.fromRGBO(125, 132, 141, 1),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              );
            }),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            onDestinationSelected: _onTap,
            indicatorColor: Colors.transparent,
            selectedIndex: _selectedIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: (_selectedIndex == 0)
                      ? Color.fromRGBO(13, 110, 253, 1)
                      : Color.fromRGBO(125, 132, 141, 1),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: (_selectedIndex == 1)
                      ? Color.fromRGBO(13, 110, 253, 1)
                      : Color.fromRGBO(125, 132, 141, 1),
                ),
                label: 'Calendar',
              ),
              NavigationDestination(
                icon: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(13, 110, 253, 1),
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                label: ' ',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.message_outlined,
                  color: (_selectedIndex == 3)
                      ? Color.fromRGBO(13, 110, 253, 1)
                      : Color.fromRGBO(125, 132, 141, 1),
                ),
                label: 'Messages',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: (_selectedIndex == 4)
                      ? Color.fromRGBO(13, 110, 253, 1)
                      : Color.fromRGBO(125, 132, 141, 1),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//-------------------------------------------------------------------//

              // Column(
              //   spacing: 1,
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.home_outlined,
              //       color: Color.fromRGBO(13, 110, 253, 1),
              //     ),
              //     Text(
              //       "Home",
              //       style: GoogleFonts.poppins(
              //         fontSize: 12,
              //         fontWeight: FontWeight.w500,
              //         color: Color.fromRGBO(13, 110, 253, 1),
              //       ),
              //     ),
              //   ],
              // ),
      
              // Column(
              //   spacing: 1,
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.calendar_month_outlined,
              //       color: Color.fromRGBO(125, 132, 141, 1),
              //     ),
              //     Text(
              //       "Calendar",
              //       style: GoogleFonts.poppins(
              //         fontSize: 11,
              //         fontWeight: FontWeight.w500,
              //         color: Color.fromRGBO(125, 132, 141, 1),
              //       ),
              //     ),
              //   ],
              // ),
      
              // Column(
              //   spacing: 1,
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       alignment: Alignment.center,
              //       height: 50,
              //       width: 50,
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.blue.shade200,
              //             spreadRadius: 1, // No spread
              //             blurRadius: 10, // Smooth blur effect
              //             offset: Offset(0, 3), // Moves shadow only downward
              //           ),
              //         ],
              //         borderRadius: BorderRadius.circular(50),
              //         color: Color.fromRGBO(13, 110, 253, 1),
              //       ),
              //       child: Icon(
              //         Icons.search_rounded,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //     ),
              //   ],
              // ),
      
              // Column(
              //   spacing: 1,
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.message_outlined,
              //       color: Color.fromRGBO(125, 132, 141, 1),
              //     ),
              //     Text(
              //       "Messages",
              //       style: GoogleFonts.poppins(
              //         fontSize: 12,
              //         fontWeight: FontWeight.w500,
              //         color: Color.fromRGBO(125, 132, 141, 1),
              //       ),
              //     ),
              //   ],
              // ),
      
              // Column(
              //   spacing: 1,
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.person_2_outlined,
              //       color: Color.fromRGBO(125, 132, 141, 1),
              //     ),
              //     Text(
              //       "Profile",
              //       style: GoogleFonts.poppins(
              //         fontSize: 12,
              //         fontWeight: FontWeight.w500,
              //         color: Color.fromRGBO(125, 132, 141, 1),
              //       ),
              //     ),
              //   ],
              // ),

