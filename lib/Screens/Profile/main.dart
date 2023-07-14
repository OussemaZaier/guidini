import 'package:flutter/material.dart';
import 'package:guidini/Screens/EditProfile/EditProfile.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_show/main.dart';
import 'package:guidini/Screens/Old_Cart_Detail/main.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/cartCard.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  title(
                    bgColor2: kMainGreen,
                    bgColor1: Color.fromARGB(255, 16, 161, 31),
                    text: 'Profile',
                    txtColor: Colors.white,
                  ),
                  kSizedBox1,
                  kSizedBox1,
                  Text('Flen el Fouleni',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      '5890 Points',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: welcomeButton(
                      text: "Edit profile",
                      fct: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        ),
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: welcomeButton(
                      text: "View inventory",
                      fct: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Inventory_show()))
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                    ),
                  ),
                ],
              ),
              kSizedBox1,
              kSizedBox1,
              // v _______ Previous carts + savings _______ v
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Previous carts",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    kSizedBox1,
                    cartCard(
                        title: "13 Jul. 2023 \n You saved 61.00 DT",
                        topText: '',
                        bgColor1: Color(0XFF123456),
                        bgColor2: Colors.blue,
                        buttonFct: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Old_Cart_Detail()))
                            },
                        buttonText: 'View details'),
                    cartCard(
                        title: "7 Jun. 2023 \n You saved 79.00 DT",
                        topText: '',
                        bgColor1: Color.fromARGB(255, 18, 140, 69),
                        bgColor2: const Color.fromARGB(255, 93, 243, 33),
                        buttonFct: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Old_Cart_Detail()))
                            },
                        buttonText: 'View details'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
