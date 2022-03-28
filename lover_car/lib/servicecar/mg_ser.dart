// ignore_for_file: unnecessary_import

import 'dart:async';
import 'package:car_lovers/unit/my_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class mgphayao extends StatefulWidget {
  @override
  _mgphayaoState createState() => _mgphayaoState();
}

// ignore: camel_case_types
class _mgphayaoState extends State<mgphayao> {
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
        markerId: MarkerId('บริษัท เอ็มจี ล้านนา จำกัด(สาขาพะเยา)'),
        position: LatLng(19.15320751240071, 99.91325027548214),
        infoWindow: InfoWindow(title: 'บริษัท เอ็มจี ล้านนา จำกัด(สาขาพะเยา)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    markers.add(oneMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เอ็มจีพะเยา'),
          backgroundColor: Mystyle().primaryColor,
        ),
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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.blue.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็มจี ล้านนา จำกัด(สาขาพะเยา)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 413/2 ถ.พหลโยธิน ต.แม่ต๋ำ อ.เมือง จ.พะเยา 56000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-482-333',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

////////////////////////////////////////////////////////////////////////////////

// ignore: camel_case_types
class mglampang extends StatefulWidget {
  @override
  _mglampangState createState() => _mglampangState();
}

// ignore: camel_case_types
class _mglampangState extends State<mglampang> {
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
        markerId: MarkerId('เอ็มจี​ เชียงแสง​ ลำปาง'),
        position: LatLng(18.25387, 99.45671),
        infoWindow: InfoWindow(title: 'เอ็มจี​ เชียงแสง​ ลำปาง'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));

    markers.add(oneMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เอ็มจีลำปาง'),
          backgroundColor: Mystyle().primaryColor,
        ),
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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.green.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'เอ็มจี​ เชียงแสง​ ลำปาง',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:449 หมู่ 1 ต.ชมพู อ.เมือง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-010-424',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

////////////////////////////////////////////////////////////////////////////////

// ignore: camel_case_types
class mglamphun extends StatefulWidget {
  @override
  _mglamphunState createState() => _mglamphunState();
}

// ignore: camel_case_types
class _mglamphunState extends State<mglamphun> {
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
        markerId: MarkerId('บริษัท นอร์ทพอยท์ออโต้ลำพูน จำกัด'),
        position: LatLng(18.60384441669539, 99.02218818635798),
        infoWindow: InfoWindow(title: 'บริษัท นอร์ทพอยท์ออโต้ลำพูน จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    markers.add(oneMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เอ็มจีลำพูน'),
          backgroundColor: Mystyle().primaryColor,
        ),
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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.red.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท นอร์ทพอยท์ออโต้ลำพูน จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:53/1 หมู่10 ถ.เชียงใหม่-ลำพูน ต.เหมืองง่า อ.เมืองลำพูน จ.ลำพูน 51000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-525-869',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

////////////////////////////////////////////////////////////////////////////////
// ignore: camel_case_types
class mgPhrae extends StatefulWidget {
  @override
  _mgPhraeState createState() => _mgPhraeState();
}

// ignore: camel_case_types
class _mgPhraeState extends State<mgPhrae> {
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
        markerId: MarkerId('บริษัท เอ็มจี แพร่ (2019) จำกัด'),
        position: LatLng(18.11981248805025, 100.13999300321893),
        infoWindow: InfoWindow(title: 'บริษัท เอ็มจี แพร่ (2019) จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueCyan,
        ));

    markers.add(oneMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เอ็มจีแพร่'),
          backgroundColor: Mystyle().primaryColor,
        ),
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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.cyan.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็มจี แพร่ (2019) จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:173 หมู่7 ถ.ยันตรกิจโกศล ต.ป่าแมต อ.เมืองแพร่ จ.แพร่ 54000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-531-333',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

////////////////////////////////////////////////////////////////////////////////
// ignore: camel_case_types
class mgChiangrai extends StatefulWidget {
  @override
  _mgChiangraiState createState() => _mgChiangraiState();
}

// ignore: camel_case_types
class _mgChiangraiState extends State<mgChiangrai> {
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
        markerId: MarkerId('บริษัท เอ็มจี ล้านนา จำกัด'),
        position: LatLng(19.878714217190883, 99.83315723686775),
        infoWindow: InfoWindow(title: 'บริษัท เอ็มจี ล้านนา จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));
    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท เอ็มจี ล้านนา จำกัด(สาขาแม่สาย)'),
        position: LatLng(20.403599809160397, 99.88473190368394),
        infoWindow: InfoWindow(title: 'บริษัท เอ็มจี ล้านนา จำกัด(สาขาแม่สาย)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        ));
    markers.add(oneMarker);
    markers.add(twoMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('เอ็มจีเชียงราย'),
          backgroundColor: Mystyle().primaryColor,
        ),
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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.orange.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็มจี ล้านนา จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:111/21-22 หมู่13 ถ.พหลโยธิน ต.สันทราย อ.เมือง จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-774-888',
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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.yellow.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็มจี ล้านนา จำกัด(สาขาแม่สาย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 251 หมู่5 ต.เวียงพางคำ อ.แม่สาย จ.เชียงราย 57130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-731-788',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
