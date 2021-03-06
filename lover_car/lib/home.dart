import 'package:flutter/material.dart';
import 'package:car_lovers/page/history.dart';

import 'package:car_lovers/page/oil.dart';
import 'package:car_lovers/page/service.dart';
import 'package:car_lovers/page/sum_oil.dart';
import 'package:car_lovers/page/tel.dart';

import 'Nofi_calculate/add_fuel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    History(),
    Oil(),
    Sumary(),
    AddFuel_car(),
    Tel(),
    Sercar(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = History();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = History();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.format_line_spacing_outlined,
                          color: currentTab == 0 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'ประวัติ',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.black,
                              fontSize: 8.7),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Oil();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_gas_station,
                          color: currentTab == 1 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'ราคาน้ำมัน',
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.black,
                              fontSize: 8.7),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = AddFuel_car();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_alarm_rounded,
                          color: currentTab == 2 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'แจ้งเตือน',
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.black,
                              fontSize: 8.7),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Tel();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: currentTab == 3 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'เบอร์ฉุกเฉิน',
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.black,
                              fontSize: 8.7),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Sercar();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.car_repair,
                          color: currentTab == 4 ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'ศูนย์รถ',
                          style: TextStyle(
                              color:
                                  currentTab == 4 ? Colors.blue : Colors.black,
                              fontSize: 8.7),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
