// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:lover_car/oil_page/Allprice.dart';
import 'package:lover_car/oil_page/bcp_oil.dart';
import 'package:lover_car/oil_page/esso.dart';
import 'package:lover_car/oil_page/ptt_oil.dart';
import 'package:lover_car/oil_page/shell.dart';

import 'package:lover_car/widget/signout.dart';

class Oil extends StatefulWidget {
  @override
  _OilState createState() => _OilState();
}

class _OilState extends State<Oil> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ราคาน้ำมัน'),
        backgroundColor: Colors.blue.shade800,
        bottom: TabBar(
          isScrollable: true,
          indicatorWeight: 10,
          indicatorColor: Colors.red,
          controller: _controller,
          tabs: [
            Tab(
              text: ('ราคาน้ำมันถูกสุด'),
            ),
            Tab(
              text: ('ปตท'),
            ),
            Tab(
              text: ('บางจาก'),
            ),
            Tab(
              text: ('เชลล์'),
            ),
            Tab(
              text: ('เอสโซ่'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Allprice(),
          Pttoil(),
          Bcpoil(),
          Shelloil(),
          Essooil(),
        ],
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
    );
  }
}
