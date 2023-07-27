import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/Newcart/main.dart';
import 'package:guidini/Screens/Newcart_rec/main.dart';
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

class Inventory_show_recommendation extends StatefulWidget {
  Inventory_show_recommendation({Key? key, required this.items})
      : super(key: key);
  List<dynamic> items = [];

  getItems() {
    return items;
  }

  @override
  State<Inventory_show_recommendation> createState() =>
      _Inventory_show_recommendationState();
}

List<dynamic> cart = [];

class _Inventory_show_recommendationState
    extends State<Inventory_show_recommendation> {
  TextEditingController _similarController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void testing() {
    print(widget.items);
  }

  Future<int> getQuantity(String i) async {
    print("month_cons:" + _quantityController.text);
    print("inventory:" + _similarController.text);
    print("product:" + i);

    if (_quantityController.text.isEmpty || _similarController.text.isEmpty)
      return -1;

    var responseQuantity = await http.post(
        Uri.parse('http://10.217.8.139:8003/predict'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "month_cons": _similarController.text,
          "inventory": _quantityController.text,
          "product": i
        }));

    var jsonResponse = jsonDecode(responseQuantity.body);
    print("*******QUANTITY= ");
    if (jsonResponse['predicted_rec_qte'].round() > 0) {
      print("SUCCESSSSS");
      cart.add([i, jsonResponse['predicted_rec_qte'].round()]);
      print("CART=======");
      print(cart);
      return jsonResponse['predicted_rec_qte'].round();
    } else
      print("FAILLLLL");
    print(jsonResponse['predicted_rec_qte']);

    return jsonResponse['predicted_rec_qte'].round();
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
                text: 'New cart',
                txtColor: Colors.white,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        kSizedBox1,
                        kSizedBox1,
                        Text("Recommended items",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato')),
                        kSizedBox1,
                        for (var i in widget.items)
                          productCard(
                            text1: i,
                            text2: '',
                            quantity: -1,
                            text4: '',
                            icon: Icons.abc,
                            fct: () {
                              _quantityController.clear();
                              _similarController.clear();
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        title: Text(
                                            i + '\nPlease fill out these fields',
                                            style: TextStyle(
                                              fontSize: 24,
                                            )),
                                        content: Form(
                                          child: Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                kSizedBox1,
                                                kSizedBox1,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Monthly consumption",
                                                      style: TextStyle(
                                                        fontSize: 21,
                                                      ),
                                                    ),
                                                    kSizedBox1,
                                                    SizedBox(
                                                      width: 50,
                                                      child: TextFormField(
                                                          controller:
                                                              _similarController),
                                                    ),
                                                  ],
                                                ),
                                                kSizedBox1,
                                                kSizedBox1,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Quantity in inventory",
                                                      style: TextStyle(
                                                        fontSize: 21,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                      child: TextFormField(
                                                        controller:
                                                            _quantityController,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                var quantity =
                                                    await getQuantity(i);
                                                Navigator.pop(context);

                                                if (quantity > 0)
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          title:
                                                              Text("Success"),
                                                          content: Text(
                                                              "Recommended quantity: " +
                                                                  quantity
                                                                      .toString()),
                                                        );
                                                      });
                                                else
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          title: Text("Fail"),
                                                          content: Text(
                                                              "You don't need this product at this moment!"),
                                                        );
                                                      });
                                              },
                                              child: Text('OK')),
                                        ],
                                      ));
                            },
                            bgColor: Colors.white,
                            txtColor: Colors.black,
                            shadow: true,
                            add_remove: false,
                            text3: '',
                          ),
                        kSizedBox1,
                        kSizedBox1,
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                              text: "Finish",
                              fct: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Newcart_rec(
                                            items: cart,
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

class ITEMS {
  final List<dynamic> items = [];
  // Ajoutez d'autres champs ici en fonction de la réponse de votre API
}
