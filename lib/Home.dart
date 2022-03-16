import 'package:airpaste/Settings.dart';
import 'package:airpaste/receive/Receive.dart';
import 'package:airpaste/send/Send.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TimeOfDay now = TimeOfDay.now();

  String time() {
    var hour = DateTime.now().hour;
    if (hour < 9) {
      return 'Good morning';
    }
    if (hour > 9) {
      return 'Have a nice day';
    }
    if (hour < 17) {
      return 'Good afternoon';
    }
    return 'Good evening';
  }

  @override
  void initState() {
    time();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('AirPaste'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Color(0xFF121212),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Text(
                    '${time()}! \n',
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Text(
                    'Choose an option',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF121212),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            )),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Send()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF222222),
                        fixedSize: Size(200, 55),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Send ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.send,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Text('\n\n\n'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Receive()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF222222),
                        fixedSize: Size(200, 55),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Receive ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.download,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
