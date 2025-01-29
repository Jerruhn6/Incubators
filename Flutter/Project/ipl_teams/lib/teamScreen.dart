import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  final String teamName;
  final List<Map<String, dynamic>> players;

  const TeamScreen({super.key, required this.teamName, required this.players});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.teamName,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.players.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.blue.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade300.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.players[index]["photo"]),
              ),
              title: Text(
                widget.players[index]["name"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "Jersey Number: ${widget.players[index]["jersey"]}",
                style: const TextStyle(fontSize: 16, color: Colors.black38),
              ),
              trailing: Icon(
                Icons.sports_cricket,
                color: Colors.white,
                size: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
