import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/shared/utils/unidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/wizard.dart';

class CardWizardRoute extends StatefulWidget {
  const CardWizardRoute({Key? key}) : super(key: key);

  @override
  CardWizardRouteState createState() => CardWizardRouteState();
}

class Img {
  static String get(String name) {
    print('assets/images/' + name);
    return 'assets/images/' + name;
  }
}

class CardWizardRouteState extends State<CardWizardRoute> {
  List<Wizard> wizardData = UniData.getWizard();
  PageController pageController = PageController(
    initialPage: 0,
  );
  int page = 0;
  bool isLast = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: PageView(
          onPageChanged: onPageViewChange,
          controller: pageController,
          children: buildPageViewItem(),
        ),
      ),
      buildDots(context)
    ]);
  }

  void onPageViewChange(int _page) {
    page = _page;
    isLast = _page == wizardData.length - 1;
    isFirst = _page == 0;
    setState(() {});
  }

  List<Widget> buildPageViewItem() {
    List<Widget> widgets = [];
    for (Wizard wz in wizardData) {
      Widget wg = Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              Img.get(wz.image),
              fit: BoxFit.contain,
            ),
            Container(
              color: appColor,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(wz.title,
                      style: textStyleSmallBold.copyWith(fontSize: 16)),
                  Container(
                    child: Text(wz.brief, style: textStyleSmall),
                  ),
                ],
              ),
            )
          ],
        ),
      );
      widgets.add(wg);
    }
    return widgets;
  }

  Widget buildDots(BuildContext context) {
    Widget widget;

    List<Widget> dots = [];
    for (int i = 0; i < wizardData.length; i++) {
      Widget w = Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 3,
        width: 45,
        child: Container(
            width: 45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    page == i ? primaryColor : greyColor,
                    page == i ? secondaryColor : greyColor,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            )),
      );
      dots.add(w);
    }
    widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
    return widget;
  }
}
