import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lover_car/Nofi_3/CircularButtom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
   AnimationController _animationController;
   Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Animation FAB Menu")),
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                  right: 20,
                  bottom: 20,
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset.fromDirection(
                            3 * pi / 2, _animation.value * 100),
                        child: CircularButton(
                          color: Colors.green,
                          width: 60,
                          height: 60,
                          icon: Icon(Icons.car_rental, color: Colors.white),
                          onClick: () {},
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(
                            5 * pi / 4, _animation.value * 100),
                        child: CircularButton(
                          color: Colors.purple,
                          width: 60,
                          height: 60,
                          icon: Icon(Icons.local_gas_station,
                              color: Colors.white),
                          onClick: () {},
                        ),
                      ),
                      Transform.translate(
                        offset:
                            Offset.fromDirection(pi, _animation.value * 100),
                        child: CircularButton(
                          color: Colors.orange.shade400,
                          width: 60,
                          height: 60,
                          icon: Icon(Icons.access_alarm, color: Colors.white),
                          onClick: () {},
                        ),
                      ),
                      CircularButton(
                        color: Colors.red,
                        width: 60,
                        height: 60,
                        icon: Icon(Icons.add, color: Colors.white),
                        onClick: () {
                          if (_animationController.isCompleted) {
                            _animationController.reverse();
                          } else {
                            _animationController.forward();
                          }
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
