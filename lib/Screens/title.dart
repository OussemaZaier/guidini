import 'package:flutter/material.dart';
import 'package:guidini/utils/constants.dart';

class title extends StatelessWidget {
  title({
    Key? key,
    required this.text,
    required this.txtColor,
    required this.bgColor1,
    required this.bgColor2,
  }) : super(key: key);
  String text;
  Color bgColor1;
  Color bgColor2;
  Color txtColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              bgColor1,
              bgColor2,
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(text,
                    style: TextStyle(
                      fontSize: 40,
                      color: txtColor,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]),
      ),
    );
  }
}
