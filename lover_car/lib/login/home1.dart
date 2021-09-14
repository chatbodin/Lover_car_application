import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lover_car/login/auth_provider.dart';

import 'package:lover_car/login/menulogin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? user = FirebaseAuth.instance.currentUser!.email == null
      ? FirebaseAuth.instance.currentUser!.phoneNumber
      : FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                AuthClass().signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => menusLogin()),
                    (route) => false);
                //sign Out User
              })
        ],
      ),
      body: Center(
        child: Text("Email $user"),
      ),
    );
  }
}
