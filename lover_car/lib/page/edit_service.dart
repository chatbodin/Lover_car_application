// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:car_lovers/models/dataservice_model.dart';
import 'package:car_lovers/unit/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditService extends StatefulWidget {
  final String docId;
  final uidUser;
  const EditService({Key key, @required this.docId, this.uidUser})
      : super(key: key);

  @override
  _EditServiceState createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  String docId;
  String uidUser;
  bool load = true;
  DataServiceModel dataServiceModel;
  DateTime currentDateTime;
  String chooseDateStr;

  TextEditingController odometerController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  bool nonChange = true; //true ไม่เปลี่ยนแปลง

  Map<String, dynamic> map = {};

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
  int indexType;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    docId = widget.docId;
    uidUser = widget.uidUser;
    readCurrentData();
  }

  Future<void> readCurrentData() async {
    // ignore: await_only_futures
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uidUser)
        .collection('dataService')
        .doc(docId)
        .get()
        .then((value) {
      setState(() {
        load = false;
        dataServiceModel = DataServiceModel.fromMap(value.data());
        typeService = dataServiceModel.typeService;

        currentDateTime = dataServiceModel.chooseDate.toDate();
        chooseDateStr = changeDateTimeToString(currentDateTime);

        odometerController.text = dataServiceModel.odometer.toString();
        priceController.text = dataServiceModel.price.toString();
        remarkController.text = dataServiceModel.remark;
      });
    });
  }

  String changeDateTimeToString(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String result = dateFormat.format(dateTime);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขบริการ'),
      ),
      body: load
          ? Container(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: buildCalendar(),
                      )),
                      SizedBox(
                        height: 8,
                      ),
                      Text('กรุณาเลือกชนิดบริการ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      dropDownTypeService(),
                      SizedBox(
                        height: 8,
                      ),
                      Text('ระยะทางที่แสดงบนไมล์/(Km)',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      fieldOdometer(),
                      SizedBox(
                        height: 8,
                      ),
                      Text('ค่าบริการ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      fieldPrice(),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'หมายเหตุ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      fieldRemark(),
                      buttonEdit()
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Row buttonEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            width: 360,
            height: 35,
            child: ElevatedButton(
                onPressed: () async {
                  if (nonChange) {
                    normalDialog(context, 'ไม่มีการเปลี่ยนแปลง',
                        'กรุณาเปลี่ยนแปลงค่าสักอย่าง');
                  } else {
                    print('### map ==>> $map');

                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(uidUser)
                        .collection('dataService')
                        .doc(docId)
                        .update(map)
                        .then((value) => Navigator.pop(context));
                  }
                },
                child: Text(
                  'แก้ไข',
                  style: TextStyle(fontSize: 20),
                ))),
      ],
    );
  }

  Column fieldOdometer() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 360,
          child: TextFormField(
            onChanged: (value) {
              nonChange = false;
              map['odometer'] = int.parse(
                value.trim(),
              );
            },
            keyboardType: TextInputType.number,
            controller: odometerController,
            decoration: InputDecoration(
              //labelText: 'ระยะไมล์ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Column fieldPrice() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 360,
          child: TextFormField(
            onChanged: (value) {
              nonChange = false;
              map['price'] = int.parse(
                value.trim(),
              );
            },
            keyboardType: TextInputType.number,
            controller: priceController,
            decoration: InputDecoration(
              // labelText: 'ค่าใช้จ่าย :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Column fieldRemark() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 360,
          child: TextFormField(
            onChanged: (value) {
              nonChange = false;
              map['remark'] = value.trim();
            },
            keyboardType: TextInputType.text,
            controller: remarkController,
            decoration: InputDecoration(
              //labelText: 'หมายเหตุ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  ListTile buildCalendar() {
    return ListTile(
      title: Text(
        'วัน /เดือน /ปี',
        style: TextStyle(fontSize: 18),
      ),
      //subtitle: Text(chooseDateStr),
      subtitle: Text(chooseDateStr, style: TextStyle(fontSize: 18)),
      leading: IconButton(
          onPressed: () async {
            await showDatePicker(
                    context: context,
                    initialDate: currentDateTime,
                    firstDate: DateTime(
                        currentDateTime.year, currentDateTime.month - 2),
                    lastDate: DateTime(currentDateTime.year + 2))
                .then((value) => {
                      setState(() {
                        currentDateTime = value;
                        chooseDateStr = changeDateTimeToString(currentDateTime);
                        nonChange = false;

                        Timestamp timestamp =
                            Timestamp.fromDate(currentDateTime);
                        map["chooseDate"] = timestamp;
                      })
                    });
          },
          icon: Icon(
            Icons.calendar_today,
            size: 36,
          )),
    );
  }

  DropdownButton<String> dropDownTypeService() {
    return DropdownButton<String>(
      onChanged: (value) {
        setState(() {
          typeService = value;
          nonChange = false;
          map['typeService'] = typeService;
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
}
