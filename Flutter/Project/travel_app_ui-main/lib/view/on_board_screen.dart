import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view/login_screen.dart';

class OnBoardScreen extends StatefulWidget {
  final Map content;
  const OnBoardScreen({super.key, required this.content});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Image.asset(
                    widget.content["image"],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                    top: 56,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(202, 234, 255, 1)),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.content["title1"],
                      style: GoogleFonts.aclonica(
                          fontSize: 26, fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: widget.content["title2"],
                      style: GoogleFonts.aclonica(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 55),
              child: Text(
                textAlign: TextAlign.center,
                widget.content["description"],
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: widget.content['containers'][0]['height'],
                  width: widget.content['containers'][0]['width'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: widget.content['containers'][0]['color'],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: widget.content['containers'][1]['height'],
                  width: widget.content['containers'][1]['width'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: widget.content['containers'][1]['color'],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: widget.content['containers'][2]['height'],
                  width: widget.content['containers'][2]['width'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: widget.content['containers'][2]['color'],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return (widget.content['navigation'] == null)
                        ? const LoginScreen()
                        : OnBoardScreen(content: widget.content['navigation']);
                  }));
                },
                child: Container(
                  width: 320,
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(13, 110, 253, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.content['buttonText'],
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
