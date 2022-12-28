import 'package:de_marketplace/shared/utils/wizard.dart';
import 'package:flutter/material.dart';

class UniData {
  static const List<String> wizard_title = [
    "Bounty Hunters",
    "Solarians",
    "Kid Fighters",
    "Jumanji"
  ];
  static const List<String> wizard_brief = [
    "Join the metaverse. Create your army. There could be a lot of words that we cannot expect and this could go on forever and forever more. What Then?",
    "Join the metaverse. Create your army. There could be a lot of words that we cannot expect and this could go on forever and forever more. What Then?",
    "Join the metaverse. Create your army. There could be a lot of words that we cannot expect and this could go on forever and forever more. What Then?",
    "Join the metaverse. Create your army. There could be a lot of words that we cannot expect and this could go on forever and forever more. What Then?",
  ];
  static const List<String> wizard_image = [
    "banner1.png",
    "banner1.png",
    "banner1.png",
    "banner1.png",
  ];
  static const List<String> wizard_background = [
    "banner1.png",
    "banner1.png",
    "banner1.png",
    "banner1.png"
  ];
  static const List<Color> wizard_color = [
    Color.fromRGBO(83, 113, 255, 1),
    Color.fromRGBO(105, 90, 255, 1),
    Color.fromRGBO(0, 151, 255, 1),
    Color(0xff665eff),
  ];

  static List<Wizard> getWizard() {
    List<Wizard> items = [];
    for (int i = 0; i < wizard_title.length; i++) {
      Wizard obj = new Wizard();
      obj.image = wizard_image[i];
      // obj.background = wizard_background[i];
      obj.title = wizard_title[i];
      obj.brief = wizard_brief[i];
      obj.color = wizard_color[i];
      items.add(obj);
    }
    return items;
  }
}
