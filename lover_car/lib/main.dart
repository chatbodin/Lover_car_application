import 'package:car_lovers/Nofi_calculate/nofication_car.dart';
import 'package:car_lovers/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:car_lovers/home.dart';
import 'package:car_lovers/login/splash.dart';
import 'package:car_lovers/servicecar/google_map_page.dart';
import 'package:car_lovers/servicecar/location_provider.dart';
import 'package:provider/provider.dart';

import 'Nofi_calculate/add_fuel.dart';
import 'Nofi_calculate/service_car.dart';

Map<String, WidgetBuilder> map = {
  '/loginScreen': (BuildContext context) => LoginScreen(),
  '/home': (BuildContext context) => Home(),
  '/addFuel': (BuildContext context) => AddFuel_car(),
  '/noficationCar': (BuildContext context) => Nofi_car(),
  '/serviceCar': (BuildContext context) => Ser_cars(),
};
String firstState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    // ignore: await_only_futures
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        firstState = '/loginScreen';
        runApp(MyApp());
      } else {
        firstState = '/home';
        runApp(MyApp());
      }
    });

    firstState = '/loginScreen';
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  static final String title = 'Upload To Github';
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
        routes: map,
        initialRoute: firstState,
      ),
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Splash();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
