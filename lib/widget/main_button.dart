import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';

class MainButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? icon;
  final Color? txtColor;
  final Color btnColor;
  const MainButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    this.txtColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.0,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: txtColor != null
                  ? headline2.copyWith(color: txtColor)
                  : headline2,
            )
          ],
        ),
      ),
    );
  }
}