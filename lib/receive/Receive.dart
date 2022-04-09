<<<<<<< HEAD
import 'package:airpaste/Settings.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Receive extends StatefulWidget {
  const Receive({Key key}) : super(key: key);

  @override
  _ReceiveState createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  String ip;
  bool warning = true;
  FlutterLocalNotificationsPlugin notification;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();

    ip = prefs.getString('ipaddress');
    print(ip);

    if (ip.isEmpty) {
      setState(() {
        warning = true;
      });
    } else {
      setState(() {
        warning = false;
      });
    }

    Socket socket = await Socket.connect(
      ip,
      8888,
    ); // The server's IP address
    socket.write(' ');
    socket.listen(
      (event) {
        setState(() {
          receivedData = utf8.decode(event);
          print('Arrived');
          showNotification();
          socket.done;
          socket.destroy();
          socket.close();
        });
      },
    );
  }

  String receivedData = "You haven't got any received data.";

  @override
  void initState() {
    var androidInitialize = new AndroidInitializationSettings('icon_rounded');
    var initializeSettings =
        new InitializationSettings(android: androidInitialize);
    notification = new FlutterLocalNotificationsPlugin();
    notification.initialize(initializeSettings);

    getData();
    super.initState();
  }

  Future showNotification() async {
    var details = new AndroidNotificationDetails(
        "channelId", "You've got a message",
        importance: Importance.high, playSound: true);
    var generalNotificationDetails = NotificationDetails(android: details);

    await notification.show(0, "You've got a message",
        "Please enter the app to see it", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          size: 32,
        ),
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        onPressed: () {
          getData();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('AirPaste'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 86),
                  const Text(
                    "Scan the QR code under the other device(s)\nThe received text will be copied to the clipboard when you press the copy icon.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    child: const Text('Scan a QR code'),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF121212)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, "/scan");
                    },
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            receivedData,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                if (receivedData !=
                                    "You haven't got any received data.") {
                                  Clipboard.setData(
                                      ClipboardData(text: receivedData));
                                }
                              },
                              icon: Icon(
                                Icons.copy,
                                size: 28,
                                color: Colors.black,
                              )),
                          Visibility(
                            visible: warning,
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()),
                                );
                              }),
                              child: Text(
                                '\nNo IP address was specified. Click on the text to set it up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
=======
import 'package:airpaste/Settings.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  _ReceiveState createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  String? ip;
  bool warning = true;
  FlutterLocalNotificationsPlugin? notification;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();

    ip = prefs.getString('ipaddress');
    print(ip);

    if (ip!.isEmpty) {
      setState(() {
        warning = true;
      });
    } else {
      setState(() {
        warning = false;
      });
    }

    Socket socket = await Socket.connect(
      ip,
      8888,
    ); // The server's IP address
    socket.write(' ');
    socket.listen(
      (event) {
        setState(() {
          receivedData = utf8.decode(event);
          print('Arrived');
          showNotification();
          socket.done;
          socket.destroy();
          socket.close();
        });
      },
    );
  }

  String receivedData = "You haven't got any received data.";

  @override
  void initState() {
    var androidInitialize = new AndroidInitializationSettings('icon_rounded');
    var initializeSettings =
        new InitializationSettings(android: androidInitialize);
    notification = new FlutterLocalNotificationsPlugin();
    notification!.initialize(initializeSettings);

    getData();
    super.initState();
  }

  Future showNotification() async {
    var details = new AndroidNotificationDetails(
        "channelId", "You've got a message",
        importance: Importance.high, playSound: true);
    var generalNotificationDetails = NotificationDetails(android: details);

    await notification!.show(0, "You've got a message",
        "Please enter the app to see it", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          size: 32,
        ),
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Receive()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('AirPaste'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 86),
                  const Text(
                    "Scan the QR code under the other device(s)\nThe received text will be copied to the clipboard when you press the copy icon.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: 86),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 120, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectableText(
                          receivedData,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              if (receivedData !=
                                  "You haven't got any received data.") {
                                Clipboard.setData(
                                    ClipboardData(text: receivedData));
                              }
                            },
                            icon: Icon(
                              Icons.copy,
                              size: 28,
                              color: Colors.black,
                            )),
                        SizedBox(height: 100),
                        Visibility(
                          visible: warning,
                          child: GestureDetector(
                            onTap: (() {
                              getData();
                            }),
                            child: Text(
                              '\nNo IP address was specified. Click on the text to set it up.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
>>>>>>> 5ced99a (Update)
