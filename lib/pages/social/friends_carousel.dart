import 'package:flutter/material.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/pages/social/friend.dart';


class FriendsCarousel extends StatelessWidget {
  const FriendsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: FutureBuilder(
        initialData: const [],
        future: getUserFriends(),
        builder: (context, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == false) {
            return Container();
          } else if (projectSnap.hasData){
            return  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: projectSnap.data.length,
                itemBuilder: (BuildContext context, int index) {
                  User user = projectSnap.data[index];
                  return Friend(friend: user);
                }
            );
          }  else {
            return Container();
          }
        },
      ),
    );
  }
}



