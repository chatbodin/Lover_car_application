import 'package:flutter/material.dart';
import 'package:lover_car/widget/signout.dart';

class Tel extends StatefulWidget {
  @override
  _TelState createState() => _TelState();
}

class _TelState extends State<Tel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เบอร์ฉุกเฉิน'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            height: 50,
            child: Text('กรณีเหตุด่วนเหตุร้าย',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
    );
  }
}
