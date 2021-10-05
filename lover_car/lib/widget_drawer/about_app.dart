import 'package:flutter/material.dart';

// ignore: camel_case_types
class About_app extends StatefulWidget {
  @override
  _About_appState createState() => _About_appState();
}

// ignore: camel_case_types
class _About_appState extends State<About_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('เกี่ยวกับCarLovers'),
      backgroundColor: Colors.blue.shade800,
    ));
  }
}
