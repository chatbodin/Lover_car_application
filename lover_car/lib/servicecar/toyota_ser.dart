import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class toyotaserphayao extends StatefulWidget {
  @override
  _toyotaserphayaoState createState() => _toyotaserphayaoState();
}

// ignore: camel_case_types
class _toyotaserphayaoState extends State<toyotaserphayao> {
  Completer<GoogleMapController> _controller = Completer();
   GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

   Position currentPostion;
  var geoLocator = Geolocator();
  void locatePositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostion = position;
    // ignore: unused_local_variable
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 10);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(19.02972089776868, 99.93090891925993), zoom: 12);

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
              height: 500,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  newGoogleMapController = controller;
                  locatePositon();
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

/////////////////////////////////////////////////////////////////////////////////////////////

// ignore: camel_case_types
class toyotaserlampang extends StatefulWidget {
  @override
  _toyotaserlampangState createState() => _toyotaserlampangState();
}

// ignore: camel_case_types
class _toyotaserlampangState extends State<toyotaserlampang> {
  Completer<GoogleMapController> _controller = Completer();
   GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

   Position currentPostion;
  var geoLocator = Geolocator();
  void locatePositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostion = position;
    // ignore: unused_local_variable
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 10);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(19.02972089776868, 99.93090891925993), zoom: 12);

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
        position: LatLng(18.26207, 99.46643),
        infoWindow: InfoWindow(title: 'บริษัท โตโยต้านอร์ทเทิร์น ชัวร์ ลำปาง'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('โตโยต้า นอร์ทเทิร์น สาขาบ้านต้า'),
        position: LatLng(18.25098, 99.45425),
        infoWindow: InfoWindow(title: 'โตโยต้า นอร์ทเทิร์น สาขาบ้านต้า'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId('โตโยต้า นอร์ทเทิร์น สาขาเถิน'),
        position: LatLng(17.61743, 99.23331),
        infoWindow: InfoWindow(title: 'โตโยต้า นอร์ทเทิร์น สาขาเถิน'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);
    markers.add(threeMarker);
    markers.add(fourMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  newGoogleMapController = controller;
                  locatePositon();
                },
                markers: markers.map((e) => e).toSet(),
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
                        'ที่อยู่: 24 ถ.ซุปเปอร์ไฮเวย์สาย ลำปาง - งาว ต.ชมพู อ.เมืองลำปาง จ.ลำปาง 52100',
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
                        'ที่อยู่: 456 หมู่ 1 ต.ชมพู อ.เมืองลำปาง จ.ลำปาง 52100',
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
                        'ที่อยู่: 219 หมู่ 12 ต.ล้อมแรด อ.เถิน จ.ลำปาง 52160',
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

// ignore: camel_case_types
class toyotaserlamphun extends StatefulWidget {
  @override
  _toyotaserlamphunState createState() => _toyotaserlamphunState();
}

// ignore: camel_case_types
class _toyotaserlamphunState extends State<toyotaserlamphun> {
  Completer<GoogleMapController> _controller = Completer();
   GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

   Position currentPostion;
  var geoLocator = Geolocator();
  void locatePositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostion = position;
    // ignore: unused_local_variable
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 10);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(19.02972089776868, 99.93090891925993), zoom: 12);

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker oneMarker = Marker(
        markerId: MarkerId('บริษัท โตโยต้า ล้านนา จำกัด (ลำพูน)'),
        position: LatLng(18.56975, 99.04383),
        infoWindow: InfoWindow(title: 'บริษัท โตโยต้า ล้านนา จำกัด (ลำพูน)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('โตโยต้าเชียงใหม่ สาขาลำพูน'),
        position: LatLng(18.61368, 99.02734),
        infoWindow: InfoWindow(title: 'โตโยต้าเชียงใหม่ สาขาลำพูน'),
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
              height: 500,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  newGoogleMapController = controller;
                  locatePositon();
                },
                markers: markers.map((e) => e).toSet(),
              ),
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
                        'บริษัท โตโยต้า ล้านนา จำกัด (ลำพูน)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 163 หมู่ 10 ถ.ซุปเปอร์ไฮเวย์ ต.บ้านกลาง อ.เมืองลำพูน จ.ลำพูน 51000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(053)-58-2111 Fax:(053)-58-1666',
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
                        'โตโยต้าเชียงใหม่ สาขาลำพูน',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 99/1 หมู่ 1 ถ.เชียงใหม่-ลำพูน ต.เหมืองง่า อ.เมือง จ.ลำพูน 51000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(053)-56-2777 Fax:(053)-56-0626',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

///////////////////////////////////////////////////////////////////////////

// ignore: camel_case_types
class toyotaserPhrae extends StatefulWidget {
  @override
  _toyotaserPhraeState createState() => _toyotaserPhraeState();
}

// ignore: camel_case_types
class _toyotaserPhraeState extends State<toyotaserPhrae> {
  Completer<GoogleMapController> _controller = Completer();
   GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

   Position currentPostion;
  var geoLocator = Geolocator();
  void locatePositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostion = position;
    // ignore: unused_local_variable
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 10);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(19.02972089776868, 99.93090891925993), zoom: 12);

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker oneMarker = Marker(
        markerId: MarkerId('โตโยต้าแพร่หล่อตระกูล'),
        position: LatLng(18.09111, 100.131008),
        infoWindow: InfoWindow(title: 'โตโยต้าแพร่หล่อตระกูล'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    Marker twoMarker = Marker(
        markerId:
            MarkerId('บริษัท โตโยต้าแพร่หล่อตระกูล ผู้จำหน่ายโตโยต้า จำกัด'),
        position: LatLng(18.143594459616274, 100.14167372015744),
        infoWindow: InfoWindow(
            title: 'บริษัท โตโยต้าแพร่หล่อตระกูล ผู้จำหน่ายโตโยต้า จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('โตโยต้าแพร่หล่อตระกูล สำนักงานใหญ่'),
        position: LatLng(18.09395, 100.13094),
        infoWindow: InfoWindow(title: 'โตโยต้าแพร่หล่อตระกูล สำนักงานใหญ่'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId('บจก. โตโยต้าแพร่หล่อตระกูล'),
        position: LatLng(18.13959, 100.14630),
        infoWindow: InfoWindow(title: 'บจก. โตโยต้าแพร่หล่อตระกูล'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));
    Marker fiveMarker = Marker(
        markerId: MarkerId('โชว์รูมโตโยต้า'),
        position: LatLng(18.09106, 100.13010),
        infoWindow: InfoWindow(title: 'โชว์รูมโตโยต้า'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRose,
        ));
    Marker sixMarker = Marker(
        markerId: MarkerId('Toyota Sure: โตโยต้า แพร่หล่อตระกูล ยูสคาร์'),
        position: LatLng(18.10022520127786, 100.14592729777972),
        infoWindow:
            InfoWindow(title: 'Toyota Sure: โตโยต้า แพร่หล่อตระกูล ยูสคาร์'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);
    markers.add(threeMarker);
    markers.add(fourMarker);
    markers.add(fiveMarker);
    markers.add(sixMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  newGoogleMapController = controller;
                  locatePositon();
                },
                markers: markers.map((e) => e).toSet(),
              ),
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
                        'โตโยต้าแพร่หล่อตระกูล',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 200 ถ.ยันตรกิจโกศล ต.โรงกาด อ.สูงเม่น จ.แพร่ 54130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-660-111',
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
                        'บริษัท โตโยต้าแพร่หล่อตระกูล ผู้จำหน่ายโตโยต้า จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: ต.ในเวียง อ.เมืองแพร่ จ.แพร่ 54000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-660 -116',
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
                  color: Colors.red.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โตโยต้าแพร่หล่อตระกูล สำนักงานใหญ่',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: โรงกาด อ.สูงเม่น แพร่ 54130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-660-111',
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
                        'บจก. โตโยต้าแพร่หล่อตระกูล',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: ซ.เจริญเมือง ต.เมืองแพร่ อ.เมืองแพร่ จ.แพร่ 54000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-511-088',
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
                  color: Colors.pink.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'โชว์รูมโตโยต้า',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: ทางหลวงหมายเลข 101 โรงกาด สูงเม่น แพร่ 54130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(02)-386-2000',
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
                  color: Colors.purple.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Toyota Sure: โตโยต้า แพร่หล่อตระกูล ยูสคาร์',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: อาคาร B ,200 หมู่ 3, โรงกาด, อำเภอสูงเม่น, 54130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)-660-111',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

////////////////////////////////////////////////////////////////////////////
// ignore: camel_case_types
class toyotaseChiangrai extends StatefulWidget {
  @override
  _toyotaseChiangraiState createState() => _toyotaseChiangraiState();
}

// ignore: camel_case_types
class _toyotaseChiangraiState extends State<toyotaseChiangrai> {
  Completer<GoogleMapController> _controller = Completer();
   GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

   Position currentPostion;
  var geoLocator = Geolocator();
  void locatePositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostion = position;
    // ignore: unused_local_variable
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 10);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(19.02972089776868, 99.93090891925993), zoom: 12);

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker oneMarker = Marker(
        markerId: MarkerId('Toyota Chiang Rai'),
        position: LatLng(19.89332, 99.83698),
        infoWindow: InfoWindow(title: 'Toyota Chiang Rai'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker twoMarker = Marker(
        markerId: MarkerId('โชว์รูมโตโยต้า (หจก.โตโยต้าเชียงราย)'),
        position: LatLng(19.90724, 99.83263),
        infoWindow: InfoWindow(title: 'โชว์รูมโตโยต้า (หจก.โตโยต้าเชียงราย)'),
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
              height: 500,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  newGoogleMapController = controller;
                  locatePositon();
                },
                markers: markers.map((e) => e).toSet(),
              ),
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
                        'บริษัท โตโยต้าเชียงราย จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:สำนักงานใหญ่ เลขที่99/2 หมู่.11 ถ.ซุปเปอร์ไฮเวย์ ต.รอบเวียง อ.เมือง จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-798888, 081-8852918, 085-8674488',
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
                        'โชว์รูมโตโยต้า (หจก.โตโยต้าเชียงราย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 649/1-4 ถ.ศรีเกิด ต.เวียง อ.เมืองเชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร: -',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
