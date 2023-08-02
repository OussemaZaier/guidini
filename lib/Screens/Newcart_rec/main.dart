import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Inventory_init_show/welcomeButton.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/budget/main.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:guidini/Screens/globals.dart' as globals;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;

class Newcart_rec extends StatelessWidget {
  Newcart_rec({Key? key, required this.items}) : super(key: key);
  List<dynamic> items = [];

  void testing() {
    print(items);
    print(items[0][0]);
  }

  void addToInv() async {
    print("*******ADDING PRODUCT*********");
    var token = globals.token;

    print(globals.token);

    Map<String, dynamic> userId = Jwt.parseJwt(token);

    for (var i in items) {
      var regBody = {
        "productname": i[0],
        "brand": "x",
        "quantity": i[1].toString(),
        "user": userId,
      };

      var response = await http.post(Uri.parse(getInv(userId['id'])),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print("*******STATUS= " + jsonResponse.toString());

      if (jsonResponse['_id'] != null) {
        print("ITEM CREATED SUCCESSFULLY");
        print(jsonResponse['_id']);
      }
      // Navigator.push(
      //     context,}
      //     MaterialPageRoute(
      //       builder: (context) => Inventory_init(),
      //     ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              title(
                  text: 'New Cart',
                  txtColor: Colors.white,
                  bgColor1: kMainGreen,
                  bgColor2: Colors.green),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        kSizedBox1,
                        Divider(
                          thickness: 4,
                          height: 5,
                          color: Colors.white60,
                          indent: 30,
                          endIndent: 30,
                        ),
                        kSizedBox1,
                        if (items.isNotEmpty)
                          for (var i in items)
                            productCard(
                                icon: Icons.shop,
                                text1: i[0],
                                text2: i[1].toString(),
                                text3: 'text3',
                                text4: 'text4',
                                fct: () => {},
                                bgColor: Colors.white,
                                txtColor: Colors.black,
                                shadow: true,
                                add_remove: false,
                                quantity: -1),
                        kSizedBox1,
                        kSizedBox1,
                        kSizedBox1,
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                            text: "Add",
                            fct: () => {
                              print(this.items),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Inventory_add(destination:-1),
                                  ))
                            },
                            bgColor: Colors.white,
                            txtColor: kMainGreen,
                            icon: Icons.add,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                            text: "Finish",
                            fct: () => {
                              addToInv(),
                              print("ADD DONE****"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Navigation(),
                                  ))
                            },
                            bgColor: Colors.white,
                            txtColor: kMainGreen,
                            icon: Icons.check,
                          ),
                        )
                      ],
                    ),
                    kSizedBox1,
                    kSizedBox1,
                    kSizedBox1,
                    kSizedBox1,
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
