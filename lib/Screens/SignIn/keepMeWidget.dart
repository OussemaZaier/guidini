import 'package:flutter/material.dart';
import 'package:guidini/utils/constants.dart';

class KeepMe extends StatefulWidget {
  const KeepMe({Key? key}) : super(key: key);
  @override
  State<KeepMe> createState() => _KeepMeState();
}

class _KeepMeState extends State<KeepMe> {
  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _clicked ? _clicked = false : _clicked = true;
            });
          },
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
                width: 0.5,
              ),
              color: _clicked ? kMainGreen : Colors.white,
            ),
            child: Visibility(
              visible: _clicked,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Keep me signed in.',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
