import 'dart:io';
import 'package:airpaste/Home.dart';
import 'package:airpaste/Settings.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scan extends StatefulWidget {
  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  saveIP() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ipaddress', result!.code!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.lightBlueAccent,
                borderRadius: 10,
                borderLength: 20,
                borderWidth: 10,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      "IP address: ${result!.code!}\n If the app doesn't return to the home page you need to return manually.",
                      textAlign: TextAlign.center,
                    )
                  : Text('Scan a QR code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.stopCamera();
        saveIP();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
}
