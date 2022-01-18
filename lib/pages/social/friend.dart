import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/popups/discount_popup.dart';
import 'package:plant_b/models/models.dart';


class Friend extends StatelessWidget {
  final String label;
  //final String imagePath

  const Friend({
    Key? key,
    required this.label,
    // this.imagePath,
  }) : super(key: key);

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                  radius: 50,
              ),
              Text(label)
            ],
      ),
    );
  }


}



