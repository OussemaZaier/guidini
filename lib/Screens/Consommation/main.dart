import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';

import 'package:guidini/Screens/Inventory_init_show/welcomeButton.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/budget/main.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:guidini/Screens/globals.dart' as globals;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;

class Consommation extends StatefulWidget {
  Consommation({Key? key}) : super(key: key);
  @override
  _ConsommationState createState() => _ConsommationState();
}

class _ConsommationState extends State<Consommation> {
  int qty = 0;
  List<dynamic> ITEMS = [];

  Future<List<Inventory>> fetchInventoryByUserId() async {
    // void fetchInventoryByUserId() async {
    var token = globals.token;
    Map<String, dynamic> userId = Jwt.parseJwt(token);

    print(userId);
    var userIdInDB = userId['id'];
    final response = await http.get(Uri.parse(findInv(userIdInDB)));
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

  void incrementQty() {
    setState(() {
      qty++;
    });
  }

  void decrementQty() {
    if (qty > 0) {
      setState(() {
        qty--;
      });
    }
  }

  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      this.ITEMS = await fetchInventoryByUserId();
      print("------------------------------------");
      print(this.ITEMS[0]);
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
          child: Column(children: [
            title(
                text: 'New cart',
                txtColor: Colors.white,
                bgColor1: kMainGreen,
                bgColor2: Colors.green),
            kSizedBox1,
            kSizedBox1,
            kSizedBox1,
            Text(" What did you consume?",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                )),
            kSizedBox1,
            kSizedBox1,
            Column(
              children: [
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
                kSizedBox1,
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: welcomeButton(
                    text: "Next",
                    fct: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Budget(),
                          ))
                    },
                    bgColor: Colors.white,
                    txtColor: kMainGreen,
                    icon: Icons.arrow_forward_ios_rounded,
                  ),
                )
              ],
            ),
            kSizedBox1,
          ]),
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
