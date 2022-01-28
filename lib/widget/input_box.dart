import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';

Widget InputBox({
  required String hintTxt,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
}) {
  return Container(
    height: 70.0,
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 270.0,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
            ),
            style: headline2,
          ),
        ),
      ],
    ),
  );
}