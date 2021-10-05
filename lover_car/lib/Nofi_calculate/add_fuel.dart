import 'package:car_lovers/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  CollectionReference _datadataFuelCollection =
      FirebaseFirestore.instance.collection("dataFuel");

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
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ระยะทาง/(Km)",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณากรอกระยะทาง(Km)"),
                          onSaved: (String odometer) {
                            dataFuel.odometer = odometer;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "ค่าใช้จ่ายทั้งหมด",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: "ค่าใช้จ่ายทั้งหมด"),
                          onSaved: (String price) {
                            dataFuel.price = price;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "อัตราสิ้นเปลือง(กม./ลิตร)",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ระยะทางที่วิ่งได้(กม.)",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "ระยะทางที่วิ่งได้/กิโลเมตร"),
                          onSaved: (String alldistance) {
                            dataFuel.alldistance = alldistance;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "น้ำมันที่เติมกลับ(ลิตร)",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "จำนวนน้ำมันที่เติม/ลิตร"),
                          onSaved: (String summary) {
                            dataFuel.summary = summary;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "อัตราสิ้นเปลือง(กม./ลิตร)",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          // validator:
                          //     RequiredValidator(errorText: "กรุณากรอกรุ่นรถ"),
                          onSaved: (String ratefuel) {
                            dataFuel.ratefuel = ratefuel;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "หมายเหตุ",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          // validator: RequiredValidator(
                          //     errorText: "กรุณากรอกเลขป้ายทะเบียน"),
                          onSaved: (String notes) {
                            dataFuel.notes = notes;
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              child: Text(
                                "บันทึก",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  await _datadataFuelCollection.add({
                                    "odometer": dataFuel.odometer,
                                    "price": dataFuel.price,
                                    "alldistance": dataFuel.alldistance,
                                    "summary": dataFuel.summary,
                                    "ratefuel": dataFuel.ratefuel,
                                    "notes": dataFuel.notes
                                  });
                                  formKey.currentState.reset();
                                }
                              }),
                        )
                      ],
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
}
