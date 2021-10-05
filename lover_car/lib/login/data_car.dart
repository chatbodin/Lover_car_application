import 'package:car_lovers/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// ignore: camel_case_types
class Data_cars extends StatefulWidget {
  @override
  _Data_carsState createState() => _Data_carsState();
}

// ignore: camel_case_types
class _Data_carsState extends State<Data_cars> {
  final formKey = GlobalKey<FormState>();
  Datacar datacars = Datacar();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _datacarCollection =
      FirebaseFirestore.instance.collection("datacar");

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
                title: Text("ข้อมูลรถยนต์"),
                backgroundColor: Colors.blue.shade800,
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
                          "ค่ายรถยนต์",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: "กรุณากรอกด้วยครับ"),
                          onSaved: (String carCompany) {
                            datacars.carCompany = carCompany;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "รุ่นรถยนต์",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator:
                              RequiredValidator(errorText: "กรุณากรอกรุ่นรถ"),
                          onSaved: (String carModel) {
                            datacars.carModel = carModel;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "เลขป้ายทะเบียน",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณากรอกเลขป้ายทะเบียน"),
                          onSaved: (String carPlate) {
                            datacars.carPlate = carPlate;
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
                                  await _datacarCollection.add({
                                    "carCompany": datacars.carCompany,
                                    "carModel": datacars.carModel,
                                    "carPlate": datacars.carPlate
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
