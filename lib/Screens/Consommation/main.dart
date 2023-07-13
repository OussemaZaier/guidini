import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';

import 'package:guidini/Screens/Inventory_init_show/welcomeButton.dart';
import 'package:guidini/Screens/budget/main.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';

class Consommation extends StatelessWidget {
  Consommation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          title(
              text: 'New cart',
              txtColor: Colors.white,
              bgColor1: Colors.green,
              bgColor2: kMainGreen),
          kSizedBox1,
          kSizedBox1,
          kSizedBox1,
          Text(" What did you consume?",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              )),
          Column(
            children: [
              productCard(
                text1: '  Product',
                text2: ' ',
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
                text2: ' ',
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
                text2: ' ',
                text3: '7',
                text4: '',
                fct: () => {},
                bgColor: Colors.white,
                txtColor: Colors.black,
                add_remove: true,
                shadow: true,
              ),
              kSizedBox1,
              kSizedBox1,
              kSizedBox1,
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: welcomeButton(
                  text: "Next",
                  fct: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Budget(),
                        ))
                  },
                  bgColor: Colors.white,
                  txtColor: kMainGreen,
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              )
            ],
          ),
          kSizedBox1,
        ]),
      ),
    );
  }
}
