import 'package:flutter/material.dart';
import 'package:guidini/utils/constants.dart';

class welcomeButton extends StatelessWidget {
  welcomeButton({
    Key? key,
    required this.text,
    required this.fct,
    this.icon,
    required this.bgColor,
    required this.txtColor,
  }) : super(key: key);
  String text;
  IconData? icon;
  VoidCallback fct;
  Color bgColor;
  Color txtColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fct,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: txtColor,
                fontFamily: 'Lato',
              ),
            ),
            (icon != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      icon,
                      color: txtColor,
                      size: 20.0,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
