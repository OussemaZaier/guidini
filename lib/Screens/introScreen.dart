import 'package:flutter/material.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';

class intro extends StatelessWidget {
  intro(
      {Key? key,
      required this.title,
      required this.img,
      required this.type,
      required this.fct})
      : super(key: key);
  String title;
  String type;
  String img;
  VoidCallback fct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
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
                'assets/images/$img',
              ), // <-- SEE HERE
              Text(
                type,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  title,
                  style: const TextStyle(
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
                  fct: fct,
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
