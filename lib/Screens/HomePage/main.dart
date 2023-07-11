import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guidini/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              flexibleSpace: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.voicemail),
                        filled: true,
                        fillColor: Color.fromARGB(30, 0, 0, 0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(30, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Search Tech Talk',
                      ),
                    ),
                  ),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height / 5,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black87,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
              ],
              backgroundColor: Colors.white,
              floating: true,
            )
          ];
        },
        body: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return HomeCard(
              title: 'Get 25% off your next cart by referring!',
              topText: 'work better together !',
              buttonText: 'Refer a friend (+400)',
              buttonFct: () {},
              bg: 'assets/images/bg1.png',
            );
          },
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
        height: 200,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bg),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                  begin: Alignment.topRight,
                  end: Alignment.center,
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
                      color: Color.fromARGB(144, 255, 255, 255),
                      fontFamily: 'Lato',
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 25.0,
                    ),
                  ),
                  kSizedBox1,
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
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
