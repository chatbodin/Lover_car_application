import 'package:flutter/material.dart';
import 'package:lover_car/login/auth_provider.dart';
import 'package:lover_car/login/authen.dart';

import 'package:lover_car/unit/my_style.dart';

class ResetPage extends StatefulWidget {
  //const CreateAccount({Key? key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  double? screenWidth, screenHeight;
  String? typeUser, name, user, password;
  TextEditingController _email = TextEditingController();
  bool? isLoading = false;

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.70,
      child: TextField(
        controller: _email,
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Mystyle().darkColor,
          ),
          labelStyle: Mystyle().darkStyle(),
          labelText: 'Email :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Mystyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().lightColor)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Mystyle().primaryColor,
      ),
      body: Stack(
        children: [
          Mystyle().buildBackground(screenWidth, screenHeight),
          buildContent(),
        ],
      ),
    );
  }

  Center buildContent() {
    return Center(
      child: isLoading == false
          ? SingleChildScrollView(
              //คียร์บอร์ดจะไม่overflow
              child: Column(
                children: [
                  buildUser(),
                  resetAccount(),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Authen()));
                    },
                    child: Text(
                      "Already have an account? Login ",
                      style: Mystyle().activeStyle(),
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Container resetAccount() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: screenWidth! * 0.6,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Mystyle().darkColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            AuthClass()
                .resetPassword(
              email: _email.text.trim(),
            )
                .then((value) {
              if (value == "Email sent") {
                setState(() {
                  isLoading = false;
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Authen()),
                    (route) => false);
              } else {
                setState(() {
                  isLoading = false;
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value)));
              }
            });
          },
          icon: Icon(Icons.restore_page),
          label: Text('Reset account')),
    );
  }
}
