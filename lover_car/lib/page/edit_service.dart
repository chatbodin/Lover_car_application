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
        title: Text('Edit Service'),
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCalendar(),
                    dropDownTypeService(),
                    fieldOdometer(),
                    fieldPrice(),
                    fieldRemark(),
                    buttonEdit()
                  ],
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
            width: 250,
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
                child: Text('Edit'))),
      ],
    );
  }

  Row fieldOdometer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 250,
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
              labelText: 'ระยะไมล์ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row fieldPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 250,
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
              labelText: 'ค่าใช้จ่าย :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row fieldRemark() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 250,
          child: TextFormField(
            onChanged: (value) {
              nonChange = false;
              map['remark'] = value.trim();
            },
            keyboardType: TextInputType.text,
            controller: remarkController,
            decoration: InputDecoration(
              labelText: 'หมายเหตุ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  ListTile buildCalendar() {
    return ListTile(
      title: Text(chooseDateStr),
      trailing: IconButton(
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
          icon: Icon(Icons.calendar_today)),
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
      hint: Text('TypeService'),
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
