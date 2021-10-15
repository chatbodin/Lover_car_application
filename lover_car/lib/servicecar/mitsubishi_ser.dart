import 'dart:async';
import 'package:car_lovers/unit/my_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class mitsubishiphayao extends StatefulWidget {
  @override
  _mitsubishiphayaoState createState() => _mitsubishiphayaoState();
}

// ignore: camel_case_types
class _mitsubishiphayaoState extends State<mitsubishiphayao> {
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
        markerId: MarkerId('บริษัท มิตซูพันล้าน พะเยา จำกัด'),
        position: LatLng(19.140570034377888, 99.91480788940551),
        infoWindow: InfoWindow(title: 'บริษัท มิตซูพันล้าน พะเยา จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท มิตซูพันล้าน พะเยา จำกัด(สาขาเชียงคำ)'),
        position: LatLng(19.559826522317856, 100.29813603115507),
        infoWindow:
            InfoWindow(title: 'บริษัท มิตซูพันล้าน พะเยา จำกัด(สาขาเชียงคำ)'),
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
        appBar: AppBar(
          title: Text('มิตซูบิชิพะเยา'),
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
                  height: 140,
                  //width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท มิตซูพันล้าน พะเยา จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 345/32 ถ.พหลโยธิน ต. แม่ต๋ำ อ.เมือง จ. พะเยา 56000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054413355',
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
                        'บริษัท มิตซูพันล้าน พะเยา จำกัด (สาขาเชียงคำ)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 120 ม.11 ต.สบบง อ.ภูซาง จ.พะเยา 56110',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054079889',
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
class mitsubishilampang extends StatefulWidget {
  @override
  _mitsubishilampangState createState() => _mitsubishilampangState();
}

// ignore: camel_case_types
class _mitsubishilampangState extends State<mitsubishilampang> {
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
        markerId: MarkerId('บริษัท มิตซูเชียงใหม่ จำกัด(สาขาลำปาง)'),
        position: LatLng(18.285331676907575, 99.48574634988003),
        infoWindow: InfoWindow(title: 'บริษัท มิตซูเชียงใหม่ จำกัด(สาขาลำปาง)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    Marker twoMarker = Marker(
        markerId: MarkerId('บริษัท มิตซูเชียงใหม่ จำกัด สาขานาก่วม'),
        position: LatLng(18.26915088296575, 99.46714691796683),
        infoWindow: InfoWindow(title: 'บริษัท มิตซูเชียงใหม่ จำกัด สาขานาก่วม'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('มิตซูลำปางเกาะคา สนง ใหญ่'),
        position: LatLng(18.21478248576678, 99.42164576154092),
        infoWindow: InfoWindow(title: 'มิตซูลำปางเกาะคา สนง ใหญ่'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));

    markers.add(oneMarker);
    markers.add(twoMarker);
    markers.add(threeMarker);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('มิตซูบิชิลำปาง'),
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
                  height: 140,
                  //width: double.infinity,
                  color: Colors.red.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท มิตซูเชียงใหม่ จำกัด(สาขาลำปาง)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 274 1 ถ.ฉัตรไชย ต.สบตุ๋ย อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-366-662',
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
                        'บริษัท มิตซูเชียงใหม่ จำกัด สาขานาก่วม',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 174 ถ.พหลโยธิน ต.ชมพู อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:-',
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
                  color: Colors.orange.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'มิตซูลำปางเกาะคา สนง ใหญ่',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: ถ.พหลโยธิน ต.ศาลา อ.เกาะคา จ.ลำปาง 52130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:-',
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
class mitsubishilamphun extends StatefulWidget {
  @override
  _mitsubishilamphunState createState() => _mitsubishilamphunState();
}

// ignore: camel_case_types
class _mitsubishilamphunState extends State<mitsubishilamphun> {
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
        markerId: MarkerId('ศูนย์มิตซูบิชิลิ้มเม่งจั้วมิตซู ลำพูน'),
        position: LatLng(18.555649015273865, 99.04166544116673),
        infoWindow: InfoWindow(title: 'ศูนย์มิตซูบิชิลิ้มเม่งจั้วมิตซู ลำพูน'),
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
          title: Text('มิตซูบิชิลำพูน'),
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
                  height: 140,
                  //width: double.infinity,
                  color: Colors.blue.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ศูนย์มิตซูบิชิลิ้มเม่งจั้วมิตซู ลำพูน',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 292 หมู่ 4 ต.ป่าสัก อ.เมือง จ.ลำพูน 51000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร: 053-584430, 053-584431, 053-584432',
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
class mitsubishichiangrai extends StatefulWidget {
  @override
  _mitsubishichiangraiState createState() => _mitsubishichiangraiState();
}

// ignore: camel_case_types
class _mitsubishichiangraiState extends State<mitsubishichiangrai> {
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
        markerId: MarkerId('มิตซูล้านนา สาขาแม่สาย'),
        position: LatLng(20.353035126243388, 99.88119927786975),
        infoWindow: InfoWindow(title: 'มิตซูล้านนา สาขาแม่สาย'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));
    Marker twoMarker = Marker(
        markerId: MarkerId('มิตซูล้านนา'),
        position: LatLng(20.021292643782353, 99.87175280311317),
        infoWindow: InfoWindow(title: 'มิตซูล้านนา'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));
    Marker threeMarker = Marker(
        markerId: MarkerId('บริษัท มิตซูพันล้าน จำกัด (สำนักงานใหญ่)'),
        position: LatLng(19.879161677337287, 99.83279324359589),
        infoWindow:
            InfoWindow(title: 'บริษัท มิตซูพันล้าน จำกัด (สำนักงานใหญ่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ));
    Marker fourMarker = Marker(
        markerId: MarkerId('บริษัท มิตซูล้านนา จำกัด (สาขาเมืองเชียงราย)'),
        position: LatLng(19.91621419286339, 99.84671098882146),
        infoWindow:
            InfoWindow(title: 'บริษัท มิตซูล้านนา จำกัด (สาขาเมืองเชียงราย)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        ));
    Marker fiveMarker = Marker(
        markerId: MarkerId('มิตซูล้านนา สาขาสหมิตร (ริมกก)'),
        position: LatLng(19.8981748548758, 99.83905508678953),
        infoWindow: InfoWindow(title: 'มิตซูล้านนา สาขาสหมิตร (ริมกก)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
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
          title: Text('มิตซูบิชิเชียงราย'),
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
                        'มิตซูล้านนา สาขาแม่สาย',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: หมู่8 195 โป่งผา อ.แม่สาย จ.เชียงราย 57130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร: 052 029 988',
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
                  color: Colors.blue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'มิตซูล้านนา',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 88 หมู่8 ต.นางแล อ.เมือง จ.เชียงราย 57100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-176-666',
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
                  color: Colors.green.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท มิตซูพันล้าน จำกัด (สำนักงานใหญ่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 99/19 หมู่13 ถ.ซุปเปอร์ไฮเวย์ สันทราย อ.เมืองเชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-700-007',
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
                  color: Colors.yellow.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท มิตซูล้านนา จำกัด (สาขาเมืองเชียงราย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 444 ถ.พหลโยธิน อ.เมืองเชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-748-888',
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
                  color: Colors.orange.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'มิตซูล้านนา สาขาสหมิตร (ริมกก)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 444/1 หมู่20 อ.เมืองเชียงราย จ.เชียงราย 57100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-748-888',
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
class mitsubishiphrae extends StatefulWidget {
  @override
  _mitsubishiphraeState createState() => _mitsubishiphraeState();
}

// ignore: camel_case_types
class _mitsubishiphraeState extends State<mitsubishiphrae> {
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
        markerId: MarkerId('บริษัท แพร่ยนตรการ มิตซู จำกัด'),
        position: LatLng(18.106857525229533, 100.13522960866077),
        infoWindow: InfoWindow(title: 'บริษัท แพร่ยนตรการ มิตซู จำกัด'),
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
          title: Text('มิตซูบิชิแพร่'),
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
                  height: 140,
                  //width: double.infinity,
                  color: Colors.cyan.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท แพร่ยนตรการ มิตซู จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่: 8/3 หมู่4 ถ.ยันตรกิจโกศล ต.ร่องกาศ อ.สูงเม่น จ.แพร่ 54130',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร: 054-625-233',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
