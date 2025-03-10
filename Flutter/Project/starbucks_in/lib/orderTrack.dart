import 'package:flutter/material.dart';
import 'package:starbucks_in/cart.dart';
import 'package:starbucks_in/favorite_screen.dart';
import 'package:starbucks_in/navigator.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({super.key});

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            const Icon(Icons.brunch_dining_rounded, size: 100),
            const Text(
              "Thank You For Your Order!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            const Text(
              "Wait For Your Order No",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 90,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.brown[800],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AnimatedNavbar(basketCount: basketList.length, favCount: wishlist.length,)),
                    );
                  },
                  child: const Text(
                    'Continue ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
