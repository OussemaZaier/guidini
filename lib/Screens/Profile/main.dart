import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidini/Screens/EditProfile/EditProfile.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_show/main.dart';
import 'package:guidini/Screens/Old_Cart_Detail/main.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/cartCard.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:guidini/Screens/globals.dart' as globals;

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<dynamic, dynamic>? USERDATA;
  Future<Map> getData() async {
    print("*****************GETTING DATA*****************");

    // if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    // print("NOT EMPTY:" + emailController.text + " " + passwordController.text);
    // var regBody = {
    //   "email": emailController.text,
    //   "password": passwordController.text
    // };

    // var response = await http.post(Uri.parse(login),
    //     headers: {
    //       "Accept": "application/json",
    //       "Content-Type": "application/json"
    //     },
    //     body: jsonEncode(regBody));

    // var jsonResponse = jsonDecode(response.body);

    // final token = jsonResponse['token'];
    var token = globals.token;

    print(globals.token);

    Map<String, dynamic> payload = Jwt.parseJwt(token);

    var userResponse = await http.get(
      Uri.parse(getUser(payload['id'])),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    var jsonUserResponse = jsonDecode(userResponse.body);

    return {
      'name': jsonUserResponse['name'],
      'points': jsonUserResponse['points']
    };
    // }
    // ;
    // print("NO EMAIL/PW DATA!!!!!");
    // return {"ERROR": "ERROR", "name": "ERROR", "points": "ERROR"};
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      this.USERDATA = await getData();
      setState(() {
        this.USERDATA;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 244, 244, 244),
              Color.fromARGB(255, 230, 235, 231),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  title(
                    bgColor2: kMainGreen,
                    bgColor1: Color.fromARGB(255, 16, 161, 31),
                    text: 'Profile',
                    txtColor: Colors.white,
                  ),
                  kSizedBox1,
                  kSizedBox1,
                  Text(USERDATA?["name"] ?? '',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      ("${USERDATA?["points"]} points") ?? "loading...",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: welcomeButton(
                      text: "Edit profile",
                      fct: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        ),
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: welcomeButton(
                      text: "View inventory",
                      fct: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Inventory_show()))
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                    ),
                  ),
                ],
              ),
              kSizedBox1,
              kSizedBox1,
              // v _______ Previous carts + savings _______ v
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Previous carts",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    kSizedBox1,
                    cartCard(
                        title: "13 Jul. 2023 \n You saved 61.00 DT",
                        topText: '',
                        bgColor1: Color(0XFF123456),
                        bgColor2: Colors.blue,
                        buttonFct: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Old_Cart_Detail(
                                            date: "13 Jul. 2023",
                                            bgColor1: Color(0XFF123456),
                                            bgColor2: Colors.blue,
                                          )))
                            },
                        buttonText: 'View details'),
                    cartCard(
                        title: "7 Jun. 2023 \n You saved 79.00 DT",
                        topText: '',
                        bgColor1: Color.fromARGB(255, 18, 140, 69),
                        bgColor2: const Color.fromARGB(255, 93, 243, 33),
                        buttonFct: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Old_Cart_Detail(
                                            date: "7 Jun. 2023",
                                            bgColor1: Color.fromARGB(
                                                255, 18, 140, 69),
                                            bgColor2: const Color.fromARGB(
                                                255, 93, 243, 33),
                                          )))
                            },
                        buttonText: 'View details'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
