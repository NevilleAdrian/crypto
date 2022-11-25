import 'package:flutter/material.dart';

Widget circularProgressIndicator({Color? color}) => CircularProgressIndicator(
      strokeWidth: 1,
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(color!),
    );

bool checkImage(String image) {
  bool _validURL = Uri.parse(image).isAbsolute;
  print('validURL: $_validURL');

  return _validURL;
}
