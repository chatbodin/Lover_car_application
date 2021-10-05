import 'package:flutter/material.dart';

// ignore: camel_case_types
class CalculateFuel extends StatefulWidget {
  @override
  _CalculateFuelState createState() => _CalculateFuelState();
}

// ignore: camel_case_types
class _CalculateFuelState extends State<CalculateFuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('อัตราการสิ้นเปลืองน้ำมัน'),
      backgroundColor: Colors.blue.shade800,
    ));
  }
}
