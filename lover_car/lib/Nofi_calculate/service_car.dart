import 'package:car_lovers/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// ignore: camel_case_types
class Ser_cars extends StatefulWidget {
  @override
  _Ser_carsState createState() => _Ser_carsState();
}

// ignore: camel_case_types
class _Ser_carsState extends State<Ser_cars> {
  final formKey = GlobalKey<FormState>();
  DataService dataServices = DataService();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _dataServiceCollection =
      FirebaseFirestore.instance.collection("dataService");

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
                backgroundColor: Colors.green.shade700,
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
                            dataServices.odometer = odometer;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "ค่าบริการ",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          // validator:
                          //     RequiredValidator(errorText: "กรุณากรอกรุ่นรถ"),
                          onSaved: (String price) {
                            dataServices.price = price;
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
                            dataServices.notes = notes;
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
                                  await _dataServiceCollection.add({
                                    "odometer": dataServices.odometer,
                                    "price": dataServices.price,
                                    "notes": dataServices.notes
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
