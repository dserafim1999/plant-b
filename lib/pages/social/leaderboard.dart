import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/user.model.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  bool isGlobal = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 400,
        ),
        Positioned(
          bottom: 0,
          child:
            Container(
                width: 325,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                )
            ),
        ),
        buildTop3(),
        Positioned(
          top: 125,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ToggleButtons(
              color: Colors.black.withOpacity(0.60),
              selectedColor: const Color(0xff86C24B),
              selectedBorderColor: const Color(0xff86C24B),
              fillColor: const Color(0xff86C24B).withOpacity(0.08),
              splashColor: const Color(0xff86C24B).withOpacity(0.12),
              hoverColor: const Color(0xff86C24B).withOpacity(0.04),
              borderRadius: BorderRadius.circular(4.0),
              constraints: const BoxConstraints(minHeight: 36.0),
              isSelected: [isGlobal, !isGlobal],
              onPressed: (index) {
                // Respond to button selection
                setState(() {
                  isGlobal = !isGlobal;
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Global'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Friends'),
                ),
              ],
            )
          ),
        ),
        SizedBox(
            width: 300,
            height: 230,
            child: buildLeaderboardList(context)
        ),
      ],
    );
  }

  Widget buildTop3() => Positioned(
      top: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FutureBuilder(
            initialData: "",
            future: getLeaderboardPosition(isGlobal, 3),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData){
                return buildRankedImage(40, 3, projectSnap.data);
              }  else {
                return Container();
              }
            },
          ),
          FutureBuilder(
            initialData: "",
            future: getLeaderboardPosition(isGlobal, 1),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData){
                return buildRankedImage(50, 1, projectSnap.data);
              }  else {
                return Container();
              }
            },
          ),
          FutureBuilder(
            initialData: "",
            future: getLeaderboardPosition(isGlobal, 2),
            builder: (context, AsyncSnapshot projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                return Container();
              } else if (projectSnap.hasData){
                return buildRankedImage(40, 2, projectSnap.data);
              }  else {
                return Container();
              }
            },
          ),
        ],
      )
  );

  Widget buildLeaderboardList(BuildContext context) => FutureBuilder(
    initialData: const [],
    future: getLeaderboard(isGlobal),
    builder: (context, AsyncSnapshot projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == false) {
        return Container();
      } else if (projectSnap.hasData){
        return  ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: projectSnap.data.length,
            itemBuilder: (BuildContext context, int index) {
              User user = projectSnap.data[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: index > 2 ? const Color(0xff63982e).withOpacity(0) : const Color(0xff86C24B),
                          radius: 20,
                          child: Text((index + 1).toString(), style: index > 2 ? headline : headline1),
                        ),
                        const SizedBox(width: 20),
                        Text(user.name, style: headline2),
                      ],
                    ),
                    Row(
                      children: [
                        Text(user.token_total.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/token.png"),)
                      ],
                    )
                  ]
                ),
              );
            }
        );
      }  else {
        return Container();
      }
    },
  );

  Widget buildRankedImage(double radius, int position, String img_url) => CircleAvatar(
      radius: radius + 2,
      backgroundColor: Colors.white,
      child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(img_url)
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff63982e),
                    child: Text(position.toString(), style: headline1),
                  ),
                )
            ),
          ]
      )
  );
}
