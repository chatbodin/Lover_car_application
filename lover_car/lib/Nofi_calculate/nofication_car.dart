import 'dart:ffi';
import 'dart:ui';

import 'package:car_lovers/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Nofi_car extends StatefulWidget {
  @override
  _Nofi_carState createState() => _Nofi_carState();
}

// ignore: camel_case_types
class _Nofi_carState extends State<Nofi_car> {
  final formKey = GlobalKey<FormState>();
  DataNofication datanofication = DataNofication();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // ignore: unused_field
  CollectionReference _dataNoficationCollection =
      FirebaseFirestore.instance.collection("datanofication");

  String uidUser;

  TextEditingController remarkController = TextEditingController();

  List<String> typeNoficationServices = [
    'น้ำมันเครื่อง',
    'น้ำหล่อเย็น',
    'น้ำมันคลัตช์',
    'แบตเตอรี่',
    'ผ้าเบรก',
    'นำมันเกียร์ออโต้',
    'น้ำมันพาวเวอร์',
    'สายพรานไทม์มิ่ง',
    'ที่ปัดน้ำฝน',
    'น้ำมันเบรก',
    'คลัตช์',
    'สลับยาง',
    'ไส้กรองน้ำมันเกียร์',
    'ไส้กรองอากาศ',
    'อื่นๆ'
  ];

  List<String> typeNoficationTaxs = [
    'ใขขับขี่',
    'พรบ.',
    'ประกันภัยรถยนต์',
    'อื่นๆ'
  ];

  String typeNoficationService;
  String typeNoficationTax;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    findUidUser();
  }

  // ignore: missing_return
  Future<Void> findUidUser() async {
    // ignore: await_only_futures
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      uidUser = event.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("เติมเชื้อเพลิง"),
                backgroundColor: Colors.purple,
              ),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTitle('ชนิดบริการ'),
                          // buildDropdown(),
                          buildTitle('ชนิดภาษี'),
                          // buildDropdown(),
                          buildTitle("หมายเหตุ"),
                          billdRemark(),
                          buttonSave(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget buttonSave() {
    return Container(
      margin: EdgeInsets.only(top: 23),
      width: double.infinity,
      child: ElevatedButton(
          child: Text(
            "บันทึก",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();

              // ignore: unused_local_variable
              DataNofication model = DataNofication(
                  typeNoficationService: typeNoficationService,
                  typeNoficationTax: typeNoficationTax,
                  remark: remarkController.text);

              // await FirebaseFirestore.instance
              //     .collection('users')
              //     .doc(uidUser)
              //     .collection('datanofication')
              //     .doc()
              //     .set(model.toMap())
              //     .then((value) => Navigator.pop(context));

              // });
              formKey.currentState.reset();
            }
          }),
    );
  }

  TextFormField billdRemark() {
    return TextFormField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      // validator: RequiredValidator(
      //     errorText: "กรุณากรอกเลขป้ายทะเบียน"),
      onSaved: (String notes) {
        datanofication.notes = notes;
      },
    );
  }

  // DropdownButton<String> buildDropdown() {
  //   return DropdownButton<String>(
  //     onChanged: (value) {
  //       setState(() {
  //         typeNoficationService = value;
  //       });
  //     },
  //     hint: Text('กรุณาเลือกชนิดบริการ'),
  //     value: typeNoficationService,
  //     items: typeNoficationService
  //         .map(
  //           (e) => DropdownMenuItem(
  //             child: Text(e),
  //             value: e,
  //           ),
  //         )
  //         .toList(),
  //   );
  // }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
