import 'package:flutter/material.dart';

// ignore: camel_case_types
class AddFuel_car extends StatefulWidget {
  @override
  _AddFuel_carState createState() => _AddFuel_carState();
}

// ignore: camel_case_types
class _AddFuel_carState extends State<AddFuel_car> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('เติมเชื้อเพลิง'),
      backgroundColor: Colors.blue.shade800,
    ));
  }
}
