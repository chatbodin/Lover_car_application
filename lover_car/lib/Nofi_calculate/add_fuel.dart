// ignore_for_file: unnecessary_import

import 'dart:ffi';
import 'dart:ui';

import 'package:car_lovers/models/datafule_model.dart';
import 'package:car_lovers/models/user_model.dart';
import 'package:car_lovers/unit/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class AddFuel_car extends StatefulWidget {
  @override
  _AddFuel_carState createState() => _AddFuel_carState();
}

// ignore: camel_case_types
class _AddFuel_carState extends State<AddFuel_car> {
  final formKey = GlobalKey<FormState>();
  Datafuel dataFuel = Datafuel();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // ignore: unused_field
  CollectionReference _datadataFuelCollection =
      FirebaseFirestore.instance.collection("dataFuel");

  String uidUser;
  DateTime dateTime = DateTime.now();
  String dataTimeStr;

  TextEditingController priceFulePerLitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  List<String> typeFuels = [
    'แก๊สโซฮอล์95',
    'แก๊สโซฮอล์91'
        'แก๊สโซฮอล์E20',
    'แก๊สโซฮอล์E85',
    'เบนซิน95',
    'ดีเซล',
    'ดีเซลB7',
    'ดีเซลB20',
    'ดีเซลพรีเมี่ยม',
    'แก๊สNGV',
    'อื่นๆ'
  ];

  String typeFuel;
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
                          buildShowTime2(),
                          buildTitle('บริการ'),
                          buildDropdown(),
                          buildTitle('ระยะทางที่แสดงบนไมล์/(Km)'),
                          fieldOdometer(),
                          buildPriceGroup(),
                          buildTitle("จำนวนลิตร"),
                          buildTitleBig(lit),
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

              if (typeFuel != null) {
                DataFuleModel model = DataFuleModel(
                    chooseDate: timestamp,
                    typeFule: typeFuel,
                    odometer: int.parse(odometerController.text),
                    pricePerLit: double.parse(priceController.text),
                    priceAll: int.parse(priceController.text),
                    lit: double.parse(lit),
                    remark: remarkController.text);

                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(uidUser)
                    .collection('dataFuel')
                    .doc()
                    .set(model.toMap())
                    .then((value) => Navigator.pop(context));
                formKey.currentState.reset();
              } else {
                normalDialog(context, 'ยังไม่ได้เลือกชนิดเชื้อเพลิง',
                    'กรุณาเลือกชนิดเชื้อเพลิง');
              }
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
        dataFuel.notes = notes;
      },
    );
  }

  Row buildPriceGroup() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle('ราคาน้ำมัน/ลิตร'),
              fieldPriceFluePerLit(),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle('ค่าใช้จ่ายทั้งหมด'),
              fieldPrice(),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(top: 26),
            child: IconButton(
                onPressed: () {
                  String pricePerLit = priceFulePerLitController.text;
                  String priceAll = priceController.text;
                  print('### pricePerLit = $pricePerLit,priceAll =$priceAll');
                  double pricePerListInt = double.parse(pricePerLit.trim());
                  int priceAllInt = int.parse(priceAll.trim());
                  double litDouble = priceAllInt / pricePerListInt;
                  print('### listDou ==> $litDouble');

                  NumberFormat numberFormat = NumberFormat('##0.0#', 'en_US');

                  setState(() {
                    lit = numberFormat.format(litDouble);
                  });
                },
                icon: Icon(
                  Icons.calculate,
                  size: 30,
                )),
          ),
        )
      ],
    );
  }

  TextFormField fieldPrice() {
    return TextFormField(
      controller: priceController,
      decoration: InputDecoration(border: OutlineInputBorder()),
      validator: RequiredValidator(errorText: "ค่าใช้จ่ายทั้งหมด"),
      onSaved: (String price) {
        dataFuel.price = price;
      },
      keyboardType: TextInputType.number,
    );
  }

  TextFormField fieldPriceFluePerLit() {
    return TextFormField(
      controller: priceFulePerLitController,
      decoration: InputDecoration(border: OutlineInputBorder()),
      validator: RequiredValidator(errorText: "ราคาน้ำมัน/ลิตร"),
      onSaved: (String priceFulePerList) {
        dataFuel.preiceFulePerLit = priceFulePerList;
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
        dataFuel.odometer = odometer;
      },
      keyboardType: TextInputType.number,
    );
  }

  DropdownButton<String> buildDropdown() {
    return DropdownButton<String>(
      onChanged: (value) {
        setState(() {
          typeFuel = value;
        });
      },
      hint: Text('กรุณาเลือกชนิดน้ำมันเชื้อเพลิง'),
      value: typeFuel,
      items: typeFuels
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
