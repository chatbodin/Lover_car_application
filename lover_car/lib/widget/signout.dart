import 'package:flutter/material.dart';
import 'package:lover_car/login/auth_provider.dart';
import 'package:lover_car/login/authen.dart';

class MySignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, //อยู่ด้านล่างสุด
      children: [
        ListTile(
          onTap: () {
            AuthClass().signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Authen()),
                (route) => false);
          },
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: Text(
            'Sign Out',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          tileColor: Colors.red.shade500,
        ),
      ],
    );
  }
}
