import 'dart:async';
import 'package:car_lovers/unit/my_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class hondaphayao extends StatefulWidget {
  final String x;
  final String y;

  @override
  hondaphayao(this.x, this.y);
  createState() => _hondaphayaoState();
}

// ignore: camel_case_types
class _hondaphayaoState extends State<hondaphayao> {
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
    print(
        '5555555555555555555555555555555555555555555555555555555555555555555');
    print(widget.x);
    intilize();
    super.initState();
  }

  intilize() {
    Marker oneMarker = Marker(
        markerId: MarkerId('บริษัท พะเยาฮอนด้าคาร์ส์ จำกัด'),
        position: LatLng(19.14835, 99.91266),
        infoWindow: InfoWindow(title: 'บริษัท พะเยาฮอนด้าคาร์ส์ จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท พะเยาฮอนด้าคาร์ส์ จำกัด'),
        position: LatLng(19.14835, 100.91266),
        infoWindow: InfoWindow(title: 'บริษัท พะเยาฮอนด้าคาร์ส์ จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ฮอนด้าพะเยา'),
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
                  height: 140,
                  width: double.infinity,
                  color: Colors.blue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท พะเยาฮอนด้าคาร์ส์ จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 405/5 ถ.พหลโยธิน ต.แม่ต๋ำ อ.เมืองพะเยา จ.พะเยา 56000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054413490',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

/////////////////////////////////////////////////////////////////////////////////
// ignore: camel_case_types
class hondalampang extends StatefulWidget {
  @override
  _hondalampangState createState() => _hondalampangState();
}

// ignore: camel_case_types
class _hondalampangState extends State<hondalampang> {
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
            MarkerId('บริษัท เชียงแสงยนตรการ จำกัด(สาขาถนนลำปาง-เชียงใหม่)'),
        position: LatLng(18.29432, 99.42055),
        infoWindow: InfoWindow(
            title: 'บริษัท เชียงแสงยนตรการ จำกัด(สาขาถนนลำปาง-เชียงใหม่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท เชียงแสงยนตรการ จำกัด'),
        position: LatLng(18.25653, 99.46021),
        infoWindow: InfoWindow(title: 'บริษัท เชียงแสงยนตรการ จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ฮอนด้าลำปาง'),
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เชียงแสงยนตรการ จำกัด(สาขาถนนลำปาง-เชียงใหม่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 449 หมู่6 ต.ปงแสนทอง อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)829-688',
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เชียงแสงยนตรการ จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:499 หมู่8 ถ.ซุปเปอร์ไฮเวย์ ต.ชมพู อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร: (054)325-275-9',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

//////////////////////////////////////////////////////////////////////////////
// ignore: camel_case_types
class hondalamphun extends StatefulWidget {
  @override
  _hondalamphunState createState() => _hondalamphunState();
}

// ignore: camel_case_types
class _hondalamphunState extends State<hondalamphun> {
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
        markerId: MarkerId('บริษัท ลำพูน ฮอนด้าคาร์ส์ จำกัด'),
        position: LatLng(18.56142, 99.04500),
        infoWindow: InfoWindow(title: 'บริษัท ลำพูน ฮอนด้าคาร์ส์ จำกัด'),
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
          title: Text('ฮอนด้าลำพูน'),
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.orange.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท ลำพูน ฮอนด้าคาร์ส์ จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่ 126 หมู่ที่5 ถ.ซุปเปอร์ไฮเวย์ เชียงใหม่-ลำปาง ต.เวียงยอง อ.เมือง จ.ลำพูน 51000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(053)525-115-117',
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
class hondaphrae extends StatefulWidget {
  @override
  _hondaphraeState createState() => _hondaphraeState();
}

// ignore: camel_case_types
class _hondaphraeState extends State<hondaphrae> {
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
        markerId: MarkerId('บริษัท แพร่มิตรประสาน ฮอนด้าคาร์ส จำกัด'),
        position: LatLng(18.16493, 100.16808),
        infoWindow:
            InfoWindow(title: 'บริษัท แพร่มิตรประสาน ฮอนด้าคาร์ส จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker twoMarker = Marker(
        markerId:
            MarkerId('บริษัท แพร่มิตรประสาน ฮอนด้าคาร์ส์ จำกัด(สาขาสูงเม่น)'),
        position: LatLng(18.08879, 100.12758),
        infoWindow: InfoWindow(
            title: 'บริษัท แพร่มิตรประสาน ฮอนด้าคาร์ส์ จำกัด(สาขาสูงเม่น)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ฮอนด้าแพร่'),
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.green.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท แพร่มิตรประสาน ฮอนด้าคาร์ส จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 297/1 หมู่ที่ 5 ถ.ยันตรกิจโกศล ต.ทุ่งโฮ้ง อ.เมือง จ.แพร่ 54000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(054)524-061, (054)511-748',
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท แพร่มิตรประสาน ฮอนด้าคาร์ส์ จำกัด(สาขาสูงเม่น)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 111 หมู่10 ต.ร่องกาศ อ.สูงเม่น จ.แพร่ 54130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร: (054)660-151-5',
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
class hondachiangrai extends StatefulWidget {
  @override
  _hondachiangraiState createState() => _hondachiangraiState();
}

// ignore: camel_case_types
class _hondachiangraiState extends State<hondachiangrai> {
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
        markerId: MarkerId('บริษัท ร่องขุ่น ฮอนด้า ออโตโมบิล จำกัด'),
        position: LatLng(19.82369, 99.76699),
        infoWindow: InfoWindow(title: 'บริษัท ร่องขุ่น ฮอนด้า ออโตโมบิล จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker twoMarker = Marker(
        markerId: MarkerId(
            'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาข้างเซ็นทรัล)'),
        position: LatLng(19.88530, 99.83464),
        infoWindow: InfoWindow(
            title:
                'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาข้างเซ็นทรัล)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด'),
        position: LatLng(19.89965, 99.83999),
        infoWindow:
            InfoWindow(title: 'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId(
            'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาบ้านดู่)'),
        position: LatLng(19.97369, 99.85876),
        infoWindow: InfoWindow(
            title: 'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาบ้านดู่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker fiveMarker = Marker(
        markerId: MarkerId(
            'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาแม่สาย)'),
        position: LatLng(20.39379, 99.88539),
        infoWindow: InfoWindow(
            title: 'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาแม่สาย)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
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
          title: Text('ฮอนด้าเชียงราย'),
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.green.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท ร่องขุ่น ฮอนด้า ออโตโมบิล จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:210 หมู่1 ต.ป่าอ้อดอนชัย อ.เชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:052-020-675',
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาข้างเซ็นทรัล)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:300 หมู่13 ถ.พหลโยธิน ต.รอบเวียง อ.เมืองเชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-600-688',
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.orange.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:7/4 ถ.ซุปเปอร์ไฮเวย์ ต.รอบเวียง อ.เมือง จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(053)-719-251',
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาบ้านดู่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:138 หมู่3 ถ.พหลโยธิน ต.บ้านดู่ อ.เมืองเชียงราย จ.เชียงราย 57100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(053)-175-600',
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
                  height: 150,
                  width: double.infinity,
                  color: Colors.yellow.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็ม.อาร์.เอ็ม. คาร์ส์ เชียงราย จำกัด(สาขาแม่สาย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 285 หมู่ที่11 ต.โป่งผา อ.แม่สาย จ.เชียงราย 57130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:(053)-646-390',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
