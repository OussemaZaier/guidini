import 'package:flutter/material.dart';

class welcomeButton extends StatefulWidget {
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
  State<welcomeButton> createState() => _welcomeButtonState();
}

class _welcomeButtonState extends State<welcomeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.fct(),
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(70, 0, 0, 0),
              blurRadius: 6,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
                color: widget.txtColor,
                fontFamily: 'Lato',
              ),
            ),
            (widget.icon != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      widget.icon,
                      color: widget.txtColor,
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
