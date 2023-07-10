import 'package:flutter/material.dart';
import 'package:guidini/Screens/Welcome/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Welcome(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
