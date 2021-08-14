import 'package:flutter/material.dart';

class Bcpoil extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.black),
              height: 45,
              child: Center(
                child: Text('บางจาก (BCP)',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    )),
              )),
          Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 85,
              child: Center(
                child: Image(image: AssetImage('images/bcp.png')),
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.red.shade700,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'น้ำมัน',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  'ราคาน้ำมัน(บาท/ลิตร)',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์95',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '29.45',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์91',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '29.18',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์E20',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '27.94',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์E85',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '22.64',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'เบนซิล95',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '-',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซลB7',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '28.99',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซล',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '25.99',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซลB20',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '25.74',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซลพรีเมี่ยม',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '33.76',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
            ),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สNGV',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '14.55',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.green.shade700),
              height: 40,
              child: Center(
                child: Text('ราคาน้ำมันเสาร์ 9 สิงหาคม 2564',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              )),
          Container(
              decoration: BoxDecoration(color: Colors.black54),
              height: 90,
              child: Center(
                child: Text(
                    '***ราคาขายปลีกมาตรฐานในเขต กทม. และปริมณฑล ไม่รวมภาษีบำรุงท้องถิ่น***',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              )),
          Container(
            decoration: BoxDecoration(color: Colors.black54),
            height: 70,
          ),
        ],
      ),
    );
  }
}
