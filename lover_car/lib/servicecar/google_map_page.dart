// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'location_provider.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map API"),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          children: [
            googleMapUI(),
          ],
        ));
  }

  Widget googleMapUI() {
    // ignore: non_constant_identifier_names
    return Consumer<LocationProvider>(builder: (ConsumerContext, model, child) {
      // ignore: unnecessary_null_comparison
      if (model.locationPosition != null) {
        return Column(
          children: [
            Container(
                height: 450,
                width: double.infinity,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition:
                      CameraPosition(target: model.locationPosition, zoom: 10),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: Set<Marker>.of(model.markers.values),
                  onMapCreated: (GoogleMapController controller) {},
                )),
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
                        '????????????????????? ???????????????',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '????????????????????? 403/11 ???.???????????????????????? ???.?????????????????? ???.??????????????? ???.??????????????? 56000',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '?????????:(054)-41-4999   Fax:(054)-41-2040',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
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
                        '????????????????????? ???????????????',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '????????????????????? 403/11 ???.???????????????????????? ???.?????????????????? ???.??????????????? ???.??????????????? 56000',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '?????????:(054)-41-4999   Fax:(054)-41-2040',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ],
        );
      }
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
