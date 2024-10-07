import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(NetflixHome());
}

class NetflixHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Home',
      theme: ThemeData.dark(),
      home: NetflixHomePage(),
    );
  }
}

class NetflixHomePage extends StatelessWidget {
  final List<String> _featuredMovies = [
    // Featured movies
    'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
    'https://image.tmdb.org/t/p/w500/jTswp6KyDYKtvC52GbHagrZbGvD.jpg',
    'https://image.tmdb.org/t/p/w500/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg',
  ];

  final List<String> _popularMovies = [
    // Popular movies
    'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
    'https://image.tmdb.org/t/p/w500/5BwqwxMEjeFtdknRV792Svo0K1v.jpg',
    'https://image.tmdb.org/t/p/w500/7D430eqZj8y3oVkLFfsWXGRcpEG.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Netflix"),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Section
            _buildFeaturedSection(),
            SizedBox(height: 20),
            // Movie Categories
            _buildCategorySection("Popular on Netflix", _popularMovies),
            SizedBox(height: 20),
            _buildCategorySection("Trending Now", _popularMovies),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: _featuredMovies.map((movieUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.black),
              child: CachedNetworkImage(
                imageUrl: movieUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategorySection(String title, List<String> movieUrls) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieUrls.length,
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: CachedNetworkImage(
                  imageUrl: movieUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
