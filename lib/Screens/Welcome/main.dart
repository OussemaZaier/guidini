import 'package:flutter/material.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/utils/constants.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kMainGreen,
            Color(0xFF118E38),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/whiteLogo.png',
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width / 2,
          ),
          const Text(
            'A sustainable',
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
                text: 'Sign up',
                fct: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
              ),
              welcomeButton(
                text: 'Sign in',
                fct: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class welcomeButton extends StatelessWidget {
  welcomeButton({Key? key, required this.text, required this.fct})
      : super(key: key);
  String text;
  VoidCallback fct;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fct,
      child: Container(
        height: 40,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: kMainGreen,
            fontFamily: 'Lato',
          ),
        )),
      ),
    );
  }
}
