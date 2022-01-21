import 'package:flutter/material.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/pages/rewards/rewards_carousel.dart';
import 'package:plant_b/core/styles.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key? key}) : super(key: key);

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
                const Image(
                  image: AssetImage("assets/logo.png"),
                  width: 75,
                ),
                const SizedBox(width: 15),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
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
                                loggedUser.token_amount.toString(),
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
          ),
          const RewardsCarousel(),
        ],
      ),
    );
  }
}
