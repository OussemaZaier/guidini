import 'package:flutter/material.dart';
import 'package:guidini/Network/NetworkApiService.dart';
import 'package:guidini/Screens/SignIn/signinScreen.dart';
import 'package:guidini/Screens/SignUp/signupScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeScreen.dart';
import 'package:guidini/Screens/Welcome/welcomeButton.dart';
import 'package:guidini/dbHelper/mongodb.dart';
import 'package:guidini/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        // body: ElevatedButton(
        //   onPressed: () {
        //     final networkApiService = NetworkApiService();
        //     final res = networkApiService.getResponse(
        //         'https://dog.ceo/api/breeds/image/random', {'x': '1'});
        //     print('res from main $res');
        //   },
        //   child: Text('Make request'),
        // ),
        body: Builder(
          builder: (BuildContext context) {
            return Welcome(
              title: AppLocalizations.of(context)!.mainText,
              child: Column(
                children: [
                  welcomeButton(
                    text: 'Register',
                    fct: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    bgColor: Colors.white,
                    txtColor: kMainGreen,
                  ),
                  welcomeButton(
                    text: 'Login',
                    fct: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                          //TODO:change  later
                        ),
                      );
                    },
                    bgColor: Colors.white,
                    txtColor: kMainGreen,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: const Locale('fr'),
      locale: _locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
