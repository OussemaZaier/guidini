import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Screens/SignIn/keepMeWidget.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Field(
                        text: 'Last name',
                        pwd: false,
                        placeholder: 'Ben foulen',
                      ),
                    ),
                  ],
                ),
                Field(
                  text: 'Email',
                  pwd: false,
                  placeholder: 'abc@xyz.com',
                ),
                Field(
                  text: 'Password',
                  pwd: true,
                  placeholder: '********',
                ),
                Field(
                  text: 'Confirm password',
                  pwd: true,
                  placeholder: '********',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inventory_init(title: ''),
                          ));
                    },
                    bgColor: kMainGreen,
                    txtColor: Colors.white,
                    icon: Icons.arrow_forward_ios),
                kSizedBox1,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                style: TextStyle(
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
