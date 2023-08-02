import 'package:flutter/material.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/introScreen.dart';
import 'package:guidini/utils/constants.dart';

class Inventory_init extends StatelessWidget {
  Inventory_init({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Welcome(
        title: 'Welcome, \n Let\'s get started!',
        child: welcomeButton(
          text: "Next",
          fct: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => intro(
                  title:
                      'We recommend a cart based on your budget, and encourage you to make economical and sustainable purchases.',
                  img: 'cart.png',
                  type: 'Smart Cart',
                  fct: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => intro(
                          title:
                              'We recommend a recipe with available ingredients to prevent them from expiring.',
                          img: 'receipe.png',
                          type: 'Recipe',
                          fct: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => intro(
                                  title:
                                      'We recommend promotions based on your purchase history and inventory.',
                                  img: 'promo.png',
                                  type: 'Promotion',
                                  fct: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Inventory_init_choice(),
                                        ))
                                  },
                                ),
                              ),
                            ),
                          },
                        ),
                      ),
                    ),
                  },
                ),
              ),
            ),
          },
          bgColor: Colors.white,
          txtColor: kMainGreen,
        ));
  }
}
