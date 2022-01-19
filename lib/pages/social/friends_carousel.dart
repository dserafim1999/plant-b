import 'package:flutter/material.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/ticket.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/core/carousel_item.dart';
import 'package:plant_b/pages/social/friend.dart';


class FriendsCarousel extends StatelessWidget {
  const FriendsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      /*child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: activities.length,
          itemBuilder: (BuildContext context, int index) {
            Activity activity = activities[index];
            return Friend(
                label: activity.name
            );
          }
      ),*/
    );
  }
}



