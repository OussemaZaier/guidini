import 'dart:convert';

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
  Newcart({Key? key, required this.items}) : super(key: key);
  List<dynamic> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              title(
                  text: 'New Cart',
                  txtColor: Colors.white,
                  bgColor1: kMainGreen,
                  bgColor2: Colors.green),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        kSizedBox1,
                        Divider(
                          thickness: 4,
                          height: 5,
                          color: Colors.white60,
                          indent: 30,
                          endIndent: 30,
                        ),
                        kSizedBox1,
                        for (var i in jsonDecode(items[0]))
                          productCard(
                              icon: Icons.shop,
                              text1: i[0],
                              text2: i[1] + " DT",
                              text3: 'text3',
                              text4: 'text4',
                              fct: () => {},
                              bgColor: Colors.white,
                              txtColor: Colors.black,
                              shadow: true,
                              add_remove: false,
                              quantity: -1),
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
                              items[1].toString(),
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
                              print(this.items),
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
                    kSizedBox1,
                    kSizedBox1,
                    kSizedBox1,
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
