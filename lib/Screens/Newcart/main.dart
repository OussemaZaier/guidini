import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Inventory_init_show/welcomeButton.dart';
import 'package:guidini/Screens/budget/main.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class Newcart extends StatelessWidget {
  Newcart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            title(
                text: 'New Cart',
                txtColor: Colors.white,
                bgColor1: kMainGreen,
                bgColor2: Colors.green),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                children: [
                  kSizedBox1,
                  productCard(
                      text1: 'Product1',
                      text2: '3DT ',
                      quantity: 3,
                      text4: '',
                      fct: () {},
                      bgColor: Colors.white,
                      txtColor: Colors.black,
                      shadow: true,
                      add_remove: true,
                      text3: '',
                      icon: Icons.shop),
                  Divider(
                    thickness: 4,
                    height: 5,
                    color: Colors.white60,
                    indent: 30,
                    endIndent: 30,
                  ),
                  productCard(
                      text1: 'Product2',
                      text2: '6Dt ',
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
                      text2: '4Dt ',
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
                      text1: 'Product4',
                      text2: '5Dt ',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '18Dt',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
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
                      txtColor: kMainGreen,
                      icon: Icons.add,
                    ),
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
                      txtColor: kMainGreen,
                      icon: Icons.check,
                    ),
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
