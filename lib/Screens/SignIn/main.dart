import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Screens/SignIn/keepMeWidget.dart';
import 'package:guidini/utils/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/greenLogo.png',
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  color: kMainGreen,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Field(
                text: 'Email address',
                pwd: false,
              ),
              Field(
                text: 'Password',
                pwd: true,
              ),
              KeepMe(),
            ],
          ),
        ),
      ),
    );
  }
}
