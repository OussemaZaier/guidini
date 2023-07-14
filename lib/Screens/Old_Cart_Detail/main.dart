import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/Profile/main.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class Old_Cart_Detail extends StatelessWidget {
  Old_Cart_Detail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 237, 237, 237),
            ],
            center: Alignment(-1, -1),
            radius: 3.0,
          ),
        ),
        child: Column(
          children: [
            title(
              bgColor1: Color(0XFF123456),
              bgColor2: Colors.blue,
              text: '13 Jul. 2023',
              txtColor: Colors.white,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  kSizedBox1,
                  kSizedBox1,
                  productCard(
                    text1: 'Product1',
                    text2: ' ',
                    quantity: 3,
                    text4: '',
                    icon: Icons.abc,
                    fct: () {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    shadow: true,
                    add_remove: true,
                    text3: '',
                  ),
                  productCard(
                    text1: 'Product1',
                    text2: ' ',
                    quantity: 3,
                    text4: '',
                    icon: Icons.abc,
                    fct: () {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    shadow: true,
                    add_remove: true,
                    text3: '',
                  ),
                  productCard(
                    text1: 'Product1',
                    text2: ' ',
                    quantity: 3,
                    text4: '',
                    icon: Icons.abc,
                    fct: () {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    shadow: true,
                    add_remove: true,
                    text3: '',
                  ),
                  kSizedBox1,
                  kSizedBox1,
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: welcomeButton(
                        text: "Add",
                        fct: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Inventory_add(),
                                  ))
                            },
                        bgColor: Colors.white,
                        txtColor: Colors.black,
                        icon: Icons.add),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: welcomeButton(
                        text: "Finish",
                        fct: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Navigation(
                                      pageNumber: 4,
                                    ),
                                  ))
                            },
                        bgColor: Colors.white,
                        txtColor: Colors.black,
                        icon: Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
              kSizedBox1,
            ]),
          ],
        ),
      ),
    );
  }
}
