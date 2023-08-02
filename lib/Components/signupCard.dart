import 'package:flutter/material.dart';

class signUpWithCard extends StatelessWidget {
  signUpWithCard({
    super.key,
    required this.title,
    required this.icon,
  });
  String title;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black54,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black87,
                size: 50,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Lato',
                  fontSize: 18,
                ),
              ),
            ],
          )),
    );
  }
}
