import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:de_marketplace/widgets/appbar.dart';
import 'package:de_marketplace/widgets/homePage/collections_verified.dart';
import 'package:de_marketplace/widgets/homePage/category.dart';
import 'package:de_marketplace/widgets/homePage/home_widget.dart';
import 'package:de_marketplace/widgets/top_creator_widget.dart';
import 'package:de_marketplace/widgets/homePage/video_thumbnail_widget.dart';
import 'package:unicons/unicons.dart';

import 'package:de_marketplace/pages/collections_explore.dart';


import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key, menuScreenContext}) : super(key: key);


  List<Widget> _buildScreens(context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    return [
      buildHome(context),

      buildCollectionExplore(context),

      Center(
        child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xff3b22a1).withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Align(
            child: Text(
              "MINT CALENDAR",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),

      Center(
        child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xff3b22a1).withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Align(
            child: Text(
              "PROFILE",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(isDarkMode) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.table),
        title: ("Calendar"),
        activeColorPrimary: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      //SOLO
//      PersistentBottomNavBarItem(
//        activeColorPrimary: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
//        icon: isDarkMode ? Image.asset("assets/icons/solo-white.png", width: 23,) : Image.asset("assets/icons/solo-black.png", width: 23),
//        inactiveIcon: Image.asset("assets/icons/solo-grey.png", width: 23),
//        title: ("Solo"),
//      ),

      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.calendar),
        title: ("Calendar"),
        activeColorPrimary: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Settings"),
        activeColorPrimary: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController? _controller;
    bool? _hideNavBar;
    BuildContext? testContext;

    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
//  bool isDarkMode = true; //check if device is in dark or light mode

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(
        Icon(
          UniconsLine.bars,
          color: isDarkMode
              ? Colors.white
              : const Color(0xff3b22a1), //icon bg color
          size: size.height * 0.025,
        ),
        isDarkMode,
        size,
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(context),
        items: _navBarsItems(isDarkMode),
        confineInSafeArea: true,
        backgroundColor: isDarkMode
            ?Colors.black.withOpacity(0.8)
            :Colors.white.withOpacity(0.8),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          await showDialog(
            context: context!,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        selectedTabScreenContext: (context) {
          testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
//            borderRadius: BorderRadius.circular(20.0)
            borderRadius: BorderRadius.circular(0.0)
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
        NavBarStyle.style12, // Choose the nav bar style with this property
      ),
    );

  }
}
