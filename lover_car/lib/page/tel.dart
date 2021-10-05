import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:car_lovers/widget_drawer/signout.dart';
import 'package:url_launcher/url_launcher.dart';

class Tel extends StatefulWidget {
  @override
  _TelState createState() => _TelState();
}

class _TelState extends State<Tel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เบอร์ฉุกเฉิน'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            height: 45,
            child: Text('กรณีเหตุด่วนเหตุร้าย',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          buildButton(),
          buildButton0(),
          buildButton1(),
          buildButton2(),
          buildButton3(),
          buildButton4(),
          buildButton5(),
          buildButton05(),
          Container(
            decoration: BoxDecoration(color: Colors.orange.shade700),
            height: 45,
            child: Text('กรณีเจ็บป่วย',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          buildButton6(),
          buildButton7(),
          buildButton8(),
          Container(
            decoration: BoxDecoration(color: Colors.green.shade700),
            height: 45,
            child: Text('กรณีแจ้งเหตุจราจร-ขอความช่วยเหลือ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          buildButton9(),
          buildButton10(),
          buildButton11(),
          Container(
            height: 80,
          ),
        ],
      ),
      drawer: Drawer(
        child: MySignOut(),
      ),
    );
  }
}

Widget buildButton() {
  final number = '191';
  return ListTile(
      title: Text('เหตุด่วนเหตุร้าย', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton0() {
  final number = '192';
  return ListTile(
      title: Text('ภัยพิบัติแห่งชาติ', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton1() {
  final number = '199';
  return ListTile(
      title: Text('เหตุอัคคีภัย', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton2() {
  final number = '1196';
  return ListTile(
      title: Text('อุบัติเหตุทางน้ำ', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton3() {
  final number = '1193';
  return ListTile(
      title: Text('ตำรวจทางหลวง', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton4() {
  final number = '1192';
  return ListTile(
      title: Text('แจ้งรถหาย', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton5() {
  final number = '1155';
  return ListTile(
      title: Text('ตำรวจท่องเที่ยว', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton05() {
  final number = '1300';
  return ListTile(
      title: Text('ศูนย์ประชาบดี เพื่อแจ้งบุคคลสูญหาย',
          style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton6() {
  final number = '1554';
  return ListTile(
      title: Text('หน่วยกู้ชีพ(วชิรพยาบาล)', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton7() {
  final number = '1669';
  return ListTile(
      title: Text('หน่วยแพทย์ฉุกเฉิน', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton8() {
  final number = '1646';
  return ListTile(
      title: Text('หน่วยแพทย์ฉุกเฉิน(กทม.)', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton9() {
  final number = '1137';
  return ListTile(
      title: Text('กองบังคับการตำรวจจราจร(จส.100)',
          style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton10() {
  final number = '1197';
  return ListTile(
      title: Text('ประสบเหตุทางจราจร', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}

Widget buildButton11() {
  final number = '1586';
  return ListTile(
      title: Text('สายด่วนกรมทางหลาง', style: TextStyle(fontSize: 18)),
      subtitle: Text(number, style: TextStyle(fontSize: 16, color: Colors.red)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('โทร', style: TextStyle(fontSize: 17)),
        onPressed: () async {
          launch('tel://$number');
          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ));
}
