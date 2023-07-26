import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_add/main.dart';
import 'package:guidini/Screens/Inventory_init_choice/welcomeButton.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:guidini/Screens/globals.dart' as globals;

class Inventory_init_show extends StatefulWidget {
  const Inventory_init_show({Key? key}) : super(key: key);

  @override
  State<Inventory_init_show> createState() => _Inventory_init_showState();
}

class _Inventory_init_showState extends State<Inventory_init_show> {
  late Future fetchedInventory;
  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    fetchedInventory = fetchInventory();
  }

  Future fetchInventory() async {
    var token = globals.token;

    Map<String, dynamic> payload = Jwt.parseJwt(token);

    var userResponse = await http.get(
      Uri.parse(getUser(payload['id'])),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
    print(jsonDecode(userResponse.body));
    return jsonDecode(userResponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchedInventory,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF118b44),
                    kMainGreen,
                  ],
                  center: Alignment(-1, -1),
                  radius: 3.0,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                            height: MediaQuery.of(context).size.height / 4,
                            width: MediaQuery.of(context).size.width / 4,
                            'assets/images/whiteLogo.png'),
                        const Text('Inventory',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            )),
                        kSizedBox1,
                        productCard(
                          text1: 'Product1',
                          text2: ' ',
                          quantity: 3,
                          text4: '',
                          fct: () {},
                          bgColor: Colors.white,
                          txtColor: Colors.black,
                          shadow: true,
                          add_remove: true,
                          text3: '',
                          icon: Icons.shop,
                        ),
                        productCard(
                            text1: 'Product2',
                            text2: '',
                            quantity: 3,
                            text4: '',
                            fct: () {},
                            bgColor: Colors.white,
                            txtColor: Colors.black,
                            shadow: true,
                            add_remove: true,
                            text3: '',
                            icon: Icons.shop),
                        productCard(
                            text1: 'Product3',
                            text2: ' ',
                            quantity: 3,
                            text4: '',
                            fct: () {},
                            bgColor: Colors.white,
                            txtColor: Colors.black,
                            shadow: true,
                            add_remove: true,
                            text3: '',
                            icon: Icons.shop),
                        kSizedBox1,
                        kSizedBox1,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                              text: "Addd",
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: welcomeButton(
                              text: "Finish",
                              fct: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Navigation(),
                                        ))
                                  },
                              bgColor: Colors.white,
                              txtColor: Colors.black,
                              icon: Icons.arrow_forward_ios_rounded),
                        )
                      ],
                    ),
                    kSizedBox1,
                    // Text(
                    //   snapshot.data!.toString(),
                    // ),
                  ]));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ));
  }
}
