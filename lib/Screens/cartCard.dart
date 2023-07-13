import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guidini/utils/constants.dart';

class cartCard extends StatelessWidget {
  cartCard({
    Key? key,
    required this.title,
    required this.topText,
    required this.bgColor1,
    required this.bgColor2,
    required this.buttonFct,
    required this.buttonText,
  }) : super(key: key);
  String title;
  String topText;
  String buttonText;
  VoidCallback buttonFct;
  Color bgColor1;
  Color bgColor2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        bottom: 10.0,
        right: 10.0,
      ),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(1, 1),
                  radius: 2,
                  colors: <Color>[
                    bgColor1,
                    bgColor2,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                  begin: Alignment.topRight,
                  end: Alignment.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topText,
                    style: TextStyle(
                      color: Color.fromARGB(144, 255, 255, 255),
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 25.0,
                    ),
                  ),
                  kSizedBox1,
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
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
