import 'package:flutter/material.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/Inventory_init_show/main.dart';
import 'package:guidini/Screens/Welcome/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';

class Inventory_init_choice extends StatelessWidget {
  Inventory_init_choice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Welcome(
        child: Column(children: [
          Column(
            children: [
              welcomeButton(
                text: "Scan my last receipt",
                fct: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ) // @TODO: CHANGEME TO CAMERA
                      )
                },
                bgColor: Colors.white,
                txtColor: kMainGreen,
                icon: Icons.receipt_long_outlined,
              ),
              welcomeButton(
                  text: "Enter manually",
                  fct: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inventory_init_show(),
                            ))
                      },
                  bgColor: Colors.white,
                  txtColor: kMainGreen,
                  icon: Icons.keyboard)
            ],
          ),
          kSizedBox1,
          InkWell(
            child: Text(
              'Skip for now',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 209, 209, 209),
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Inventory_init_show(), // @TODO: CHANGEME TO HOMEPAGE
                  ));
            },
          )
        ]),
        title: 'What do you \n have at home?');
  }
}
