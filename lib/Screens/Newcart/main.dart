import 'package:flutter/material.dart';
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
                    text1: '  Product',
                    text2: 'Price ',
                    text3: 'Qty',
                    text4: '',
                    fct: () => {},
                    bgColor: Color.fromARGB(1, 1, 1, 1),
                    txtColor: Colors.black,
                    add_remove: false,
                    shadow: false,
                  ),
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
                    text2: '2.500 ',
                    text3: '3',
                    text4: '',
                    fct: () => {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    add_remove: true,
                    shadow: true,
                  ),
                  productCard(
                    icon: Icons.abc,
                    text1: 'Produitxyzzz',
                    text2: '7.500 ',
                    text3: '7',
                    text4: '2.500',
                    fct: () => {},
                    bgColor: Colors.white,
                    txtColor: Colors.black,
                    add_remove: true,
                    shadow: true,
                  ),
                  kSizedBox1,
                  kSizedBox1,
                  productCard(
                    text1: '  Total',
                    text2: '       ',
                    text3: '11 DT',
                    text4: '',
                    fct: () => {},
                    bgColor: Color.fromARGB(1, 1, 1, 1),
                    txtColor: Colors.black,
                    add_remove: false,
                    shadow: false,
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
                      txtColor: kMainGreen,
                      icon: Icons.add,
                    ),
                  ),
                  kSizedBox1,
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
