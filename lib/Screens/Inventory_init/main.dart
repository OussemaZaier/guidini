import 'package:flutter/material.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Welcome/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/descriptionapp/main.dart';
import 'package:guidini/utils/constants.dart';

class Inventory_init extends StatelessWidget {
  Inventory_init({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Welcome(
        child: welcomeButton(
          text: "Next",
          fct: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => descriptionapp(),
              ),
            ),
          },
          bgColor: Colors.white,
          txtColor: kMainGreen,
        ),
        title: 'Welcome, \n Let\'s get started!');
  }
}
