import 'package:flutter/material.dart';
import 'package:guidini/utils/constants.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key, required this.child, required this.title})
      : super(key: key);
  final Widget child;
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kMainGreen,
              Color(0xFF118b44),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/whiteLogo.png',
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
