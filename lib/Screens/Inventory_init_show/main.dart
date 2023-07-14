import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/navigation.dart';
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
          gradient: RadialGradient(
            colors: [
              Color(0xFF118b44),
              kMainGreen,
            ],
            center: Alignment(-1, -1),
            radius: 3.0,
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
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  )),
              kSizedBox1,
              productCard(
                text1: 'Product1',
                text2: ' ',
                quantity: 3,
                text4: '',
                fct: () {},
                bgColor: Colors.white,
                txtColor: Colors.black,
                shadow: true,
                add_remove: true,
                text3: '',
                icon: Icons.shop,
              ),
              productCard(
                  text1: 'Product2',
                  text2: '',
                  quantity: 3,
                  text4: '',
                  fct: () {},
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  shadow: true,
                  add_remove: true,
                  text3: '',
                  icon: Icons.shop),
              productCard(
                  text1: 'Product3',
                  text2: ' ',
                  quantity: 3,
                  text4: '',
                  fct: () {},
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  shadow: true,
                  add_remove: true,
                  text3: '',
                  icon: Icons.shop),
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
                                builder: (context) => Navigation(),
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
      ),
    );
  }
}
