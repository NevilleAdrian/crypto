import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

// TODO: CONVERT TO CLASS BASED
PreferredSize buildAppBar(Widget leading, bool isDarkMode, Size size) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40.0), //appbar size
    child: AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: isDarkMode
          ? const Color(0xff06090d)
          : const Color(0xfff8f8f8), //appbar bg color
//      leading: Padding(
//        padding: EdgeInsets.only(
//          left: size.width * 0.05,
//        ),
//        child: leading,
//      ),

      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leadingWidth: size.width * 0.2,
      title: Padding(
        padding: const EdgeInsets.only(
          left: 25,
        ),
        child: Image.asset(
          isDarkMode
              ? 'assets/icons/DEdark.png'
              : 'assets/icons/DElight-2.png', //logo

          //        isDarkMode
          //            ? 'assets/icons/de-icon.png'
          //            : 'assets/icons/SobGOGdark.png', //logo
          height: size.height * 0.06,
          width: size.width * 0.40,
        ),
      ),
      centerTitle: false,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 26,
          ),
          child: Icon(
            UniconsLine.search,
            color: isDarkMode ? Colors.white : Colors.black,
            size: size.height * 0.025,
          ),
        ),
      ],
    ),
  );
}
