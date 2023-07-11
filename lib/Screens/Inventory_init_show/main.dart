import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/Welcome/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/recette/main.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class Inventory_init_show extends StatelessWidget {
  Inventory_init_show({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFF0ba360),
              Color(0xFF3CBA92),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: [
              Image.asset(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  'assets/images/whiteLogo.png'),
              Text('Inventory',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  )),
              welcomeButton(
                  text: "Add",
                  fct: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => recette(),
                            ))
                      },
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  icon: Icons.add),
              welcomeButton(
                  text: "Finish",
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
