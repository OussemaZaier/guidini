import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/Profile/main.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:guidini/Screens/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class Inventory_show extends StatefulWidget {
  Inventory_show({Key? key}) : super(key: key);
  @override
  _Inventory_showState createState() => _Inventory_showState();
}

class _Inventory_showState extends State<Inventory_show> {
  List<dynamic> ITEMS = [];

  Future<List<Inventory>> fetchInventoryByUserId() async {
    // void fetchInventoryByUserId() async {
    var token = globals.token;
    Map<String, dynamic> userId = Jwt.parseJwt(token);

    print(userId);
    var userIdInDB = userId['id'];
    print("Sending request");
    final response = await http.get(Uri.parse(findInv(userIdInDB)));
    print("Request sent successfully");
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      print(responseData);
      List<Inventory> inventories =
          responseData.map((data) => Inventory.fromJson(data)).toList();
      return inventories;
      // return inventories;
    } else {
      throw Exception('Failed to load inventory');
    }
  }

  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      this.ITEMS = await fetchInventoryByUserId();
      print("------------------------------------");
      setState(() {
        this.ITEMS;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 237, 237, 237),
              ],
              center: Alignment(-1, -1),
              radius: 3.0,
            ),
          ),
          child: Column(
            children: [
              title(
                bgColor2: kMainGreen,
                bgColor1: Color.fromARGB(255, 16, 161, 31),
                text: 'Inventory',
                txtColor: Colors.white,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        kSizedBox1,
                        kSizedBox1,
                        for (var i in ITEMS)
                          productCard(
                            text1: i.productName,
                            text2: i.brand,
                            quantity: int.parse(i.quantity),
                            text4: '',
                            icon: Icons.abc,
                            fct: () {},
                            bgColor: Colors.white,
                            txtColor: Colors.black,
                            shadow: true,
                            add_remove: true,
                            text3: '',
                          ),
                        kSizedBox1,
                        kSizedBox1,
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                              text: "Add",
                              fct: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Inventory_add(),
                                        ))
                                  },
                              bgColor: Colors.white,
                              txtColor: Colors.black,
                              icon: Icons.add),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                              text: "Finish",
                              fct: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Navigation(
                                            pageNumber: 4,
                                          ),
                                        ))
                                  },
                              bgColor: Colors.white,
                              txtColor: Colors.black,
                              icon: Icons.arrow_forward_ios_rounded),
                        )
                      ],
                    ),
                    kSizedBox1,
                    kSizedBox1,
                    kSizedBox1,
                    kSizedBox1,
                  ]),
              kSizedBox1,
            ],
          ),
        ),
      ),
    );
  }
}

class Inventory {
  final String id;
  final String productName;
  final String brand;
  final String quantity;
  // Ajoutez d'autres champs ici en fonction de la réponse de votre API
  Inventory(
      {required this.id,
      required this.productName,
      required this.brand,
      required this.quantity});
  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json['_id'],
      productName: json['productname'],
      brand: json['brand'],
      quantity: json['quantity'],
      // Ajoutez d'autres champs ici en fonction de la réponse de votre API
    );
  }
}
