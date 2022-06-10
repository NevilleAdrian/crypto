import '../../../../shared/widgets/appbar.dart';
import 'home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../collections/presentation/views/collections_explore.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key, menuScreenContext}) : super(key: key);

  List<Widget> _buildScreens(context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    return [
      const HomeScreen(),
      const CollectionExplore(),
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
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary:
            isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.table),
        title: ("Collections"),
        activeColorPrimary:
            isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.calendar),
        title: ("Calendar"),
        activeColorPrimary:
            isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Settings"),
        activeColorPrimary:
            isDarkMode ? CupertinoColors.white : CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController? _controller;
    bool? _hideNavBar;

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
            ? Colors.black.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.zero,
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
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        selectedTabScreenContext: (context) {},
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
//            borderRadius: BorderRadius.circular(20.0)
            borderRadius: BorderRadius.circular(0.0)),
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
