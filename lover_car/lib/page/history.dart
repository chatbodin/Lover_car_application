import 'package:car_lovers/models/datafule_model.dart';
import 'package:car_lovers/widget_drawer/signout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUidUser();
    readAllFuel();
  }

  Future<void> readAllFuel() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uidUser)
        .collection('dataFuel')
        .get()
        .then((value) {
      for (var item in value.docs) {
        DataFuleModel model = DataFuleModel.fromMap(item.data());
        setState(() {
          dataFuleModels.add(model);
          fuelWidgets.add(createFuelWidget(model));
        });
      }
    });
  }

  Widget createFuelWidget(DataFuleModel model) => Text(model.remark);

  Future<void> findUidUser() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      setState(() {
        uidUser = event.uid;
        load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: navigatorGroup(context),
      appBar: AppBar(
        title: Text('ประวัติการใช้งาน'),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
      body: load
          ? Center(child: CircularProgressIndicator())
          : ExpansionTile(
              title: Text('เติมน้ำมัน'),
              children: fuelWidgets,
            ),
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

  Row navigatorGroup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/serviceCar'),
                  child: Text('บริการ')),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/addFuel'),
                  child: Text('เติมเชื้อเพลิง')),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/noficationCar'),
                  child: Text('แจ้งเตือน')),
            ],
          ),
        ),
      ],
    );
  }

  String showDateTime(document) {
    Timestamp timestamp = document;
    DateTime dateTime = timestamp.toDate();

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String result = dateFormat.format(dateTime);
    return result;
  }
}
