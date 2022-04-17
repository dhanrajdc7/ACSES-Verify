import 'dart:convert';

import 'package:acses/models/participant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:acses/widgets/button_widget.dart';

import '../../main.dart';
import '../widgets/textfield_widget.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {

  String qrResult = 'Unknown';

  var participant = Participant(sr: "", name: "Dhanraj", email: "", comp: "", lab: "");

  bool showResult = false;

  var srController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var compController = TextEditingController();
  var labController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("ACSES"),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(16),
              child: Image.asset("assets/images/acses-logo.png", width: 200, height: 200,),
            ),
            ButtonWidget(
              text: 'Scan Virtual-ID',
              onClicked: () => scanQRCode(),
            ),
            SizedBox(height: 32),
            Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '$qrResult',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Visibility(
              visible: showResult,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sr No.",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: srController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: emailController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Competition",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: compController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Lab",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: labController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Future<void> scanQRCode() async {
    try {
      final scannedQr = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      Participant student = Participant.fromJson(jsonDecode(scannedQr));
      setState(() {
        showResult = true;
        participant = student;
        qrResult = "Verified";
        srController.text = student.sr;
        nameController.text = student.name;
        emailController.text = student.email;
        compController.text = student.comp;
        labController.text = student.lab;
      });
    } on PlatformException {
      qrResult = 'Failed to verify';
    }
  }
}