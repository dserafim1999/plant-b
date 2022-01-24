import 'package:flutter/material.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/pages/profile/profile_carousel.dart';

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
          FutureBuilder(
              initialData: loggedUser,
              future: fakeLogin(),
              builder: (context, AsyncSnapshot projectSnap) {
                if (projectSnap.connectionState == ConnectionState.none &&
                    projectSnap.hasData == false) {
                  return Container();
                } else if (projectSnap.hasData) {
                  User user = projectSnap.data;

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 67,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.img_url),
                            radius: 65,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(height: 20),
                              Text(
                                  user.name,
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
                                    children: <Widget>[
                                      Text(
                                        user.token_amount.toString(),
                                        style: TextStyle(
                                            fontSize: 25
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundImage: AssetImage("assets/token.png"),
                                        radius: 20,
                                      )
                                    ],
                                  )
                              )
                            ]
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }
          ),
          const ProfileCarousel(),
        ],
      ),
    );
  }
}
