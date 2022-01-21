import 'package:flutter/material.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/core/carousel_item.dart';
import 'package:plant_b/popups/activity_popup.dart';


class ActivitiesCarousel extends StatefulWidget {
  const ActivitiesCarousel({Key? key}) : super(key: key);

  @override
  State<ActivitiesCarousel> createState() => _ActivitiesCarouselState();
}

class _ActivitiesCarouselState extends State<ActivitiesCarousel> {
  @override
  Widget build(BuildContext context) {
    Future openActivitiesDialog(Activity activity) => showDialog(
        context: context,
        builder: (BuildContext context) {
            return ActivityPopup(activity: activity);
        }
    );

    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: FutureBuilder(
            initialData: const [],
            future: getAllActivities(),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData){
                return  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Activity activity = projectSnap.data[index];
                      return CarouselItem(
                          label: activity.getLabel(),
                          tokens: activity.token_reward.toString(),
                          positive: true,
                          img_url: activity.img_url,
                          onTap: () { openActivitiesDialog(activity); }
                      );
                    }
                );
              }  else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}



