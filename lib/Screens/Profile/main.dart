import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/Welcome/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/recette/main.dart';
import 'package:guidini/Screens/title.dart';

import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 244, 244, 244),
              Color.fromARGB(255, 230, 235, 231),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: [
          Column(
            children: [
              // Container(
              //   height: 150,
              //   color: Colors.green,
              //   width: MediaQuery.of(context).size.width,
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('hi',
              //             style: TextStyle(
              //               fontSize: 30,
              //               color: Colors.black,
              //               fontFamily: 'Lato',
              //               fontWeight: FontWeight.bold,
              //             )),
              //       ]),
              // ),
              title(
                bgColor1: const Color.fromARGB(255, 201, 16, 16),
                bgColor2: Color.fromARGB(255, 100, 100, 100),
                text: 'hiiii',
                txtColor: Colors.white,
              ),
              Text('PROFILEE',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'We recommend a cart based on your budget, and encourage you to make economical and sustainable purchases.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              welcomeButton(
                  text: "Next",
                  fct: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => recette(),
                            ))
                      },
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  icon: Icons.arrow_forward_ios_rounded)
            ],
          ),
          kSizedBox1,
        ]),
      ),
    );
  }
}
