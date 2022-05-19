import 'package:flutter/material.dart';
import 'package:teleconnect/ui/callLogsPage.dart';
import 'package:teleconnect/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure phone BackUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: callLogsPage(),
    );
  }
}
