import 'package:flutter/material.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';

class promo extends StatelessWidget {
  promo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 244, 244, 244),
              Color.fromARGB(255, 230, 235, 231),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: [
              Image.asset(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  'assets/images/blackLogo.png'),
              Image.asset(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 2.5,
                  'assets/images/promo.png'), // <-- SEE HERE
              Text('Promotion',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'We recommend promotions based on your purchase history and inventory.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              welcomeButton(
                  text: "Next",
                  fct: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ))
                      },
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  icon: Icons.arrow_forward_ios_rounded)
            ],
          ),
          kSizedBox1,
        ]),
      ),
    );
  }
}
