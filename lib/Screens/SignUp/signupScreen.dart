import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Components/keepMe.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:guidini/Screens/SignUp/config.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      // @TODO: DISPLAY RESPONSE MESSAGE
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/greenLogo.png',
                  height: MediaQuery.of(context).size.width / 2.5,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    color: kMainGreen,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kSizedBox1,
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        text: 'First name',
                        pwd: false,
                        placeholder: 'Foulen',
                      ),
                    ),
                    kSizedBox1,
                    Expanded(
                      child: Field(
                        text: 'Last name',
                        pwd: false,
                        placeholder: 'Ben foulen',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: 'Lato',
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "abc@xyz.com",
                          errorText:
                              _isNotValidate ? "Your email is invalid" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          fillColor: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: 'Lato',
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "*********",
                          errorText:
                              _isNotValidate ? "Enter Proper Info" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          fillColor: Colors.white70,
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                welcomeButton(
                    text: 'Scan your fidelty card',
                    fct: () {},
                    bgColor: Colors.grey.shade200,
                    txtColor: Colors.black),
                kSizedBox1,
                KeepMe(text: "Keep me signed in."),
                welcomeButton(
                  text: 'Continue',
                  fct: () {
                    registerUser();
                    if (_isNotValidate == false) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inventory_init(),
                          ));
                    }
                  },
                  bgColor: kMainGreen,
                  txtColor: Colors.white,
                  icon: Icons.arrow_forward_ios,
                ),
                kSizedBox1,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
