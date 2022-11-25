import 'package:de_marketplace/core/providers/page_controller/page_controller.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/events.dart';
import 'package:de_marketplace/features/profile/presenation/views/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:unicons/unicons.dart';

import '../../../../shared/widgets/appbar.dart';
import '../../../collections/presentation/views/collections_explore.dart';
import 'home_widget.dart';

class Dashboard extends StatefulWidget {
  final int? index;

  const Dashboard({Key? key, menuScreenContext, this.index}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController? _pageController;
  int? _selectedIndex;

  final List<Widget> _buildScreens = [
    const HomeScreen(),
    const CollectionExplore(),
    const EventScreen(),
    const ProfilePage(),
  ];

  List<BottomNavigationBarItem> _navBarsItems(isDarkMode) {
    return [
      BottomNavigationBarItem(
          icon: const Icon(
            CupertinoIcons.home,
            color: CupertinoColors.systemGrey,
          ),
          label: 'Home',
          activeIcon: Icon(
            CupertinoIcons.home,
            color: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
          )),
      BottomNavigationBarItem(
          icon: const Icon(
            CupertinoIcons.table,
            color: CupertinoColors.systemGrey,
          ),
          label: 'Collections',
          activeIcon: Icon(
            CupertinoIcons.table,
            color: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
          )),
      BottomNavigationBarItem(
          icon: const Icon(
            CupertinoIcons.calendar,
            color: CupertinoColors.systemGrey,
          ),
          label: 'Calendar',
          activeIcon: Icon(
            CupertinoIcons.calendar,
            color: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
          )),
      BottomNavigationBarItem(
          icon: const Icon(
            CupertinoIcons.profile_circled,
            color: CupertinoColors.systemGrey,
          ),
          label: 'Settings',
          activeIcon: Icon(
            CupertinoIcons.profile_circled,
            color: isDarkMode ? CupertinoColors.white : CupertinoColors.black,
          )),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapped(int selectedIndex) {
    _pageController!.jumpToPage(selectedIndex);
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.index ?? 0,
    );
    _selectedIndex = widget.index ?? 0;
    PageMixin.pageProvider(context).setPageController(_pageController!);
    super.initState();
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
      body: PageView(
        controller: _pageController,
        children: _buildScreens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onTapped,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex!,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: isDarkMode
              ? Colors.white.withOpacity(0.8)
              : Colors.black.withOpacity(0.8),
          iconSize: 20,
          items: _navBarsItems(isDarkMode)),
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _buildScreens(context),
//         items: _navBarsItems(isDarkMode),
//         confineInSafeArea: true,
//         backgroundColor: isDarkMode
//             ? Colors.black.withOpacity(0.8)
//             : Colors.white.withOpacity(0.8),
//         handleAndroidBackButtonPress: true,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//         navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
//             ? 0.0
//             : kBottomNavigationBarHeight,
//         hideNavigationBarWhenKeyboardShows: true,
//         margin: EdgeInsets.zero,
//         popActionScreens: PopActionScreensType.all,
//         bottomScreenMargin: 0.0,
//         onWillPop: (context) async {
//           await showDialog(
//             context: context!,
//             useSafeArea: true,
//             builder: (context) => Container(
//               height: 50.0,
//               width: 50.0,
//               color: Colors.white,
//               child: ElevatedButton(
//                 child: const Text("Close"),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           );
//           return false;
//         },
//         selectedTabScreenContext: (context) {},
//         hideNavigationBar: _hideNavBar,
//         decoration: NavBarDecoration(
//             colorBehindNavBar: Colors.indigo,
// //            borderRadius: BorderRadius.circular(20.0)
//             borderRadius: BorderRadius.circular(0.0)),
//         popAllScreensOnTapOfSelectedTab: true,
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 400),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle:
//             NavBarStyle.style12, // Choose the nav bar style with this property
//       ),
    );
  }
}
