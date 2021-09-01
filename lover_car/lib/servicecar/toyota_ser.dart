import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class toyotaserphayao extends StatefulWidget {
  @override
  _toyotaserphayaoState createState() => _toyotaserphayaoState();
}

class _toyotaserphayaoState extends State<toyotaserphayao> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker oneMarker = Marker(
        markerId: MarkerId('โตโยต้า พะเยา'),
        position: LatLng(19.14530, 99.91185),
        infoWindow: InfoWindow(title: 'โตโยต้า พะเยา'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('Toyota Phayao Company Limited'),
        position: LatLng(19.54572, 100.29691),
        infoWindow: InfoWindow(title: 'Toyota Phayao Company Limited'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(19.403858017494922, 100.1695999978603),
                    zoom: 9),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: markers.map((e) => e).toSet(),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 140,
                  //width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โตโยต้า พะเยา',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 403/11 ถ.พหลโยธิน ต.แม่ต๋ำ อ.เมือง จ.พะเยา 56000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-41-4999   Fax:(054)-41-2040',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 140,
                  //width: double.infinity,
                  color: Colors.green.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Toyota Phayao Company Limited',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 73 หมู่.3 ถ.เชียงคำ-เทิง ต.หย่วน อ.เชียงคำ จ.พะเยา 56110',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-41-5184   Fax:(054)-41-5186',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

// class toyotaserphayao2 extends StatefulWidget {
//   @override
//   _toyotaserphayao2State createState() => _toyotaserphayao2State();
// }

// class _toyotaserphayao2State extends State<toyotaserphayao2> {
//   Completer<GoogleMapController> _controller = Completer();
//   List<Marker> markerss = [];

//   @override
//   void initState() {
//     intilize();
//     super.initState();
//   }

//   intilize() {
//     Marker oneMarker = Marker(
//         markerId: MarkerId('Toyota Phayao Company Limited'),
//         position: LatLng(19.54572, 100.29691),
//         infoWindow: InfoWindow(title: 'Toyota Phayao Company Limited'),
//         icon: BitmapDescriptor.defaultMarkerWithHue(
//           BitmapDescriptor.hueRed,
//         ));
//     markerss.add(oneMarker);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey.shade100,
//         body: ListView(
//           children: [
//             Container(
//               height: 550,
//               width: double.infinity,
//               child: GoogleMap(
//                 mapType: MapType.normal,
//                 myLocationButtonEnabled: true,
//                 zoomControlsEnabled: true,
//                 initialCameraPosition: CameraPosition(
//                     target: LatLng(19.14530, 99.91185), zoom: 12),
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
//                 },
//                 markers: markerss.map((e) => e).toSet(),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                   height: 140,
//                   width: double.infinity,
//                   color: Colors.white,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Toyota Phayao Company Limited',
//                         style: TextStyle(
//                             fontSize: 23, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'ที่อยู่ 73 หมู่.3 ถ.เชียงคำ-เทิง ต.หย่วน อ.เชียงคำ จ.พะเยา 56110',
//                         style: TextStyle(fontSize: 21),
//                       ),
//                       Text(
//                         'โทร:(054)-41-5184   Fax:(054)-41-5186',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         ));
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////

class toyotaserlampang extends StatefulWidget {
  @override
  _toyotaserlampangState createState() => _toyotaserlampangState();
}

class _toyotaserlampangState extends State<toyotaserlampang> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markerss = [];

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker oneMarker = Marker(
        markerId:
            MarkerId('บริษัท โตโยต้านอร์ทเทิร์น(ลำปาง) จำกัด(สำนักงานใหญ่)'),
        position: LatLng(18.276361137455783, 99.48327508465738),
        infoWindow: InfoWindow(
            title: 'บริษัท โตโยต้านอร์ทเทิร์น(ลำปาง) จำกัด(สำนักงานใหญ่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท โตโยต้านอร์ทเทิร์น ชัวร์ ลำปาง'),
        position: LatLng(18.26196, 99.46622),
        infoWindow: InfoWindow(title: 'บริษัท โตโยต้านอร์ทเทิร์น ชัวร์ ลำปาง'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('โตโยต้า นอร์ทเทิร์น สาขาบ้านต้า'),
        position: LatLng(18.25097, 99.45423),
        infoWindow: InfoWindow(title: 'โตโยต้า นอร์ทเทิร์น สาขาบ้านต้า'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId('โตโยต้า นอร์ทเทิร์น สาขาเถิน'),
        position: LatLng(17.61838, 99.23336),
        infoWindow: InfoWindow(title: 'โตโยต้า นอร์ทเทิร์น สาขาเถิน'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));

    markerss.add(oneMarker);
    markerss.add(twoMarker);
    markerss.add(threeMarker);
    markerss.add(fourMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          children: [
            Container(
              height: 520,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(17.941389, 99.350345), zoom: 9.7),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: markerss.map((e) => e).toSet(),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท โตโยต้าลำปาง จำกัด (สำนักงานใหญ่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่ 110/5 ถ.ซุปเปอร์ไฮเวย์ลำปาง-งาว ต.พระบาท อ.เมือง จ.ลำปาง 52000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-355-555 Fax:054-355-559',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.green.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท โตโยต้านอร์ทเทิร์น ชัวร์ ลำปาง',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่ 24 ถนน ซุปเปอร์ไฮเวย์สาย ลำปาง - งาว ตำบลชมพู อำเภอเมืองลำปาง จังหวัดลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-333-222 Fax:054-333-332',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.blue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โตโยต้า นอร์ทเทิร์น สาขาบ้านต้า',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่ 456 หมู่ 1 ตำบลชมพู อำเภอเมืองลำปาง จังหวัดลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-250-700 Fax:054-250-705',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.orange.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โตโยต้า นอร์ทเทิร์น สาขาเถิน',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่ 219 หมู่ 12 ต.ล้อมแรด อ.เถิน จ.ลำปาง 52160',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-244-177 Fax:054-244-179',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

///////////////////////////////////////////////////////////////////////////////

