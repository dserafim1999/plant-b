import 'package:flutter/material.dart';
import 'package:plant_b/pages/profile/profile_carousel.dart';
import 'package:plant_b/core/styles.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/user.png"),
                  radius: 65,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text(
                      "John Smith",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: 20),
                    Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Text(
                              "18900",
                              style: TextStyle(
                                  fontSize: 25
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 20,
                            )
                          ],
                        )
                    )
                  ]
                )
              ],
            ),
          ),
          const ProfileCarousel(),
        ],
      ),
    );
  }
}
