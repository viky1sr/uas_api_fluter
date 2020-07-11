import 'package:flutter/material.dart';
import 'package:karyawan/screens/HomePage.dart';
import '';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Karyawan',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Biodata Karyawan'),
    );
  }
}
