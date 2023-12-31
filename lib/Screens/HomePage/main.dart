import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guidini/Screens/Profile/main.dart';
import 'package:guidini/Screens/SignUp/config.dart';
import 'package:guidini/Screens/navigation.dart';
import 'package:guidini/utils/constants.dart';
import 'package:blur/blur.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> ADS = [];
  Future<List> getAds() async {
    print("** GETTING ADS **");
    var response = await http.get(
      Uri.parse(ads),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );

    print(response);
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    return jsonResponse;
    for (var i in jsonResponse) {
      print("-----");
      print(i['adname'] +
          " on " +
          i['productname'] +
          "\nOffer ends at " +
          i['end_date']);
    }

    return ["Err", "Err"];
  }

  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      this.ADS = await getAds();
      print(this.ADS[0]['adname']);
      setState(() {
        this.ADS;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBox1,
              kSizedBox1,
              kSizedBox1,
              HomeCard(
                  title: 'You saved 61.00DT\n this month!',
                  topText: 'Great job!',
                  buttonText: 'View profile',
                  buttonFct: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Navigation(
                                  pageNumber: 4,
                                )));
                  },
                  bg: 'https://media.istockphoto.com/id/1345912457/photo/financial-stock-market-graph-selective-focus.jpg?s=612x612&w=0&k=20&c=I-XKq4_2c3rOJPezkG5J6DNbl65OVgmGbX4yrp5T7qQ='),
              for (var i in ADS)
                HomeCard(
                  title: i["adname"] +
                      " on " +
                      i["productname"] +
                      " by " +
                      i["brand"],
                  topText:
                      'Offer ends on ' + i["end_date"].substring(0, 15) + '!',
                  buttonText: 'View product',
                  buttonFct: () {
                    getAds();
                  },
                  bg: i["image"],
                ),

              // HomeCard(
              //     title: 'Fresh soft drink is \non sale in Super_XTRA!',
              //     topText: 'A product you might like',
              //     buttonText: 'View product',
              //     buttonFct: () {
              //       getAds();
              //     },
              //     bg: 'assets/images/refer.png'),
              HomeCard(
                title: 'Get 25% off your next \ncart by referring!',
                topText: 'Work better together!',
                buttonText: 'Refer (+3000 Points)',
                buttonFct: () {},
                bg: 'https://iili.io/HQ1ltjt.jpg',
              ),
              kSizedBox1,
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  HomeCard({
    Key? key,
    required this.title,
    required this.topText,
    required this.bg,
    required this.buttonFct,
    required this.buttonText,
    // required this.imageIsURL,
  }) : super(key: key);
  String title;
  String topText;
  String buttonText;
  VoidCallback buttonFct;
  String bg;
  // bool imageIsURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        bottom: 10.0,
        right: 10.0,
      ),
      child: Container(
        height: 250,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(bg),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topText,
                    style: TextStyle(
                      color: Color.fromARGB(246, 255, 255, 255),
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 15.0,
                          color: Color.fromARGB(40, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 8.0,
                          color: Color.fromARGB(40, 0, 0, 0),
                        ),
                      ],
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kSizedBox1,
                  InkWell(
                    onTap: buttonFct,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
