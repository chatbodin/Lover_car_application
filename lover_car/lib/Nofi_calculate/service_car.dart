// ignore_for_file: unnecessary_import

import 'dart:ffi';
import 'dart:ui';

import 'package:car_lovers/models/dataservice_model.dart';
import 'package:car_lovers/models/user_model.dart';
import 'package:car_lovers/unit/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Ser_cars extends StatefulWidget {
  @override
  _Ser_carsState createState() => _Ser_carsState();
}

// ignore: camel_case_types
class _Ser_carsState extends State<Ser_cars> {
  final formKey = GlobalKey<FormState>();
  DataService dataService = DataService();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // ignore: unused_field
  CollectionReference _datadataServiceCollection =
      FirebaseFirestore.instance.collection("dataService");

  String uidUser;
  DateTime dateTime = DateTime.now();
  String dataTimeStr;

  TextEditingController priceController = TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  List<String> typeServices = [
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
    'เปลี่ยนยาง',
    'ไส้กรองน้ำมันเกียร์',
    'ไส้กรองอากาศ',
    'อื่นๆ'
  ];
  String typeService;
  String lit = '-';

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    findUidUser();

    DateFormat dateFomat = DateFormat('dd-MMM-yyyy HH:mm');
    dataTimeStr = dateFomat.format(dateTime);
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
                title: Text("บริการ"),
                backgroundColor: Colors.green.shade600,
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
                          buildShowTime2(),
                          buildTitle('กรุณาเลือกบริการ'),
                          buildDropdown(),
                          buildTitle('ระยะทางที่แสดงบนไมล์/(Km)'),
                          fieldOdometer(),
                          buildTitle('ค่าบริการ'),
                          fieldPrice(),
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

              Timestamp timestamp = Timestamp.fromDate(dateTime);

              if (typeService != null) {
                DataServiceModel model = DataServiceModel(
                    chooseDate: timestamp,
                    typeService: typeService,
                    odometer: int.parse(odometerController.text),
                    price: int.parse(priceController.text),
                    remark: remarkController.text);

                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(uidUser)
                    .collection('dataService')
                    .doc()
                    .set(model.toMap())
                    .then((value) => Navigator.pop(context));

                formKey.currentState.reset();
              } else {
                normalDialog(context, 'ยังไม่ได้เลือกชนิดบริการ',
                    'กรุณาเลือกชนิดบริการ');
              }
            } //endif
          }),
    );
  }

  TextFormField billdRemark() {
    return TextFormField(
      controller: remarkController,
      decoration: InputDecoration(border: OutlineInputBorder()),
      // validator: RequiredValidator(
      //     errorText: "กรุณากรอกเลขป้ายทะเบียน"),
      onSaved: (String notes) {
        dataService.notes = notes;
      },
    );
  }

  TextFormField fieldPrice() {
    return TextFormField(
      controller: priceController,
      decoration: InputDecoration(border: OutlineInputBorder()),
      validator: RequiredValidator(errorText: "กรุณากรอกค่าบริการ"),
      onSaved: (String price) {
        dataService.price = price;
      },
      keyboardType: TextInputType.number,
    );
  }

  TextFormField fieldOdometer() {
    return TextFormField(
      controller: odometerController,
      decoration: InputDecoration(border: OutlineInputBorder()),
      validator: RequiredValidator(errorText: "กรุณากรอกระยะทาง(Km)"),
      onSaved: (String odometer) {
        dataService.odometer = odometer;
      },
      keyboardType: TextInputType.number,
    );
  }

  DropdownButton<String> buildDropdown() {
    return DropdownButton<String>(
      onChanged: (value) {
        setState(() {
          typeService = value;
        });
      },
      hint: Text('กรุณาเลือกชนิดของบริการ'),
      value: typeService,
      items: typeServices
          .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container buildTitleBig(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.red.shade700),
      ),
    );
  }

  Future<void> chooseDate() async {
    await showDatePicker(
            context: context,
            initialDate: dateTime,
            firstDate: dateTime,
            lastDate: DateTime(dateTime.year + 2))
        .then((value) {
      setState(() {
        dateTime = DateTime(dateTime.year, value.month, value.day,
            dateTime.hour, dateTime.minute);
        DateFormat dateFomat = DateFormat('dd-MMM-yyyy HH:mm');
        dataTimeStr = dateFomat.format(dateTime);
      });
    });
  }

  Widget buildShowTime2() => Card(
        child: ListTile(
          leading: IconButton(
            onPressed: () => chooseDate(),
            icon: Icon(
              Icons.calendar_today_outlined,
              size: 36,
            ),
          ),
          title: Text(
            'วัน /เดือน /ปี   ชั่วโมง',
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            dataTimeStr,
            style: TextStyle(fontSize: 18),
          ),
        ),
      );

  Widget buildshowtime() {
    DateFormat dateFomat = DateFormat('dd-MMM-yyyy HH:mm');
    dataTimeStr = dateFomat.format(dateTime);

    return Card(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => chooseDate(),
                icon: Icon(
                  Icons.calendar_today_outlined,
                  size: 45,
                ),
              ),
              Column(
                children: [
                  Text(
                    'วัน /เดือน /ปี   ชั่วโมง',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    dataTimeStr,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
