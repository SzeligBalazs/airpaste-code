import 'package:airpaste/About.dart';
import 'package:airpaste/Home.dart';
import 'package:airpaste/Scan.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:r_get_ip/r_get_ip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ipaddress', ipText.text);
  }

  getValues() async {
    final prefs = await SharedPreferences.getInstance();
    ipText.text = prefs.getString('ipaddress')!;
    ipText.text = prefs.getString('ipQR')!;
  }

  @override
  void initState() {
    getValues();
    super.initState();
  }

  TextEditingController ipText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Settings'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
              child: Text('About',
                  style: TextStyle(
                      color: Color(0xFF121212), fontWeight: FontWeight.bold))),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Connect to a device (IP address)\n",
                style: TextStyle(
                    color: Color(0xFF121212), fontWeight: FontWeight.bold),
              ),
              TextField(
                style: const TextStyle(color: Color(0xFF121212)),
                controller: ipText,
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: const TextStyle(color: Color(0xFF121212)),
                    hintText: 'Type the IP address',
                    suffixIcon: IconButton(
                      onPressed: () {
                        ipText.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    fillColor: const Color(0xFFeeeeee)),
              ),
              SizedBox(
                height: 64,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Scan a QR code'),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF121212)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scan()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your internal IP address is (Server IP) ',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FutureBuilder(
                        future: RGetIp.internalIP,
                        builder: (context, snapshot) {
                          return SelectableText(
                            '${snapshot.hasData ? snapshot.data : "0.0.0.0"}',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                    SizedBox(
                      height: 34,
                    ),
                    FutureBuilder(
                        future: RGetIp.internalIP,
                        builder: (context, snapshot) {
                          return QrImage(
                            data: snapshot.data.toString(),
                            size: 200,
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          saveSettings();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        icon: Icon(Icons.done_all),
        label: Text(
          'Save',
        ),
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
      ),
    );
  }
}
