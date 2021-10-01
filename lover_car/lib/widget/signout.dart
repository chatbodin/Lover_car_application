import 'package:flutter/material.dart';
import 'package:lover_car/login/auth_provider.dart';
import 'package:lover_car/login/home1.dart';

import 'package:lover_car/login/login_screen.dart';

// ignore: unused_import

class MySignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColorLight,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/logos.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Version 1.0',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            leading:
                Icon(Icons.assessment_outlined, size: 30, color: Colors.black),
            title: Text(
              'ค่าใช้จ่ายการเติมน้ำมัน',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.blueGrey.shade50,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            leading:
                Icon(Icons.calculate_outlined, size: 30, color: Colors.black),
            title: Text(
              'คํานวณอัตราสิ้นเปลืองน้ำมัน',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.blueGrey.shade50,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            leading: Icon(Icons.list, size: 30, color: Colors.black),
            title: Text(
              'เกี่ยวกับ CarLovers',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.blueGrey.shade50,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          SizedBox(
            height: 4,
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 30, color: Colors.black),
            title: Text(
              'ตั้งค่า',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.blueGrey.shade50,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          SizedBox(
            height: 3,
          ),
          ListTile(
            onTap: () {
              AuthClass().signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black,
              size: 30,
            ),
            title: Text(
              'Sign Out',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.red.shade400,
          ),
        ],
      ),
    );
  }
}
