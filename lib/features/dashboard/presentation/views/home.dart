import 'package:de_marketplace/core/providers/page_controller/page_controller.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/events.dart';
import 'package:de_marketplace/features/profile/presenation/views/profile_page.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images/svg/home.svg'),
          label: 'Home',
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[primaryColor, secondaryColor],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: SvgPicture.asset('assets/images/svg/home.svg'),
          )),
      BottomNavigationBarItem(
          icon: Image.asset('assets/images/collections.png'),
          label: 'Collections',
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[primaryColor, secondaryColor],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: Image.asset('assets/images/collections.png'),
          )),
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images/svg/calendar.svg'),
          label: 'Calendar',
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[primaryColor, secondaryColor],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: SvgPicture.asset('assets/images/svg/calendar.svg'),
          )),
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/images/svg/profile.svg'),
          label: 'Account',
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[primaryColor, secondaryColor],
                tileMode: TileMode.repeated,
              ).createShader(bounds);
            },
            child: SvgPicture.asset('assets/images/svg/profile.svg'),
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
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: _pageController,
        children: _buildScreens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onTapped,
          backgroundColor: appColor,
          currentIndex: _selectedIndex!,
          unselectedLabelStyle: textStyleSmallMedium,
          selectedLabelStyle: textStyleSmallMedium.copyWith(
              foreground: Paint()..shader = linearGradient),
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          items: _navBarsItems()),
    );
  }
}
