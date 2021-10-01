import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:lover_car/home.dart';
import 'package:lover_car/login/auth_provider.dart';
import 'package:lover_car/login/create_account.dart';

import 'package:lover_car/login/reset.dart';

import 'package:lover_car/unit/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screenWidth, screenHeight;
  bool redEye = true, isLoading = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //floatingActionButton: buildCreateAccount(),
      resizeToAvoidBottomInset: false,
      body: isLoading == false
          ? SafeArea(
              child: Stack(
                children: [
                  Mystyle().buildBackground(screenWidth, screenHeight),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: buildLogo(),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSignInGoogle(),
                        // buildSignInFacebook(),
                        buildUser(),
                        buildPassword(),
                        buildLogin(),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                          },
                          child: Text(
                            "สร้างบัญชีผู้ใช้งานที่นี่ ",
                            style: Mystyle().activeStyle(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetPage()));
                          },
                          child: Text(
                            "ลืมรหัสผ่านใช่หรือไม่ ",
                            style: Mystyle().activeStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Container buildSignInGoogle() => Container(
        margin: EdgeInsets.only(top: 80),
        width: screenWidth * 0.6,
        child: SignInButton(
          Buttons.GoogleDark,
          onPressed: () {
            //Sign In with google
            AuthClass().signWithGoogle().then((UserCredential value) {
              final displayName = value.user.displayName;

              print(displayName);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Container buildSignInFacebook() => Container(
        margin: EdgeInsets.only(top: 5),
        width: screenWidth * 0.6,
        child: SignInButton(
          Buttons.FacebookNew,
          onPressed: () {
            // AuthClass().signInWithFacebook().then((UserCredential value) {
            //   Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(builder: (context) => Home()),
            //       (route) => false);
            // });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screenWidth * 0.67,
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.perm_identity,
            color: Mystyle().darkColor,
          ),
          labelStyle: Mystyle().darkStyle(),
          labelText: 'User :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Mystyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().lightColor)),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth * 0.67,
      child: TextField(
        controller: _password,
        obscureText: redEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(
                redEye
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye_sharp,
                color: Mystyle().darkColor,
              ),
              onPressed: () {
                setState(() {
                  redEye = !redEye;
                });
              }),
          prefixIcon: Icon(
            Icons.lock_outlined,
            color: Mystyle().darkColor,
          ),
          labelStyle: Mystyle().darkStyle(),
          labelText: 'Password :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Mystyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().lightColor)),
        ),
      ),
    );
  }

  Container buildLogin() => Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth * 0.4,
        height: screenHeight * 0.07,
        child: TextButton(
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            AuthClass()
                .signIN(
                    email: _email.text.trim(), password: _password.text.trim(),)
                .then((value) {
              if (value == "Welcome") {
                setState(() {
                  isLoading = false;
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
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
          child: const Text('Log in'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            primary: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 18.0,
            ),
            shape: const StadiumBorder(),
          ),
        ),
      );



  Container buildLogo() {
    return Container(
      width: screenWidth * 0.4,
      child: Mystyle().showLogo(),
    );
  }
}
