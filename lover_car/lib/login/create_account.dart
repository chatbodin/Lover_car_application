import 'package:flutter/material.dart';
import 'package:car_lovers/login/auth_provider.dart';
import 'package:car_lovers/login/authen.dart';
import 'package:car_lovers/unit/my_style.dart';

class CreateAccount extends StatefulWidget {
  //const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double screenWidth, screenHeight;
  //String? typeUser, name, user, password;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('สมัครสมาชิก'),
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
                  buildPassword(),
                  buildConfirmpassword(),
                  buildCreateAccount(),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Authen()));
                    },
                    child: Text(
                      "กลับไปหน้าเมนูหลัก ",
                      style: Mystyle().activeStyle(),
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth * 0.70,
      child: TextField(
        controller: _email,
        //onChanged: (value) => user = value.trim(),
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

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth * 0.70,
      child: TextField(
        controller: _password,
        //onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Mystyle().darkColor,
          ),
          labelStyle: Mystyle().darkStyle(),
          labelText: 'Password :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Mystyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().lightColor)),
        ),
      ),
    );
  }

  Container buildConfirmpassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth * 0.70,
      child: TextField(
        controller: _confirmpassword,
        //onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Mystyle().darkColor,
          ),
          labelStyle: Mystyle().darkStyle(),
          labelText: 'Confirm Password :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Mystyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().lightColor)),
        ),
      ),
    );
  }

  Container buildCreateAccount() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: screenWidth * 0.6,
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
                .createAccount(
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                    confirmpassword: _confirmpassword..text.trim())
                .then((value) {
              if (value == "Account created") {
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
          icon: Icon(Icons.cloud_upload),
          label: Text('สร้างบัญชีผู้ใช้')),
    );
  }
}
