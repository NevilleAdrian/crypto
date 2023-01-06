import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

var appColor = HexColor('#122645');
var backGroundColor = HexColor('#0F0F1E');
var primaryColor = HexColor("#BBE71F");
var secondaryColor = HexColor("#00C5FF");
var darkPrimaryColor = HexColor("#BBE71F").withOpacity(0.5);
var lightSecondaryColor = HexColor("#00C5FF").withOpacity(0.5);
var whiteColor = HexColor("#FFFFFF");
var blackColor = HexColor("#000000");
var greyColor = HexColor("#667085");
var cardColor = HexColor("#101828");
var firstCardColor = HexColor("#D0D5DD");
var lemonColor = HexColor("#ABFF00");
var calendarColor = HexColor("#1D2939");

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}



