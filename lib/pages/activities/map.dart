import 'package:flutter/material.dart';

class ActivitiesMap extends StatefulWidget {
  const ActivitiesMap({Key? key}) : super(key: key);

  @override
  _ActivitiesMapState createState() => _ActivitiesMapState();
}

class _ActivitiesMapState extends State<ActivitiesMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff86C24B),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.center_focus_strong),
        backgroundColor: const Color(0xff63982E),
        onPressed: () {},
      ),
      body: const Text("Activities Map"),
    );
  }
}
