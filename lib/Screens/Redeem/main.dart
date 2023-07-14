import 'package:flutter/material.dart';
import 'package:guidini/Screens/EditProfile/EditProfile.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_show/main.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/cartCard.dart';
import 'package:guidini/Screens/redeemCard.dart';
import 'package:guidini/Screens/title.dart';

import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class Redeem extends StatelessWidget {
  Redeem({Key? key}) : super(key: key);
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
              Column(children: [
                title(
                  bgColor2: Color(0XFF47b649),
                  bgColor1: Color.fromRGBO(24, 143, 74, 100),
                  text: 'Redeem',
                  txtColor: Colors.white,
                ),
                kSizedBox1,
                kSizedBox1,
              ]),
              kSizedBox1,
              kSizedBox1,
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    redeemCard(
                      imageurl: 'assets/images/Carrefour-Tunisie.png',
                      title: "30% off your next cart",
                      textcolor: Colors.black,
                      subtext: '',
                      bgColor: const Color.fromRGBO(255, 255, 255, 1),
                      buttonFct: () => {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      'Are you sure you want to redeem this offer?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('No')),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Yes')),
                                  ],
                                ))
                      },
                      buttonText: ' 5000 Points',
                    ),
                    redeemCard(
                      imageurl: 'assets/images/monoprix.png',
                      title: "20% on a choosed product",
                      textcolor: Colors.black,
                      subtext: '* on selected items',
                      bgColor: const Color.fromRGBO(255, 255, 255, 1),
                      buttonFct: () => {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      'Are you sure you want to redeem this offer?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('No')),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Yes')),
                                  ],
                                ))
                      },
                      buttonText: ' 5000 Points',
                    ),
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
