import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          bearing: 30,
          tilt: 10,
          zoom: 15,
          target: LatLng(23.822350, 90.365417),
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        trafficEnabled: true,
        compassEnabled: true,
        mapType: MapType.normal,
        onTap: (LatLng? latLng) {
          log(latLng?.latitude.toString() ?? '');
          log(latLng?.longitude.toString() ?? '');
        },
        onLongPress: (LatLng? latLng) {
          log(latLng?.toString() ?? '');
        },
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
        },
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('marker1'),
            position: const LatLng(23.821334981713495, 90.37056125700475),
            infoWindow: const InfoWindow(title: 'Hello'),
            draggable: true,
            onDragStart: (LatLng latLng) {
              log(latLng.toString());
            },
            onDragEnd: (LatLng latLng) {
              log(latLng.toString());
            },
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            onTap: () {},
          ),
          Marker(
            markerId: const MarkerId('marker2'),
            position: const LatLng(23.822350, 90.365417),
            infoWindow: const InfoWindow(snippet: 'marker-2'),
            onTap: () {},
          ),
          Marker(
            markerId: const MarkerId('marker3'),
            infoWindow: const InfoWindow(title: 'Marker 3'),
            position: const LatLng(23.82512682817837, 90.36894723773003),
            onTap: () {},
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: const PolylineId('Polyline 1'),
            color: Colors.blue,
            width: 20,
            visible: true,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            jointType: JointType.round,
            points: const <LatLng>[
              LatLng(23.821334981713495, 90.37056125700475),
              LatLng(23.82512682817837, 90.36894723773003),
              LatLng(23.822350, 90.365417),
            ],
            onTap: () {
              log('Tap on Polyline');
            },
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: const CircleId('circle 1'),
            center: const LatLng(23.822350, 90.365417),
            radius: 100,
            strokeColor: Colors.blue,
            fillColor: Colors.green.shade200,
            strokeWidth: 5,
            onTap: () {
              log('Tap on Circle');
            },
          ),
          Circle(
            circleId: const CircleId('circle 2'),
            center: const LatLng(23.821334981713495, 90.37056125700475),
            radius: 100,
            strokeColor: Colors.red,
            fillColor: Colors.green.shade200,
            strokeWidth: 5,
            onTap: () {
              log('Tap on Circle');
            },
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: const PolygonId('polygone 1'),
            fillColor: Colors.green.shade300,
            strokeWidth: 0,
            strokeColor: Colors.blue,
            points: const <LatLng>[
              LatLng(23.817724604160944, 90.36369647830725),
              LatLng(23.81737616720153, 90.36966908723116),
              LatLng(23.814109525219774, 90.36986857652664),
              LatLng(23.813618141538715, 90.36431673914196)
            ],
          ),
        },
      ),
    );
  }
}
