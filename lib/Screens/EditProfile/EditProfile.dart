import 'package:flutter/material.dart';
import 'package:guidini/Components/field.dart';
import 'package:guidini/Components/signupCard.dart';
import 'package:guidini/Components/keepMe.dart';
import 'package:guidini/Screens/Profile/main.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditState();
}

TextEditingController myController1 = TextEditingController();
TextEditingController myController2 = TextEditingController();
TextEditingController myController3 = TextEditingController();

class _EditState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              title(
                bgColor2: kMainGreen,
                bgColor1: Color.fromARGB(255, 16, 161, 31),
                text: 'Edit profile',
                txtColor: Colors.white,
              ),
              kSizedBox1,
              kSizedBox1,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Field(
                      text: 'New name',
                      pwd: false,
                      placeholder: 'Flen el fouleni',
                      myController: myController1,
                    ),
                    kSizedBox1,
                    Field(
                      text: 'New email address',
                      pwd: false,
                      placeholder: 'abc@xyz.com',
                      myController: myController2,
                    ),
                    kSizedBox1,
                    Field(
                      text: 'New password',
                      pwd: true,
                      placeholder: '********',
                      myController: myController3,
                    ),
                    kSizedBox1,
                    welcomeButton(
                      text: 'Save changes',
                      fct: () {
                        Navigator.pop(context);
                      },
                      bgColor: kMainGreen,
                      txtColor: Colors.white,
                    ),
                    kSizedBox1,
                    kSizedBox1,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
