import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';

import 'package:guidini/Screens/Inventory_init_show/welcomeButton.dart';
import 'package:guidini/Screens/budget/main.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';

class Consommation extends StatefulWidget {
  Consommation({Key? key}) : super(key: key);
  @override
  _ConsommationState createState() => _ConsommationState();
}

class _ConsommationState extends State<Consommation> {
  int qty = 0;

  void incrementQty() {
    setState(() {
      qty++;
    });
  }

  void decrementQty() {
    if (qty > 0) {
      setState(() {
        qty--;
      });
    }
  }

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
              bgColor1: kMainGreen,
              bgColor2: Colors.green),
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
              Divider(
                thickness: 4,
                height: 5,
                color: Colors.white60,
                indent: 30,
                endIndent: 30,
              ),
              productCard(
                  text1: 'Product2',
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
