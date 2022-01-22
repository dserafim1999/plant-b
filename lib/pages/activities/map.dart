import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_b/pages/activities/activities.dart';
import 'package:plant_b/pages/scanner/scanner.dart';
import 'package:plant_b/popups/code_popup.dart';
import 'dart:async';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class ActivitiesMap extends StatefulWidget {
  const ActivitiesMap({Key? key}) : super(key: key);

  @override
  _ActivitiesMapState createState() => _ActivitiesMapState();
}

class _ActivitiesMapState extends State<ActivitiesMap> {
  static const double fabHeightClosed = 80.0;
  double fabHeight = fabHeightClosed;

  final panelController = PanelController();
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(39.7443, -8.80725),
      zoom: 15,
  );


  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.05;
    final panelHeightOpen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
            controller: panelController,
            color: const Color(0xff86C24B),
            body: const GoogleMap(
                //mapType: MapType.hybrid,
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
              ),
            panelBuilder: (controller) => Activities(
              controller: controller,
              panelController: panelController,
            ),
            minHeight: panelHeightClosed,
            maxHeight: panelHeightOpen,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            parallaxEnabled: true,
            parallaxOffset: 0.5,
            onPanelSlide: (position) => setState(() {
              final panelMaxScrollExtent = panelHeightOpen - panelHeightClosed;

              fabHeight = position * panelMaxScrollExtent + fabHeightClosed;
            }),
          ),
          Positioned(
              right: 20,
              bottom: fabHeight,
              child: buildFAB(context)
          )
        ]
      )
    );
  }

}

Widget buildFAB(BuildContext context) => FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        backgroundColor: const Color(0xff63982E),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Scanner()),
          );
        },
      );
