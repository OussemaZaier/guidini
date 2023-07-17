import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:blur/blur.dart';

class Recipe_detail extends StatelessWidget {
  const Recipe_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      kSizedBox1,
                      kSizedBox1,
                      kSizedBox1,
                      kSizedBox1,
                      kSizedBox1,
                      kSizedBox1,
                      RecipeCard(
                        bg: 'assets/images/pizza.jpg',
                      ),
                      kSizedBox1,
                      Text(
                        'Pizza napolitana',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lato',
                        ),
                      ),
                      kSizedBox1,
                      Center(
                          child: Text(
                        'As its name indicates it, the Neapolitan pizza is originally from Naples, Italy, the cumbr of the pizza. The ingredients that characterize it are the tomato sauce, abundant cheese and fresh tomato rods.',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                        ),
                      )),
                      kSizedBox1,
                      Text('Ingredients',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Lato',
                          )),
                    ],
                  ),
                ),
                productCard(
                  text1: 'Tomato',
                  text2: '',
                  text3: '',
                  text4: '',
                  icon: Icons.add,
                  fct: () => {},
                  txtColor: Colors.black,
                  bgColor: Colors.white,
                  add_remove: false,
                  shadow: true,
                  quantity: 3,
                ),
                productCard(
                  text1: 'Cheese',
                  text2: '',
                  text3: '',
                  text4: '',
                  icon: Icons.add,
                  fct: () => {},
                  txtColor: Colors.black,
                  bgColor: Colors.white,
                  add_remove: false,
                  shadow: true,
                  quantity: 3,
                ),
                productCard(
                  text1: 'Flour',
                  text2: '',
                  text3: '',
                  text4: '',
                  icon: Icons.add,
                  fct: () => {},
                  txtColor: Colors.black,
                  bgColor: Colors.white,
                  add_remove: false,
                  shadow: true,
                  quantity: 3,
                ),
                kSizedBox1,
                kSizedBox1,
                kSizedBox1,
                kSizedBox1,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  RecipeCard({
    Key? key,
    required this.bg,
  }) : super(key: key);

  String bg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 00.0,
        bottom: 10.0,
        right: 00.0,
      ),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 9,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            )),
            Container(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  kSizedBox1,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
