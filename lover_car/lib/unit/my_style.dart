import 'package:flutter/material.dart';

class Mystyle {
  Color darkColor = Color(0xff000073);
  Color primaryColor = Color(0xff1515a3);
  Color lightColor = Color(0xff5c41d6);

  TextStyle darkStyle() => TextStyle(color: darkColor);
  TextStyle whiteStyle() =>
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15);
  TextStyle activeStyle() => TextStyle(
      color: Colors.pink.shade600, fontWeight: FontWeight.w700, fontSize: 17);

  Widget showLogo() => Image(
        
        image: AssetImage('images/logos.png'),
      );

  SafeArea buildBackground(double? screenWidth, double? screenHeight) {
    return SafeArea(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage('images/top1.png')),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage('images/top2.png')),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image(image: AssetImage('images/bottom1.png')),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image(image: AssetImage('images/bottom2.png')),
            ),
          ],
        ),
      ),
    );
  }

  Mystyle();
}
