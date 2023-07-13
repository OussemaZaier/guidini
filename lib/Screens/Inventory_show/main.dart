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

class Inventory_show extends StatelessWidget {
  Inventory_show({Key? key}) : super(key: key);
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
              bgColor2: kMainGreen,
              bgColor1: Color.fromARGB(255, 16, 161, 31),
              text: 'Inventory',
              txtColor: Colors.white,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  kSizedBox1,
                  productCard(
                      text1: '  Product',
                      text2: 'Expiry',
                      text3: 'Qty',
                      fct: () => {},
                      bgColor: Color.fromARGB(1, 1, 1, 1),
                      txtColor: Colors.black,
                      shadow: false,
                      add_remove: false),
                  Divider(
                    thickness: 1.2,
                    height: 5,
                    color: Colors.black,
                    indent: 30,
                    endIndent: 30,
                  ),
                  productCard(
                    icon: Icons.abc,
                    text1: 'Produit1',
                    text2: '12/12/12',
                    text3: '3',
                    fct: () => {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    shadow: true,
                    add_remove: false,
                  ),
                  productCard(
                    icon: Icons.abc,
                    text1: 'Produitxyzzz',
                    text2: '9/1/23',
                    text3: '7',
                    fct: () => {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    shadow: true,
                    add_remove: false,
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
