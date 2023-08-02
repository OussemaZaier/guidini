import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guidini/utils/constants.dart';

class redeemCard extends StatelessWidget {
  redeemCard({
    Key? key,
    required this.imageurl,
    required this.textcolor,
    required this.title,
    required this.subtext,
    required this.bgColor,
    required this.buttonFct,
    required this.buttonText,
  }) : super(key: key);
  String imageurl;
  String title;
  String subtext;
  String buttonText;
  VoidCallback buttonFct;
  Color bgColor;
  Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        bottom: 10.0,
        right: 10.0,
      ),
      child: Container(
        height: 340,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(imageurl, fit: BoxFit.fill).image,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: textcolor,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    subtext,
                    style: TextStyle(
                      color: Color.fromARGB(144, 60, 60, 60),
                      fontFamily: 'Lato',
                    ),
                  ),
                  kSizedBox1,
                  InkWell(
                    onTap: () => buttonFct(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kMainGreen,
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 14.0, bottom: 14.0),
                      child: Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
