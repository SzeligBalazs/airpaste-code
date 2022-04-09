<<<<<<< HEAD
import 'package:airpaste/About.dart';
import 'package:airpaste/Home.dart';
import 'package:airpaste/Settings.dart';
import 'package:airpaste/receive/Receive.dart';
import 'package:airpaste/send/Send.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background/flutter_background.dart';

void main() async {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "Background process",
    notificationText: "Enable this to run the app in the background",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(
        name: 'icon_rounded',
        defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );
  bool success =
      await FlutterBackground.initialize(androidConfig: androidConfig);

  bool successfull = await FlutterBackground.enableBackgroundExecution();
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
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
=======
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
>>>>>>> 5ced99a (Update)
