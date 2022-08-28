import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  Location location = Location();

  getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    setState(() {
      lat = locationData.latitude;
      lng = locationData.longitude;
    });
  }

  var lat;
  var lng;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getLocation();
    });
  }

  void onMapcreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('Home'),
        position: LatLng(lat ?? 0.0, lng ?? 0.0),
        infoWindow: const InfoWindow(title: 'Your Location'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lat != null && lng != null
          ? GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(lat ?? 0.0, lng ?? 0.0),
                zoom: 15.0,
              ),
              onMapCreated: onMapcreated,
              markers: Set<Marker>.of(_markers),
            )
          : Container(),
    );
  }
}
