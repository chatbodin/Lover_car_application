// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_lovers/servicecar/google_map_page.dart';
import 'package:car_lovers/servicecar/location_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: GoogleMapPage(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: GoogleMapPage(),
      ),
    );
  }
}
