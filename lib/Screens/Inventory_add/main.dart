import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/main.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/utils/constants.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';

class Inventory_add extends StatelessWidget {
  Inventory_add({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 244, 248, 246),
              Color.fromARGB(255, 241, 245, 244),
            ],
            center: Alignment(-1, -1),
            radius: 3.0,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.voicemail),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              kSizedBox1,
              Divider(
                thickness: 1.2,
                height: 5,
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              productCard(
                icon: Icons.abc,
                text1: 'Searched1',
                text2: '12/12/12',
                text3: '3',
                fct: () => {},
                bgColor: Colors.white,
                txtColor: Colors.black,
                shadow: true,
                add_remove: true,
              ),
              productCard(
                icon: Icons.abc,
                text1: 'Produitxyzzz',
                text2: '9/1/23',
                text3: '7',
                fct: () => {},
                bgColor: Colors.white,
                txtColor: Colors.black,
                shadow: true,
                add_remove: true,
              ),
              kSizedBox1,
              kSizedBox1,
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: welcomeButton(
                  text: "Add",
                  fct: () => {
                    Navigator.pop(context),
                  },
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  icon: Icons.add,
                ),
              ),
            ],
          ),
          kSizedBox1,
        ]),
      ),
    );
  }
}
