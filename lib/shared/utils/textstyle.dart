import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle textStyleSmall = const TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.normal);

TextStyle textStyleGreySmall = TextStyle(
    color: greyColor,
    fontSize: 12.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.normal);

TextStyle textStyleSmallMedium = const TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w500);

TextStyle textStyleSmall14 = const TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w500);

TextStyle textStyleSmallBold = const TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w700);

TextStyle textStyleBigBold = const TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w600);

TextStyle textStyleBig500 = const TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.w400);

TextStyle textStyleBig = const TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontFamily: "ClashDisplay",
    fontWeight: FontWeight.normal);

SizedBox kSmallWidth = SizedBox(width: 20.0);
SizedBox kLargeWidth = SizedBox(width: 50.0);
SizedBox kVerySmallHeight = SizedBox(height: 5.0);
SizedBox kVerySmallWidth = SizedBox(width: 15.0);
SizedBox kModerateWidth = SizedBox(width: 13.0);
SizedBox kMediumWidth = SizedBox(width: 20.0);
SizedBox kSmallestWidth = SizedBox(width: 6.0);
SizedBox kSmallHeight = SizedBox(height: 20.0);
SizedBox kMediumHeight = SizedBox(height: 12.0);
SizedBox kNormalHeight = SizedBox(height: 10.0);
SizedBox kLargeHeight = SizedBox(height: 50.0);
SizedBox kBiggerHeight = SizedBox(height: 25.0);

final Shader linearGradient = LinearGradient(
  colors: <Color>[primaryColor, secondaryColor],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
