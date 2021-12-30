import 'package:flutter/material.dart';
import 'package:plant_b/pages/profile/profile_carousel.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ProfileCarousel();
  }
}
