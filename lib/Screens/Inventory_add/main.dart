import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/main.dart';
import 'package:guidini/Screens/Inventory_show/main.dart';
import 'package:guidini/Screens/Profile/main.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:guidini/Screens/globals.dart' as globals;

class Inventory_add extends StatefulWidget {
  Inventory_add({Key? key, required this.destination}) : super(key: key);

  int destination = -1;
  @override
  State<Inventory_add> createState() => _Inventory_addState();
}

class _Inventory_addState extends State<Inventory_add> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  bool _isNotValidate = false;

  void addProduct() async {
    print("*******ADDING PRODUCT*********");
    var token = globals.token;

    print(globals.token);

    Map<String, dynamic> userId = Jwt.parseJwt(token);

    if (productNameController.text.isNotEmpty &&
        quantityController.text.isNotEmpty &&
        brandController.text.isNotEmpty) {
      print("NOT EMPTY");
      var regBody = {
        "productname": productNameController.text,
        "brand": brandController.text,
        "quantity": quantityController.text,
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
      } else {
        final snackBar = SnackBar(
          content: Text(
            'Error: ' + jsonResponse['message'].toString() + '!',
            style: TextStyle(color: Colors.white, fontSize: 17.0),
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
        content: Text(
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Column(
                    children: [
                      Image.asset(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 4,
                          'assets/images/blackLogo.png'),
                      Text('Add item',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          )),
                      kSizedBox1,
                      kSizedBox1,
                      Divider(
                        thickness: 1,
                        height: 3,
                        color: Colors.black,
                        indent: 30,
                        endIndent: 30,
                      ),
                      kSizedBox1,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product name",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Lato',
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: productNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText:
                                  _isNotValidate ? "Enter Proper Info" : null,
                              hintText: "Lait 1L",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              fillColor: Colors.white70,
                            ),
                          ),
                          kSizedBox1,
                          Text(
                            "Brand",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Lato',
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: brandController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText:
                                  _isNotValidate ? "Enter Proper Info" : null,
                              hintText: "Delice",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              fillColor: Colors.white70,
                            ),
                          ),
                          kSizedBox1,
                          Text(
                            "Quantity",
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Lato',
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: quantityController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText:
                                  _isNotValidate ? "Enter Proper Info" : null,
                              hintText: "6",
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
                      kSizedBox1,
                      kSizedBox1,
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: welcomeButton(
                          text: "Add",
                          fct: () => {
                            addProduct(),
                            if (widget.destination == 0)
                              {
                                print("DEST=0**************"),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Inventory_init_show(),
                                    ))
                              }
                            else if (widget.destination == 1)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Inventory_show(),
                                    ))
                              }
                          },
                          bgColor: Colors.white,
                          txtColor: Colors.black,
                          icon: Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
                kSizedBox1,
              ]),
        ),
      ),
    );
  }
}
