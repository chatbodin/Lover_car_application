import 'package:flutter/material.dart';

// ignore: camel_case_types
class SumFuel extends StatefulWidget {
  @override
  _SumFuelState createState() => _SumFuelState();
}

// ignore: camel_case_types
class _SumFuelState extends State<SumFuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('ค่าใช้จ่ายเติมเชื้อเพลิง'),
      backgroundColor: Colors.blue.shade800,
    ));
  }
}
