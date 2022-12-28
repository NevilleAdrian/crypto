import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: "ClashDisplay",
    primaryColor: primaryColor,
    textTheme: Theme.of(context)
        .textTheme
        .apply(fontFamily: 'ClashDisplay', fontSizeDelta: 1.5),
    primaryTextTheme:
        Theme.of(context).textTheme.apply(fontFamily: 'ClashDisplay'),
    accentTextTheme:
        Theme.of(context).textTheme.apply(fontFamily: 'ClashDisplay'),
    scaffoldBackgroundColor: backGroundColor,
    backgroundColor: backGroundColor,
//    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
      contentPadding: EdgeInsets.all(2.0),
      // focusedBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(color: kGoogleBorderColor, width: 1),
      // ),
      // enabledBorder: UnderlineInputBorder(
      //   borderSide:
      //       BorderSide(color: kGoogleBorderColor.withOpacity(0.3), width: 1),
      // ),
    ),

    canvasColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      elevation: 2,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "ClashDisplay",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
