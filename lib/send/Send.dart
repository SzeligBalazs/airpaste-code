import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:r_get_ip/r_get_ip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  String message = "";
  TextEditingController inputController = TextEditingController();

  var localhost;

  void Send() async {
    ServerSocket serverSocket =
        await ServerSocket.bind(localhost.toString(), 8888, shared: true);

    await for (Socket socket in serverSocket) {
      socket.cast<List<int>>().transform(utf8.decoder).listen((data) {
        print("from ${socket.remoteAddress.address} data:" + data);
        socket.add(utf8.encode(inputController.text));
        print('Done');
        serverSocket.close();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('AirPaste'),
        elevation: 0,
        foregroundColor: Color(0xFF121212),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Send a text to a connected device',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF121212),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              TextField(
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(color: Color(0xFF121212)),
                controller: inputController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    hintStyle: const TextStyle(color: Color(0xFF121212)),
                    hintText: 'Type or paste here a text',
                    suffixIcon: IconButton(
                      onPressed: () {
                        inputController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    fillColor: const Color(0xFFeeeeee)),
              ),
              FutureBuilder(
                  future: RGetIp.internalIP,
                  builder: (context, snapshot) {
                    localhost = snapshot.data;
                    print(localhost);
                    return Container();
                  }),
              ElevatedButton(
                child: const Text('Send'),
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
                  Send();
                  Navigator.pushReplacementNamed(context, "home");
                },
              ),
            ]),
      ),
    );
  }
}