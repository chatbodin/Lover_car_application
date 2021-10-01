import 'package:flutter/material.dart';

import 'package:lover_car/widget/signout.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ประวัติการใช้งาน'),
          backgroundColor: Colors.blue.shade800,
        ),
        // floatingActionButton: SpeedDial(
        //   animatedIcon: AnimatedIcons.menu_close,
        //   children: [
        //     SpeedDialChild(
        //       child: Icon(Icons.share_arrival_time),
        //     ),
        //     SpeedDialChild(
        //       child: Icon(Icons.mail),
        //     ),
        //     SpeedDialChild(
        //       child: Icon(Icons.copy),
        //     ),
        //   ],
        // ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        drawer: Drawer(
          child: MySignOut(),
        ));
  }
}
