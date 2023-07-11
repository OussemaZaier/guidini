import 'package:flutter/material.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';

class description extends StatelessWidget {
  description({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 7, 141, 14),
              Color.fromARGB(255, 62, 193, 84),
            ],
            center: Alignment(1, -1), // near the top right
            radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/whiteLogo.png',
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                // Image.asset(
                //   'assets/images/whiteLogo.png',
                //   height: MediaQuery.of(context).size.width / 2,
                //   width: MediaQuery.of(context).size.width / 2,
                // ),
              ],
            ),
            Text(
              "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                welcomeButton(
                  text: "Scan my last receipt",
                  fct: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ) // @TODO: CHANGEME TO CAMERA
                        )
                  },
                  bgColor: Colors.white,
                  txtColor: kMainGreen,
                  icon: Icons.receipt_long_outlined,
                ),
                welcomeButton(
                    text: "Enter manually",
                    fct: () => {},
                    bgColor: Colors.white,
                    txtColor: kMainGreen,
                    icon: Icons.keyboard)
              ],
            ),
            InkWell(
              child: Text(
                'Skip for now',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 209, 209, 209),
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignIn(), // @TODO: CHANGEME TO HOMEPAGE
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
