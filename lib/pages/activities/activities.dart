import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/pages/activities/activities_carousel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Activities extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const Activities({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: <Widget>[
        buildDragHandle(),
        const SizedBox(height: 36),
        buildActivitiesMenu(),
        const SizedBox(height: 24)
      ],
    );
  }

  Widget buildActivitiesMenu() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Testing", style: headline1),
        SizedBox(height: 12),
        ActivitiesCarousel()
      ],
    ),
  );

  Widget buildDragHandle() => Center(
    child: IconButton(
      icon: Icon(Icons.expand_less),
      onPressed: togglePanel,
      color: Colors.white,
      iconSize: 35,
    ),
  );

  Future<void> togglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
}
