// ignore_for_file: unused_import, non_constant_identifier_names, unnecessary_import, await_only_futures, duplicate_ignore

import 'dart:ffi';

import 'dart:ui';
import 'package:car_lovers/Nofi_calculate/add_fuel.dart';
import 'package:car_lovers/models/datafule_model.dart';
import 'package:car_lovers/models/dataservice_model.dart';
import 'package:car_lovers/page/edit_addfuel.dart';
import 'package:car_lovers/page/edit_service.dart';
import 'package:car_lovers/widget_drawer/signout.dart';
import 'package:car_lovers/widgets/show_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String uidUser;
  bool load = true;

  List<DataFuleModel> dataFuleModels = [];
  List<Widget> fuelWidgets = [];
  List<String> docIdFuels = [];

  List<DataServiceModel> dataServiceModels = [];
  List<Widget> dataServiceWidgets = [];
  List<String> docIdServices = [];

//about Nofi

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings androidInitializationSettings;
  InitializationSettings initializationSettings;

  DateTime serviceNotiDateTime;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    initialNofication();
    findUidUser();
  }

  Future<void> initialNofication() async {
    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      print('####payload ==>> $payload');
    }
  }

  Future<void> readAllFuel() async {
    if (dataFuleModels.isNotEmpty) {
      dataFuleModels.clear();
      fuelWidgets.clear();
      docIdFuels.clear();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uidUser)
        .collection('dataFuel')
        .get()
        .then((value) {
      int indexDataAddFuel = 0;
      for (var item in value.docs) {
        DataFuleModel model = DataFuleModel.fromMap(item.data());
        print('### uidUser = $uidUser remark ==>${model.remark}');
        setState(() {
          dataFuleModels.add(model);
          fuelWidgets.add(createFuelWidget(model, indexDataAddFuel));
          docIdFuels.add(item.id);
        });
        indexDataAddFuel++;
      }
    });
  }

  Widget createFuelWidget(DataFuleModel model, int indexDataAddFuel) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(model.typeFule),
                  Text('${model.priceAll} บาท'),
                ],
              ),
              Column(
                children: [
                  Text(changeTimeToString(model.chooseDate)),
                  Text('${model.odometer} Km'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAddFuel(
                          docId: docIdFuels[indexDataAddFuel],
                          uidUser: uidUser,
                        ),
                      ),
                    ).then((value) => readAllFuel()),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print(
                          '### You Delete indexDataAddFuel ==> $indexDataAddFuel');
                      confirmDeleteAddFuel(indexDataAddFuel);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> findUidUser() async {
    // ignore: await_only_futures
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      setState(() {
        uidUser = event.uid;
        load = false;
        readAllFuel();
        readAllDataService();
      });
    });
  }

  Future<void> readAllDataService() async {
    if (dataServiceModels.isNotEmpty) {
      dataServiceModels.clear();
      dataServiceWidgets.clear();
      docIdServices.clear();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uidUser)
        .collection('dataService')
        .orderBy('chooseDate')
        .get()
        .then((value) {
      int indexDataService = 0;
      for (var item in value.docs) {
        print('#### item ==> ${item.data()}');
        DataServiceModel model = DataServiceModel.fromMap(item.data());
        setState(() {
          dataServiceModels.add(model);
          dataServiceWidgets
              .add(createDataServiceWidget(model, indexDataService));
          docIdServices.add(item.id);
        });
        indexDataService++;
      }
      DateTime currentDateTime = DateTime.now();
      serviceNotiDateTime = dataServiceModels[0].chooseDate.toDate();

      serviceNotiDateTime = DateTime(
        serviceNotiDateTime.year,
        serviceNotiDateTime.month,
        serviceNotiDateTime.day,
        currentDateTime.hour,
        currentDateTime.minute,
        currentDateTime.second + 20,
      );
      print('#### serviceNotiDate ==>> $serviceNotiDateTime');
      myNotification();
    });
  }

  Widget createDataServiceWidget(
          DataServiceModel model, int indexDataService) =>
      Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(model.typeService),
                  Text("${model.price} บาท"),
                ],
              ),
              Column(
                children: [
                  Text(changeTimeToString(model.chooseDate)),
                  Text("${model.odometer} Km"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditService(
                            docId: docIdServices[indexDataService],
                            uidUser: uidUser,
                          ),
                        )).then((value) => readAllDataService()),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print(
                          '### You Delete indexDataService ==>$indexDataService');
                      confirmDeleteService(indexDataService);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: builderActionsheet);
        },
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: Text('ประวัติการใช้งาน'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
      body: load ? Center(child: CircularProgressIndicator()) : showContent(),
    );
  }

  SingleChildScrollView showContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                leading: ShowImage(path: 'images/servicecar.png'),
                title: Text('บริการ'),
                children: dataServiceWidgets,
                // children: fuelWidgets,
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                leading: ShowImage(path: 'images/addfuel.png'),
                title: Text('เติมน้ำมัน'),
                children: fuelWidgets,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              myNotification();
            },
            child: Text('Test Nofication'),
          ),
        ],
      ),
    );
  }

  Future<void> myNotification() async {
    // ignore: unused_local_variable
    DateTime notiDateTime = DateTime.now().add(Duration(seconds: 20));
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channelId2',
      'Noti title2',
      'Noti message2',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
      1,
      'Nofi title',
      'Nofi Message',
      serviceNotiDateTime,
      notificationDetails,
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> buildContent() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(uidUser)
          .collection('dataFuel')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                child: Card(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Image.asset('images/addfuel.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text("เติมเชื้อเพลิง"),
                    subtitle: Text(document["price"]),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(showDateTime(document['chooseDate'])),
                        Text('${document['odometer']} km'),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  // Row FloatingActionButton(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.symmetric(horizontal: 16),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             ElevatedButton(
  //                 onPressed: () =>
  //                     Navigator.pushNamed(context, '/serviceCar').then(
  //                       (value) => readAllDataService(),
  //                     ),
  //                 child: Text('บริการ')),
  //             SizedBox(
  //               width: 4,
  //             ),
  //             ElevatedButton(
  //                 onPressed: () =>
  //                     Navigator.pushNamed(context, '/addFuel').then(
  //                       (value) => readAllFuel(),
  //                     ),
  //                 child: Text('เติมเชื้อเพลิง')),
  //             SizedBox(
  //               width: 4,
  //             ),
  //             ElevatedButton(
  //                 onPressed: () =>
  //                     Navigator.pushNamed(context, '/noficationCar'),
  //                 child: Text('แจ้งเตือน')),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  String showDateTime(document) {
    Timestamp timestamp = document;
    DateTime dateTime = timestamp.toDate();

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String result = dateFormat.format(dateTime);
    return result;
  }

  String changeTimeToString(Timestamp chooseDate) {
    DateTime dataTime = chooseDate.toDate();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String result = dateFormat.format(dataTime);
    return result;
  }

  Future<void> confirmDeleteService(
    int indexDataService,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: Icon(
            Icons.delete,
            size: 35,
            color: Colors.red,
          ),
          title: Text('ต้องการจะลบ ?'),
          subtitle: Text(dataServiceModels[indexDataService].typeService),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(uidUser)
                  .collection('dataService')
                  .doc(docIdServices[indexDataService])
                  .delete()
                  .then((value) {
                Navigator.pop(context);
                readAllDataService();
              });
            },
            child: Text(
              'ลบ',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ยกเลิก',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget builderActionsheet(BuildContext context) => GestureDetector(
        child: Container(
          height: 180,
          child: ListView(
            children: [
              Container(
                height: 50,
                child: CupertinoActionSheetAction(
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Image.asset('images/servicecar.png')),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            'บริการ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/serviceCar').then(
                    (value) => readAllDataService(),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Divider(color: Color(0xFFD1DDE2))),
              Container(
                height: 50,
                child: CupertinoActionSheetAction(
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Image.asset('images/addfuel.png')),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            'เติมเชื้อเพลิง',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/addFuel').then(
                    (value) => readAllFuel(),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Divider(color: Color(0xFFD1DDE2))),
              Container(
                height: 50,
                child: CupertinoActionSheetAction(
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Image.asset('images/remider.png')),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            'แจ้งเตือน',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/noficationCar'),
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> confirmDeleteAddFuel(
    int indexDataAddFuel,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: Icon(
            Icons.delete,
            size: 36,
            color: Colors.red,
          ),
          title: Text('ต้องการจะลบ ?'),
          subtitle: Text(dataFuleModels[indexDataAddFuel].typeFule),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Navigator.pop(context);
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(uidUser)
                  .collection('dataFuel')
                  .doc(docIdFuels[indexDataAddFuel])
                  .delete()
                  .then((value) {
                Navigator.pop(context);
                readAllFuel();
              });
            },
            child: Text(
              'ลบ',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ยกเลิก',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
