import 'package:flutter/material.dart';
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
              Color(0xFF0BA360),
              Color(0xFF3cba92),
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
                  text1: '  Product',
                  text2: 'Expiry',
                  text3: 'Qty',
                  text4: '',
                  fct: () => {},
                  bgColor: Color.fromARGB(1, 1, 1, 1),
                  txtColor: Colors.white,
                  shadow: false,
                  add_remove: false,),
              Divider(
                thickness: 4,
                height: 5,
                color: Colors.white60,
                indent: 30,
                endIndent: 30,
              ),
              productCard(
                  icon: Icons.abc,
                  text1: 'Produit1',
                  text2: '12/12/12',
                  text3: '3',
                  text4: '',
                  fct: () => {},
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  add_remove: true,
                  shadow:true),
              productCard(
                  icon: Icons.abc,
                  text1: 'Produitxyzzz',
                  text2: '9/1/23',
                  text3: '7',
                  text4: '',
                  fct: () => {},
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  add_remove: true,
                  shadow:true),
              
              kSizedBox1,
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: welcomeButton(
                    text: "Add",
                    fct: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Inventory_init(),
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
