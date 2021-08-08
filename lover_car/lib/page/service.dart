import 'package:flutter/material.dart';
import 'package:lover_car/widget/signout.dart';

class Sercar extends StatefulWidget {
  @override
  _SercarState createState() => _SercarState();
}

class _SercarState extends State<Sercar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ศูนย์รถยนต์'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
    );
  }
}
