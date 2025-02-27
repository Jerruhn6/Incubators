import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return const DesktopView();
          } else {
            return const MobileView();
          }
        },
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderSection(),
          FeatureSection(),
        ],
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderSection(),
          FeatureSection(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/image1.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 400,
        ),
        const Positioned(
          top: 50,
          left: 20,
          child: Text(
            'NETFLIX',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        const Positioned(
          bottom: 50,
          left: 20,
          child: Text(
            'Unlimited movies, TV shows, and more',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  final List<Map<String, String>> features = const [
    {'title': 'Enjoy on your TV', 'description': 'Watch on Smart TVs, PlayStation, Xbox, and more.', 'image': 'assets/tv.png'},
    {'title': 'Download your shows to watch offline', 'description': 'Save favorites easily and always have something to watch.', 'image': 'assets/download.png'},
    {'title': 'Watch everywhere', 'description': 'Stream on your phone, tablet, laptop, and TV.', 'image': 'assets/watch_everywhere.png'},
    {'title': 'Create profiles for kids', 'description': 'Send kids on adventures with their favorite characters.', 'image': 'assets/kids_profile.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: features.map((feature) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.black,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(feature['image']!, width: 50, height: 50),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feature['title']!,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          feature['description']!,
                          style: const TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
