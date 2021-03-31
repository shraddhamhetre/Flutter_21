import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Activities/Login.dart';

import '../Activities/Splash.dart';

Future<void> main() async {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: Color(0xff33334E),
        buttonColor: Color(0xff33334E),
        primaryColor: Color(0xff1A1C2B),
        shadowColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff1A1C2B),
        cursorColor: Color(0xff1A1C2B),
        fontFamily: 'Roboto Condensed',
      ),
      home: new HomePage(),
    );
  }
}
