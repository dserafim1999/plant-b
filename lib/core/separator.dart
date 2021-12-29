import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double? width;
  final double? height;
  const Separator({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height == null ? 0.0 : height,
      width: width == null ? 0.0 : width,
    );
  }
}