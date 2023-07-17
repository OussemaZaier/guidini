import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Components/signupCard.dart';
import 'package:guidini/Components/keepMe.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/utils/constants.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  void loginUser() async {
    print("*******REGISTER USER IN*********");
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      print("NOT EMPTY");
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };

      var response = await http.post(Uri.parse(login),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print("*******STATUS= " + jsonResponse.toString());

      if (jsonResponse['statusCode'] != 401) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Inventory_init(),
      //     ));
    } else {
      print("THIS B EMPTY");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/greenLogo.png',
                  height: MediaQuery.of(context).size.width / 2.5,
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
                  placeholder: 'abc@xyz.com',
                  myController: emailController,
                ),
                Field(
                  text: 'Password',
                  pwd: true,
                  placeholder: '********',
                  myController: passwordController,
                ),
                KeepMe(text: "Remember me."),
                kSizedBox1,
                welcomeButton(
                  text: 'Login',
                  fct: () {
                    loginUser();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Navigation()));
                  },
                  bgColor: kMainGreen,
                  txtColor: Colors.white,
                ),
                kSizedBox1,
                Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Divider(
                          color: kMainGreen,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                    Text(
                      'or sign up with',
                      style: TextStyle(
                        fontSize: 18,
                        color: kMainGreen,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Divider(
                          color: kMainGreen,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                kSizedBox1,
                Row(
                  children: [
                    Expanded(
                      child: signUpWithCard(
                        icon: Icons.g_mobiledata,
                        title: 'Google',
                      ),
                    ),
                    kSizedBox1,
                    Expanded(
                      child: signUpWithCard(
                        icon: Icons.facebook,
                        title: 'Facebook',
                      ),
                    ),
                  ],
                ),
                kSizedBox1,
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: ' Sign up here',
                          style: TextStyle(
                            fontSize: 16,
                            color: kMainGreen,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
