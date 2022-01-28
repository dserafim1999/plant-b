import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/pages/activities/activities.dart';
import 'package:plant_b/pages/scanner/scanner.dart';
import 'package:plant_b/popups/activity_popup.dart';
import 'package:plant_b/popups/code_popup.dart';
import 'dart:async';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class ActivitiesMap extends StatefulWidget {
  const ActivitiesMap({Key? key}) : super(key: key);

  @override
  _ActivitiesMapState createState() => _ActivitiesMapState();
}

class _ActivitiesMapState extends State<ActivitiesMap> {
  Set<Marker> _markers = {};
  List<Activity> activities = [];
  late BuildContext context;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    activities = await getAllActivities();
    for (var a in activities) {
      setState(() {
        _markers.add(
            Marker(
              markerId: MarkerId(a.qr_code),
              position: LatLng(a.location_x, a.location_y),
              icon: BitmapDescriptor.defaultMarkerWithHue(90),
              onTap: () {
                openActivitiesDialog(a);
              }
            )
        );
      });
    }
  }

  Future openActivitiesDialog(Activity activity) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return ActivityPopup(activity: activity);
      }
  );

  static const double fabHeightClosed = 80.0;
  double fabHeight = fabHeightClosed;

  final panelController = PanelController();
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(38.736772, -9.138954),
      zoom: 16,
  );


  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.05;
    final panelHeightOpen = MediaQuery.of(context).size.height;

    this.context = context;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
            controller: panelController,
            color: const Color(0xff86C24B),
            body: GoogleMap(
                //mapType: MapType.hybrid,
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: _onMapCreated,
                markers: _markers,

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
