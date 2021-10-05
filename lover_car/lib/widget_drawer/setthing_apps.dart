import 'package:flutter/material.dart';

// ignore: camel_case_types
class Setthing_app extends StatefulWidget {
  @override
  _Setthing_appState createState() => _Setthing_appState();
}

// ignore: camel_case_types
class _Setthing_appState extends State<Setthing_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('ตั้งค่า'),
      backgroundColor: Colors.blue.shade800,
    ));
  }
}
