// ignore_for_file: unused_import, await_only_futures, unused_local_variable, missing_required_param

import 'package:car_lovers/models/datafule_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditAddFuel extends StatefulWidget {
  final String docId;
  final String uidUser;
  const EditAddFuel({Key key, @required this.docId, @required this.uidUser})
      : super(key: key);

  @override
  State<EditAddFuel> createState() => _EditAddFuelState();
}

class _EditAddFuelState extends State<EditAddFuel> {
  String docId;
  String uidUser;

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
  int indexType;
  bool load = true;
  DataFuleModel dataAddFuelModel;

  @override
  void initState() {
    super.initState();
    docId = widget.docId;
    uidUser = widget.uidUser;
    readCurrendData();
  }

  Future<void> readCurrendData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uidUser)
        .collection('dataFuel')
        .doc(docId)
        .get()
        .then((value) {
      setState(() {
        load = false;
        dataAddFuelModel = DataFuleModel.fromMap(value.data());
        typeFuel = dataAddFuelModel.typeFule;
        int i = 0;
        for (var item in typeFuels) {
          if (typeFuel == item) {
            indexType = i;
          }
          i++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขเติมน้ำมัน'),
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : DropdownButton<String>(
              onChanged: (value) {
                setState(() {
                  typeFuel = value;
                });
              },
              hint: Text('ชนิดเชื้อเพลิง'),
              value: typeFuel,
              items: typeFuels
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
