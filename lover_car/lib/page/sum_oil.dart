import 'package:flutter/material.dart';
import 'package:car_lovers/widget_drawer/signout.dart';


class Sumary extends StatefulWidget {
  @override
  _SumaryState createState() => _SumaryState();
}

class _SumaryState extends State<Sumary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ค่าใช้จ่ายการเติมน้ำมัน'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
    );
  }
}
