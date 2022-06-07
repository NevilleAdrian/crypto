import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildCategory(String name, String featured, bool seeall, Color defaultFontColor, Size size) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
      size.width * 0.075,
      size.height * 0.02,

      featured != ""?
      size.width * 0
          :
      size.width * 0.075,

      size.height * 0.005,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            color: defaultFontColor,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),

        featured != ""?
        Text(
            featured,
            style: GoogleFonts.lato(
              color: defaultFontColor.withOpacity(0.9),
              fontSize: size.width * 0.055,
              fontWeight: FontWeight.bold,
            )
        ):
        Container(),

        seeall ?
        Text(
          "See all",
          style: GoogleFonts.lato(
            color: defaultFontColor.withOpacity(0.7),
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.bold,
          )
        ):
        Container(),
      ],
    ),
  );
}
