import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

// TODO: CONVERT TO CLASS BASED

Widget buildCategory(String name, String featured, bool seeall,
    Color defaultFontColor, Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/asterisk.png',
              height: 20,
            ),
            kVerySmallWidth,
            Text(name, style: textStyleSmallBold.copyWith(fontSize: 14)),
            featured != ""
                ? Text(featured, style: textStyleSmall)
                : Container(),
          ],
        ),
        seeall
            ? Text("View all",
                style: textStyleSmallBold.copyWith(
                    fontSize: 14, foreground: Paint()..shader = linearGradient))
            : Container()
      ],
    ),
  );
}
