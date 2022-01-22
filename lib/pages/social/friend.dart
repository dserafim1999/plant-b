import 'package:flutter/material.dart';
import 'package:plant_b/models/user.model.dart';

class Friend extends StatelessWidget {
  final User friend;

  const Friend({
    Key? key,
    required this.friend
  }) : super(key: key);

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 52,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(friend.img_url),
                ),
              ),
              SizedBox(height: 15),
              Text(friend.name, style: TextStyle(fontSize: 15, color: Colors.white))
            ],
      ),
    );
  }


}



