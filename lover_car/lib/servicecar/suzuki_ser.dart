import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class suzukiphayao extends StatefulWidget {
  @override
  _suzukiphayaoState createState() => _suzukiphayaoState();
}

// ignore: camel_case_types
class _suzukiphayaoState extends State<suzukiphayao> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

  late Position currentPostion;
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
        markerId: MarkerId('บริษัท เอ็น.ที. ออโตโมบิล จำกัด(สำนักงานใหญ่)'),
        position: LatLng(19.21275, 99.86982),
        infoWindow:
            InfoWindow(title: 'บริษัท เอ็น.ที. ออโตโมบิล จำกัด(สำนักงานใหญ่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ));

    markers.add(oneMarker);

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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.blue.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็น.ที. ออโตโมบิล จำกัด (สำนักงานใหญ่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:555 หมู่18 ต.บ้านต๋อม อ.เมืองพะเยา จ.พะเยา 56000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-887333 ,Fax:054-887333',
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
class suzukilampang extends StatefulWidget {
  @override
  _suzukilampangState createState() => _suzukilampangState();
}

// ignore: camel_case_types
class _suzukilampangState extends State<suzukilampang> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

  late Position currentPostion;
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
        markerId: MarkerId('บริษัท เขลางค์ ออโตเซลส์ จำกัด'),
        position: LatLng(18.253037843464714, 99.4557953802687),
        infoWindow: InfoWindow(title: 'บริษัท เขลางค์ ออโตเซลส์ จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ));

    markers.add(oneMarker);

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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.red.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เขลางค์ ออโตเซลส์ จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:380/1 หมู่1 ต.ชมพู อ.เมืองลำปาง จ.ลำปาง 52100',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-250110-1',
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
class suzukilamphun extends StatefulWidget {
  @override
  _suzukilamphunState createState() => _suzukilamphunState();
}

// ignore: camel_case_types
class _suzukilamphunState extends State<suzukilamphun> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

  late Position currentPostion;
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
        markerId: MarkerId('บริษัท เจริญออโตเซลส์ จำกัด'),
        position: LatLng(18.632003542195076, 99.05070060098043),
        infoWindow: InfoWindow(title: 'บริษัท เจริญออโตเซลส์ จำกัด'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ));

    markers.add(oneMarker);

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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.orange.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เขลางค์ ออโตเซลส์ จำกัด',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:144/1 หมู่11 ถ.เชียงใหม่-ลำปาง ต.อุโมงค์ อ.เมืองลำพูน จ.ลำพูน 51150',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-091061-5, Fax:053-091063',
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
class suzukiPhrae extends StatefulWidget {
  @override
  _suzukiPhraeState createState() => _suzukiPhraeState();
}

// ignore: camel_case_types
class _suzukiPhraeState extends State<suzukiPhrae> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

  late Position currentPostion;
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
        markerId: MarkerId(
            'บริษัท แพร่ยนตรการ เซลส์ แอนด์ เซอร์วิส จำกัด(สำนักงานใหญ่)'),
        position: LatLng(18.118454192406052, 100.13940961601098),
        infoWindow: InfoWindow(
            title:
                'บริษัท แพร่ยนตรการ เซลส์ แอนด์ เซอร์วิส จำกัด(สำนักงานใหญ่)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        ));

    markers.add(oneMarker);

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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.yellow.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท แพร่ยนตรการ เซลส์ แอนด์ เซอร์วิส จำกัด(สำนักงานใหญ่)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:168 หมู่ที่7 ต.ป่าแมต อ.เมืองแพร่ จ.แพร่ 54000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:054-524364-6, Fax:054-511004',
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
class suzukiChiangrai extends StatefulWidget {
  @override
  _suzukiChiangraiState createState() => _suzukiChiangraiState();
}

// ignore: camel_case_types
class _suzukiChiangraiState extends State<suzukiChiangrai> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  List<Marker> markers = [];

  late Position currentPostion;
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
        markerId: MarkerId('บริษัท เอ็น.ที. ออโตโมบิล จำกัด(สาขาเชียงราย)'),
        position: LatLng(19.903076125488475, 99.8384540010108),
        infoWindow:
            InfoWindow(title: 'บริษัท เอ็น.ที. ออโตโมบิล จำกัด(สาขาเชียงราย)'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta,
        ));

    markers.add(oneMarker);

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
                  height: 160,
                  //width: double.infinity,
                  color: Colors.purple.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บริษัท เอ็น.ที. ออโตโมบิล จำกัด(สาขาเชียงราย)',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ที่อยู่:93/17 หมู่18 ต.รอบเวียง อ.เมืองเชียงราย จ.เชียงราย 57000',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'โทร:053-174-889,065-954-5892',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
