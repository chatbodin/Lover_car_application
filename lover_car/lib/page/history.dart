import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติการใช้งาน'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("datacar").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Image.asset('images/addfuel.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(document["carCompany"] + document["carModel"]),
                    subtitle: Text(document["carPlate"]),
                  ),
                );
              }).toList(),
            );
          }
        },
        
      ),
      
    );
  }
}
