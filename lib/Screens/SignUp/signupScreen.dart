import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Components/keepMe.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/globals.dart' as globals;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async {
    print("*******REGISTER USER IN*********");
    globals.token = "";
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      print("NOT EMPTY");
      var regBody = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text
      };
      print("SENDING BODY");
      var response = await http.post(Uri.parse(registration),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print("*******STATUS= $jsonResponse");
      if (jsonResponse['token'] != null) globals.token = jsonResponse['token'];
      print(globals.token);
      if (jsonResponse['token'] != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Inventory_init(),
            ));
      } else {
        final snackBar = SnackBar(
          content: Text(
            'Error: ${jsonResponse['message']}!',
            style: const TextStyle(color: Colors.white, fontSize: 17.0),
          ),
          backgroundColor: (const Color.fromARGB(255, 65, 65, 65)),
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Inventory_init(),
      //     ));
    } else {
      print("THIS B EMPTY");
      final snackBar = SnackBar(
        content: const Text(
          'Please fill all the fields',
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
        backgroundColor: (const Color.fromARGB(255, 65, 65, 65)),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                kSizedBox1,
                kSizedBox1,
                kSizedBox1,
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
                kSizedBox1,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: 'Lato',
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Flen l fouleni",
                          errorText:
                              _isNotValidate ? "Please enter your name" : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          fillColor: Colors.white70,
                        ),
                      ),
                      kSizedBox1,
                      const Text(
                        "Email",
                        style: TextStyle(
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
                      kSizedBox1,
                      const Text(
                        "Password",
                        style: TextStyle(
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
                    // if (_isNotValidate == false) {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Inventory_init(),
                    //     ));
                  },
                  // },
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
