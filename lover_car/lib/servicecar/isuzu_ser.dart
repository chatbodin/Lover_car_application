import 'dart:async';
import 'package:car_lovers/unit/my_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class isuzuphayao extends StatefulWidget {
  @override
  _isuzuphayaoState createState() => _isuzuphayaoState();
}

// ignore: camel_case_types
class _isuzuphayaoState extends State<isuzuphayao> {
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
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขาพะเยา)'),
        position: LatLng(19.16813, 99.90971),
        infoWindow: InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขาพะเยา)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขาเชียงคำ)'),
        position: LatLng(19.54630, 100.29635),
        infoWindow: InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขาเชียงคำ)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('อีซูซุพะเยา'),
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
                  height: 165,
                  //width: double.infinity,
                  color: Colors.blue.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุลำปาง จำกัด(สาขาพะเยา)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 1/18 ถนนวัดลี ต.เวียง อ.เมืองพะเยา จ.พะเยา 56000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054484777',
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
                  height: 165,
                  //width: double.infinity,
                  color: Colors.orange.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุลำปาง จำกัด(สาขาเชียงคำ)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 114 หมู่ที่ 7 ต.หย่วน อ.เชียงคำ จ.พะเยา 56110',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054454222-3',
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
class isuzulampang extends StatefulWidget {
  @override
  _isuzulampangState createState() => _isuzulampangState();
}

// ignore: camel_case_types
class _isuzulampangState extends State<isuzulampang> {
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
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขางาว)'),
        position: LatLng(18.76181, 99.97273),
        infoWindow: InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขางาว)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขาสำนักงานใหญ่)'),
        position: LatLng(18.28307, 99.48298),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขาสำนักงานใหญ่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขาถนนไฮเวย์ลำปาง)'),
        position: LatLng(18.27631, 99.48321),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขาถนนไฮเวย์ลำปาง)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขาบ้านต้า)'),
        position: LatLng(18.24667, 99.44901),
        infoWindow: InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขาบ้านต้า)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker fiveMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุลำปาง จำกัด(สาขาเถิน)'),
        position: LatLng(17.63619, 99.23870),
        infoWindow: InfoWindow(title: 'บริษัท อีซูซุลำปาง จำกัด(สาขาเถิน)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);
    markers.add(threeMarker);
    markers.add(fourMarker);
    markers.add(fiveMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('อีซูซุลำปาง'),
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
                        'บริษัท อีซูซุลำปาง จำกัด(สาขางาว)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 83 หมู่ที่ 1 ต.นาแก อ.งาว จ.ลำปาง 52110',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054329621-2',
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
                  color: Colors.orange.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุลำปาง จำกัด(สาขาสำนักงานใหญ่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 282/7-9 ถนนฉัตรไชย ต.สบตุ๋ย อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054222882',
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
                  color: Colors.green.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุลำปาง จำกัด(สาขาถนนไฮเวย์ลำปาง)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:65/1 ถนนไฮเวย์ลำปาง-งาว ต.สบตุ๋ย อ.เมือง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054231600',
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
                  color: Colors.red.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุลำปาง จำกัด(สาขาบ้านต้า)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 559 หมู่ที่ 10 ต.ชมพู อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054325098-9',
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
                  color: Colors.purple.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุลำปาง จำกัด (สาขาเถิน)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 154 หมู่ที่ 7 ต.ล้อมแรด อ.เถิน จ.ลำปาง 52160',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054291681-2',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

//////////////////////////////////////////////////////////////////////////////////

// ignore: camel_case_types
class isuzulamphun extends StatefulWidget {
  @override
  _isuzulamphunState createState() => _isuzulamphunState();
}

// ignore: camel_case_types
class _isuzulamphunState extends State<isuzulamphun> {
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
        markerId: MarkerId('บริษัท ธาราลำพูนอีซูซุเซลส์ จำกัด(สาขาลำพูน)'),
        position: LatLng(18.60642, 99.04288),
        infoWindow:
            InfoWindow(title: 'บริษัท ธาราลำพูนอีซูซุเซลส์ จำกัด(สาขาลำพูน)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));

    markers.add(oneMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('อีซูซุลำพูน'),
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
                        'บริษัท ธาราลำพูนอีซูซุเซลส์ จำกัด(สาขาลำพูน)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:118 หมู่13 ถ.เชียงใหม่-ลำปาง ต.มะเขือแจ้ อ.เมือง จ.ลำพูน 51000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053552436',
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
class isuzuphrae extends StatefulWidget {
  @override
  _isuzuphraeState createState() => _isuzuphraeState();
}

// ignore: camel_case_types
class _isuzuphraeState extends State<isuzuphrae> {
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
        markerId: MarkerId('บริษัท อีซูซุแพร่ จำกัด(สาขาแพร่)'),
        position: LatLng(18.12487, 100.14154),
        infoWindow: InfoWindow(title: 'บริษัท อีซูซุแพร่ จำกัด(สาขาแพร่)'),
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
          title: Text('อีซูซุแพร่'),
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
                        'บริษัท อีซูซุแพร่ จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:158 หมู่7 ถ.ยันตรกิจโกศล ต.ป่าแมต อ.เมือง จ.แพร่ 54000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-531-788',
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
class isuzuchiangrai extends StatefulWidget {
  @override
  _isuzuchiangraiState createState() => _isuzuchiangraiState();
}

// ignore: camel_case_types
class _isuzuchiangraiState extends State<isuzuchiangrai> {
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
            MarkerId('บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาเวียงป่าเป้า)'),
        position: LatLng(19.22969, 99.51538),
        infoWindow: InfoWindow(
            title: 'บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาเวียงป่าเป้า)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาพาน)'),
        position: LatLng(19.58796, 99.74666),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาพาน)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาเทิง)'),
        position: LatLng(19.69222, 100.16056),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาเทิง)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุเชียงราย(2002)จำกัด(สำนักงานใหญ่)'),
        position: LatLng(19.83229, 99.78271),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุเชียงราย(2002)จำกัด(สำนักงานใหญ่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker fiveMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาศรีทรายมูล)'),
        position: LatLng(19.89781, 99.83857),
        infoWindow: InfoWindow(
            title: 'บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาศรีทรายมูล)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta,
        ));
    Marker sixMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาเชียงราย)'),
        position: LatLng(19.96176, 99.85368),
        infoWindow: InfoWindow(
            title: 'บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาเชียงราย)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRose,
        ));
    Marker sevenMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาแม่จัน)'),
        position: LatLng(20.19082, 99.89620),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาแม่จัน)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueCyan,
        ));
    Marker eightMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาแม่สาย)'),
        position: LatLng(20.29269, 99.87173),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุสงวนไทยเชียงรายจำกัด(สาขาแม่สาย)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        ));
    Marker nineMarker = Marker(
        markerId: MarkerId('บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาเชียงของ)'),
        position: LatLng(20.224402, 100.40351),
        infoWindow:
            InfoWindow(title: 'บริษัท อีซูซุเชียงราย(2002)จำกัด(สาขาเชียงของ)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);
    markers.add(threeMarker);
    markers.add(fourMarker);
    markers.add(fiveMarker);
    markers.add(sixMarker);
    markers.add(sevenMarker);
    markers.add(eightMarker);
    markers.add(nineMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('อีซูซุเชียงราย'),
          backgroundColor: Mystyle().primaryColor,
        ),
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
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
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.blue.shade700,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุเชียงราย(2002) จำกัด(สาขาเวียงป่าเป้า)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:122 หมู่ที่ 6 ต.เวียงกาหลง อ.เวียงป่าเป้า จ.เชียงราย 57260',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053798007 ต่อ 104',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.orange.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุสงวนไทยเชียงราย จำกัด(สาขาพาน)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 227 หมู่17 ถ.พหลโยธิน ต.สันกลาง อ.พาน จ.เชียงราย 57120',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053722999',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 160,
                  //width: double.infinity,
                  color: Colors.green.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุเชียงราย(2002) จำกัด(สาขาเทิง)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:232 หมู่ที่ 2 ต.เวียง อ.เทิง จ.เชียงราย 57160',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053669911 ต่อ 102',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.red.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุเชียงราย(2002) จำกัด(สำนักงานใหญ่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:255 หมู่3 ถ.พหลโยธิน ต.ป่าอ้อดอนชัย อ.เมืองเชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:052029644',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.purple.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุเชียงราย(2002) จำกัด(สาขาศรีทรายมูล)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 145/1 หมู่17 ถ.ซุปเปอร์ไฮเวย์ ต.รอบเวียง อ.เมือง จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053711605 ต่อ 148',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.pink.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุสงวนไทยเชียงราย จำกัด(สาขาเชียงราย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 222 หมู่2 ถ.พหลโยธิน ต.บ้านดู่ อ.เมือง จ.เชียงราย 57100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053702666-8',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.lightBlue.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุสงวนไทยเชียงราย จำกัด(สาขาแม่จัน)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 333 หมู่5 ต.จอมสวรรค์ อ.แม่จัน เชียงราย 57110',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053160998',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.yellow.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุสงวนไทยเชียงราย จำกัด(สาขาแม่สาย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 419 หมู่11 ต.ห้วยไคร้ อ.แม่สาย จ.เชียงราย 57220',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053667669',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  height: 165,
                  //width: double.infinity,
                  color: Colors.purple.shade600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท อีซูซุเชียงราย(2002) จำกัด(สาขาเชียงของ)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 123 หมู่7 ต.สถาน อ.เชียงของ จ.เชียงราย 57140',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053791599 ต่อ 102',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ],
          ),
        ));
    // ignore: dead_code
  }
}
