import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guidini/Screens/Recipe_detail/main.dart';
import 'package:guidini/Screens/title.dart';
import 'package:guidini/utils/constants.dart';
import 'package:blur/blur.dart';

class Recipes extends StatelessWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              title(
                text: 'Recipes',
                txtColor: Colors.white,
                bgColor1: Color.fromARGB(255, 196, 46, 46),
                bgColor2: const Color.fromARGB(255, 198, 75, 75),
              ),
              kSizedBox1,
              kSizedBox1,
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.voicemail),
                    filled: true,
                    fillColor: Color.fromARGB(30, 154, 154, 154),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(233, 219, 6, 6)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              kSizedBox1,
              kSizedBox1,
              HomeCard(
                title: 'Pizza napolitana',
                topText: '',
                buttonText: 'View recipe',
                buttonFct: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Recipe_detail(
                        title: "Pizza napolitana",
                        image: 'assets/images/pizza.jpg');
                  }));
                },
                bg: 'assets/images/pizza.jpg',
              ),
              kSizedBox1,
              HomeCard(
                title: 'Couscous Agneau',
                topText: '',
                buttonText: 'View recipe',
                buttonFct: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Recipe_detail(
                        title: "Couscous Agneau",
                        image: 'assets/images/couscous.jpg');
                  }));
                },
                bg: 'assets/images/couscous.jpg',
              ),
              kSizedBox1,
              HomeCard(
                title: 'Spaghetti Bolognese',
                topText: '',
                buttonText: 'View recipe',
                buttonFct: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Recipe_detail(
                        title: "Spaghetti Bolognese",
                        image: 'assets/images/spag.jpg');
                  }));
                },
                bg: 'assets/images/spag.jpg',
              ),
              kSizedBox1,
              kSizedBox1
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
  }) : super(key: key);
  String title;
  String topText;
  String buttonText;
  VoidCallback buttonFct;
  String bg;

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
                  image: AssetImage(bg),
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
                    onTap: () => {
                      buttonFct(),
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
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
