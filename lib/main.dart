import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:acses/pages/qr_scan_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ACSES",
    theme: ThemeData(
      primaryColor: Colors.deepPurpleAccent,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.deepPurpleAccent
      )
    ),
    home: QRScanPage(),
  );
}