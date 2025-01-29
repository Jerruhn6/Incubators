import 'package:flutter/material.dart';
import 'package:ipl_teams/teamScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> teams = [
    {
      "name": "Mumbai Indians",
      "players": [
        {
          "name": "Rohit Sharma",
          "jersey": 45,
          "photo": "https://pbs.twimg.com/media/GPFHugFbkAACcOT.jpg:large"
        },
        {
          "name": "Ishan Kishan",
          "jersey": 18,
          "photo": "https://example.com/images/ishan.jpg"
        },
        {
          "name": "Jasprit Bumrah",
          "jersey": 93,
          "photo": "https://example.com/images/bumrah.jpg"
        },
      ],
    },
    {
      "name": "Chennai Super Kings",
      "players": [
        {
          "name": "MS Dhoni",
          "jersey": 7,
          "photo": "https://example.com/images/dhoni.jpg"
        },
        {
          "name": "Ravindra Jadeja",
          "jersey": 8,
          "photo": "https://example.com/images/jadeja.jpg"
        },
        {
          "name": "Ruturaj Gaikwad",
          "jersey": 31,
          "photo": "https://example.com/images/ruturaj.jpg"
        },
      ],
    },
    {
      "name": "Royal Challengers Bangalore",
      "players": [
        {
          "name": "Virat Kohli",
          "jersey": 18,
          "photo": "https://example.com/images/kohli.jpg"
        },
        {
          "name": "Faf du Plessis",
          "jersey": 7,
          "photo": "https://example.com/images/faf.jpg"
        },
        {
          "name": "Mohammed Siraj",
          "jersey": 13,
          "photo": "https://example.com/images/siraj.jpg"
        },
      ],
    },
    {
      "name": "Kolkata Knight Riders",
      "players": [
        {
          "name": "Andre Russell",
          "jersey": 12,
          "photo": "https://example.com/images/russell.jpg"
        },
        {
          "name": "Shreyas Iyer",
          "jersey": 41,
          "photo": "https://example.com/images/shreyas.jpg"
        },
        {
          "name": "Sunil Narine",
          "jersey": 74,
          "photo": "https://example.com/images/narine.jpg"
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "IPL_TEAMS",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: teams.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamScreen(
                    teamName: teams[index]["name"],
                    players: teams[index]["players"],
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.blue.shade100,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  teams[index]["name"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}