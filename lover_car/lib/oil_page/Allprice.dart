import 'package:flutter/material.dart';

class Allprice extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
              decoration: BoxDecoration(color: Colors.black),
              height: 45,
              child: Center(
                child: Text('ราคาน้ำมันถูกสุดวันนี้',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    )),
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.red.shade700,
            ),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'น้ำมัน',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  'ราคาน้ำมัน(บาท/ลิตร)',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์95',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '29.25',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์91',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '28.98',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์E20',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '27.74',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สโซฮอล์E85',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '22.84',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'เบนซิล95',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '36.66',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซลB7',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '29.09',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซล',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '26.09',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซลB20',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '25.84',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ดีเซลพรีเมี่ยม',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '33.86',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'แก๊สNGV',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Expanded(
                    child: Text(
                  '15.48',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.green.shade700),
              height: 40,
              child: Center(
                child: Text('ราคาน้ำมันเสาร์ 9 กันยายน 2564',
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
