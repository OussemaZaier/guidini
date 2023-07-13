import 'package:flutter/material.dart';
import 'package:guidini/Screens/Inventory_init_choice/main.dart';
import 'package:guidini/Screens/Inventory_init_show/productCard.dart';
import 'package:guidini/Screens/SignIn/main.dart';
import 'package:guidini/Screens/SignUp/main.dart';
import 'package:guidini/Screens/HomePage/main.dart';
import 'package:guidini/Screens/Welcome/main.dart';
import 'package:guidini/Screens/Inventory_init_show/welcomeButton.dart';
import 'package:guidini/Screens/budget/main.dart';
import 'package:guidini/Screens/recette/main.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:intro_slider/intro_slider.dart';

class Newcart extends StatelessWidget {
  Newcart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: [
              
               title(text: 'New Cart', txtColor:Colors.black, bgColor1: Colors.white, bgColor2: Colors.green),
              kSizedBox1,
              productCard(
                  text1: '  Product',
                  text2: 'Price ',
                  
                  text3: 'Qty',
                  text4: '',
                  fct: () => {},
                  bgColor: Color.fromARGB(1, 1, 1, 1),
                  txtColor: Colors.black,
                  add_remove: false,
                  shadow: false,),
              Divider(
                thickness: 4,
                height: 5,
                color: Colors.white60,
                indent: 30,
                endIndent: 30,
              ),
              productCard(
                  icon: Icons.abc,
                  text1: 'Produit1',
                  text2: '2.500 ',
                  
                  text3: '3',
                  text4: '',
                  fct: () => {},
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  add_remove: true,
                  shadow: true,),
              productCard(
                  icon: Icons.abc,
                  text1: 'Produitxyzzz',
                  text2: '7.500 ',
                  
                  text3: '7',
                  text4:'2.500',
                  fct: () => {},
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  add_remove: true,
                  shadow: true,),
              kSizedBox1,
              kSizedBox1,
              Row(
  children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '        Total',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '                                                    10DT',
          style: TextStyle(
            fontSize: 18,
            color: Colors.green,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    kSizedBox1,
    kSizedBox1,
  ],
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
                                builder: (context) => Budget(),
                              ))
                        },
                    bgColor: Colors.white,
                    txtColor: Colors.green,
                    icon: Icons.add,
                    
                    ),
                    
                    
                    

              ),
              kSizedBox1,
               Container(
                width: MediaQuery.of(context).size.width / 2,
                child: welcomeButton(
                    text: "Finish",
                    fct: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Budget(),
                              ))
                        },
                    bgColor: Colors.white,
                    txtColor: Colors.green,
                    icon: Icons.check,
                    
                    ),)
            ],
          ),
          kSizedBox1,
        ]),
        
      ),
      
    );
  }
}

