import 'package:car_lovers/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  CollectionReference _datanoficationCollection =
      FirebaseFirestore.instance.collection("datanofication");

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
                title: Text("แจ้งเตือน"),
                backgroundColor: Colors.orange,
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
                            datanofication.odometer = odometer;
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
                            datanofication.notes = notes;
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
                                  await _datanoficationCollection.add({
                                    "odometer": datanofication.odometer,
                                    "notes": datanofication.notes
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
