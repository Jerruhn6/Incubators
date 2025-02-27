import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationCenterScreen(),
    );
  }
}

class NotificationCenterScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      date: '22 Nov 2024',
      imageUrl:
          'assets/Images/notify1.png',
      title: 'Good News!',
      description: 'One Day Preview Extended',
    ),
    NotificationItem(
      date: '21 Nov 2024',
      imageUrl:
            'assets/Images/notify2.png',
      title: '✌️ hours is all you have',
      description: 'Shop now, SAVE MORE!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Centre', style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),),
        // backgroundColor: const Color(0xFFFFE082),
         leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new,size:20)),
        foregroundColor: Colors.black,
        centerTitle: true,
        //elevation: 1.0,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.settings),
        //   ),
        // ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
               side: const BorderSide(
                color: Colors.black, // Border color
                width: 2.0, // Border width
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8.0,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        notification.date,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      notification.imageUrl,
                      height: 150.0,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Title
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  // Description
                  Text(
                    notification.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String date;
  final String imageUrl;
  final String title;
  final String description;

  NotificationItem({
    required this.date,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
