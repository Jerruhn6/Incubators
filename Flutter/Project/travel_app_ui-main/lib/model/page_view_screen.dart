import 'package:flutter/material.dart';
import 'package:travel_app/view/on_board_screen.dart';

class PageViewScreen extends StatelessWidget {
  PageViewScreen({super.key});

  static Map page1 = {
    'image': 'assets/Images/OnBoardImg1.png',
    'title1': "Life is short and the world is ",
    'title2': "wide",
    'description':
        "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations",
    'buttonText': "Get Started",
    'containers': [
      {
        'height': 7.0,
        'width': 35.0,
        'color': const Color.fromRGBO(13, 110, 253, 1),
      },
      {
        'height': 7.0,
        'width': 13.0,
        'color': const Color.fromRGBO(202, 234, 255, 1),
      },
      {
        'height': 7.0,
        'width': 8.0,
        'color': const Color.fromRGBO(202, 234, 255, 1),
      }
    ],
    'navigation': page2,
  };
  static Map page2 = {
    'image': 'assets/Images/OnBoardImg2.png',
    'title1': "It's a big world out there go ",
    "title2": "explore",
    'description':
        "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
    'buttonText': "Next",
    'containers': [
      {
        'height': 7.0,
        'width': 13.0,
        'color': const Color.fromRGBO(202, 234, 255, 1),
      },
      {
        'height': 7.0,
        'width': 35.0,
        'color': const Color.fromRGBO(13, 110, 253, 1),
      },
      {
        'height': 7.0,
        'width': 8.0,
        'color': const Color.fromRGBO(202, 234, 255, 1),
      }
    ],
    'navigation': page3,
  };
  static Map page3 = {
    'image': 'assets/Images/OnBoardImg3.png',
    'title1': "People don’t take trips, trips take ",
    'title2': "people",
    'description':
        "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
    'buttonText': "Next",
    'containers': [
      {
        'height': 7.0,
        'width': 13.0,
        'color': const Color.fromRGBO(202, 234, 255, 1),
      },
      {
        'height': 7.0,
        'width': 8.0,
        'color': const Color.fromRGBO(202, 234, 255, 1),
      },
      {
        'height': 7.0,
        'width': 35.0,
        'color': const Color.fromRGBO(13, 110, 253, 1),
      },
    ],
    'navigation': null,
  };

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        OnBoardScreen(content: page1),
        OnBoardScreen(content: page2),
        OnBoardScreen(content: page3),
      ],
    );
  }
}
