import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/Welcome/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/recette/main.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class productCard extends StatelessWidget {
  productCard({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.fct,
    this.icon,
    required this.bgColor,
    required this.txtColor,
  }) : super(key: key);
  String text1;
  String text2;
  String text3;
  IconData? icon;
  VoidCallback fct;
  Color bgColor;
  Color txtColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fct,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 200,
                child: Row(
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Image.asset('assets/images/blackLogo.png',
                            height: 42, width: 42),
                      )
                    else
                      SizedBox(),
                    Text(
                      text1,
                      style: TextStyle(
                        fontSize: 20,
                        color: txtColor,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                )),
            Container(width: 8),
            Container(
              width: 100,
              child: Text(
                text2,
                style: TextStyle(
                  fontSize: 20,
                  color: txtColor,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Container(width: 8),
            Container(
              child: Text(
                text3,
                style: TextStyle(
                  fontSize: 20,
                  color: txtColor,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
