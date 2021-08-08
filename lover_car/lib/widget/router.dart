import 'package:flutter/material.dart';
import 'package:lover_car/home.dart';
import 'package:lover_car/login/authen.dart';
import 'package:lover_car/login/create_account.dart';
import 'package:lover_car/page/history.dart';



final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/history': (BuildContext context) => History(),
  '/home': (BuildContext context) => Home(),
};
