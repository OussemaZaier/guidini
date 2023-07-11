import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/utils/constants.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 2;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(
      initialPage: 2,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        padding: EdgeInsets.all(5.0),
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        snakeViewColor: kMainGreen,
        selectedItemColor:
            SnakeShape.circle == SnakeShape.indicator ? kMainGreen : null,
        unselectedItemColor: kMainGreen,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined), label: 'New cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outlined), label: 'Redeem'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined), label: 'Recipes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile')
        ],
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        showUnselectedLabels: true,
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            SignIn(),
            SignUp(),
            HomePage(),
            SignUp(),
            SignIn(),
          ],
        ),
      ),
    );
    // ));
  }
}
