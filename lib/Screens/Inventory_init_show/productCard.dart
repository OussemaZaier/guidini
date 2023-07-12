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
    required this.shadow,
    required this.add_remove,
  }) : super(key: key);
  String text1;
  String text2;
  String text3;
  IconData? icon;
  VoidCallback fct;
  Color bgColor;
  Color txtColor;
  bool shadow;
  bool add_remove;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fct,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadow
                  ? Color.fromARGB(70, 0, 0, 0)
                  : Color.fromARGB(0, 0, 0, 0),
              blurRadius: 6,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 190,
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
                        fontSize: 17,
                        color: txtColor,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                )),
            Container(width: 8),
            Container(
              width: 80,
              child: Text(
                text2,
                style: TextStyle(
                  fontSize: 17,
                  color: txtColor,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Container(
                child: Row(children: [
              if (add_remove == true)
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: InkWell(
                    onTap: () => {},
                    child: Icon(
                      Icons.remove,
                      color: txtColor,
                      size: 20,
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 20,
                ),
              Text(
                text3,
                style: TextStyle(
                  fontSize: 17,
                  color: txtColor,
                  fontFamily: 'Lato',
                ),
              ),
              if (add_remove == true)
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: Icon(
                    Icons.add,
                    color: txtColor,
                    size: 20,
                  ),
                )
              else
                SizedBox(),
            ])),
          ],
        ),
      ),
    );
  }
}
