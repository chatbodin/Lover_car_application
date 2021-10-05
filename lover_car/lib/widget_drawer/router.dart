import 'package:flutter/material.dart';
import 'package:car_lovers/home.dart';
import 'package:car_lovers/login/authen.dart';
import 'package:car_lovers/login/create_account.dart';
import 'package:car_lovers/page/history.dart';



final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/history': (BuildContext context) => History(),
  '/home': (BuildContext context) => Home(),
};
