import 'package:flutter/material.dart';
import 'package:car_lovers/widget_drawer/signout.dart';


class Nofication extends StatefulWidget {
  @override
  _NoficationState createState() => _NoficationState();
}

class _NoficationState extends State<Nofication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การแจ้งเตือน'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
    );
  }
}
