import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class ActivitiesMap extends StatefulWidget {
  const ActivitiesMap({Key? key}) : super(key: key);

  @override
  _ActivitiesMapState createState() => _ActivitiesMapState();
}

class _ActivitiesMapState extends State<ActivitiesMap> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(39.7443, -8.80725),
      zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const GoogleMap(
          //mapType: MapType.hybrid,
          initialCameraPosition: _initialCameraPosition,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.center_focus_strong),
        backgroundColor: const Color(0xff63982E),
        onPressed: () {},
      ),
    );
  }

}
