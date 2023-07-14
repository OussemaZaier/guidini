import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Screens/Newcart/main.dart';

import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/counter/ProductItemState.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _SignUpState();
}

TextEditingController myController = TextEditingController();

class _SignUpState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              title(
                  text: 'Budget',
                  txtColor: Colors.white,
                  bgColor1: kMainGreen,
                  bgColor2: Colors.green),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    kSizedBox1,
                    kSizedBox1,

                    SizedBox(
                        height:
                            5.0), // Utilise SizedBox ici au lieu de kSizedBox1

                    Field(
                      text: 'Enter Your Budget',
                      pwd: false,
                      placeholder: '170 TND ',
                      myController: myController,
                    ),

                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      welcomeButton(
                          text: "   25DT   ",
                          fct: () => {
                                setState(() {
                                  myController.text = '20 TND';
                                })
                              },
                          bgColor: Colors.white,
                          txtColor: Colors.black),
                      welcomeButton(
                          text: "   50DT   ",
                          fct: () => {
                                setState(() {
                                  myController.text = '50 TND';
                                })
                              },
                          bgColor: Colors.white,
                          txtColor: Colors.black),
                      welcomeButton(
                        text: "   100DT   ",
                        fct: () => {
                          setState(() {
                            myController.text = '100 TND';
                          })
                        },
                        bgColor: Colors.white,
                        txtColor: Colors.black,
                      )
                    ]),

                    welcomeButton(
                      text: 'Get Your Cart',
                      fct: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Newcart(),
                          ),
                        );
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),
                    SizedBox(height: 40.0),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Already Shopped?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Lato',
                          ),
                        )),
                    welcomeButton(
                      text: 'Scan your Receipt',
                      fct: () {},
                      bgColor: Colors.grey,
                      txtColor: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),

                    // Utilise SizedBox ici au lieu de kSizedBox1
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class signUpWithCard extends StatelessWidget {
  signUpWithCard({
    Key? key, // Ajoutez Key? ici pour corriger l'erreur
    required this.title,
    required this.icon,
  });

  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black87,
              size: 50,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Lato',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
