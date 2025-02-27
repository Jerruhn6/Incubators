// import 'package:flutter/material.dart';
// import 'package:homecraft_app/screens/welcome_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   void navigate(BuildContext context) {
//     Future.delayed(const Duration(seconds: 3), () async {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) {
//             return const WelcomeScreen();
//           },
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     navigate(context);
//     return Scaffold(
//       body: Center(
//           child: Stack(
//         children: [
//           // SizedBox(
//           //   width: MediaQuery.of(context).size.width,
//           //   height: MediaQuery.of(context).size.height,
//           //   child: Image.asset("assets/images/background.jpg"),
//           // ),
//           Center(
//             child: SizedBox(
//               width: 250,
//               height: 250,
//               child: Image.asset("assets/Images/logo.jpg"),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:homecraft_app/MyBasket/todo_app_ui.dart';
import 'package:homecraft_app/favourite/favouriteScreen.dart';
import 'package:homecraft_app/screens/bottom_navbar.dart';

import 'package:homecraft_app/screens/welcome_screen.dart';
import 'package:homecraft_app/widgets/shared_preference.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  
  void navigate(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
       
        await SessionData.getSessionData();
        print("IS LOGIN : ${SessionData.isLogin}");
        if (SessionData.isLogin!) {
          print("NAVIGATE TO HOME");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return AnimatedNavbar(basketCount:basketList.length,favCount:wishlist.length);
              },
            ),
          );
        } else {
          print("NAVIGATE TO LOGIN");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const WelcomeScreen();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("IN BUILD");
    navigate(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          //  height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/Images/logo.jpg",
            fit: BoxFit.fill,
           
          ),
        ),
      ),
    );
  }
}
