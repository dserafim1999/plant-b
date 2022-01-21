import 'package:flutter/material.dart';

class Friend extends StatelessWidget {
  final String label;
  final String img_url;

  const Friend({
    Key? key,
    required this.label,
    required this.img_url,
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
                  backgroundImage: NetworkImage(img_url),
                ),
              ),
              SizedBox(height: 15),
              Text(label, style: TextStyle(fontSize: 15, color: Colors.white))
            ],
      ),
    );
  }


}



