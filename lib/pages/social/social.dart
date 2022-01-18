import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/pages/social/friends_carousel.dart';
import 'package:plant_b/pages/social/leaderboard.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Friends', style: headline1),
                    const Text('Edit', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              FriendsCarousel(),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text('Leaderboard', style: headline1),
                  ],
                ),
              ),
              Leaderboard()
            ],
          ),
      );
  }
}
