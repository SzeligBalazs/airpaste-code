import 'package:airpaste/About.dart';
import 'package:airpaste/Home.dart';
import 'package:airpaste/Scan.dart';
import 'package:airpaste/Settings.dart';
import 'package:airpaste/receive/Receive.dart';
import 'package:airpaste/send/Send.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => HomePage(),
        "/settings": (context) => Settings(),
        "/about": (context) => About(),
        "/send": (context) => Send(),
        "/recieve": (context) => Receive(),
        "/scan": (context) => Scan(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
