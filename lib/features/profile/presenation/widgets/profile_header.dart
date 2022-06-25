import 'dart:ui';

import '../../../../shared/utils/size_manager.dart';

import '../../data/model/profile.dart';
import '../../../../shared/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  const ProfileHeader({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    const headerHeight = 240.0;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      height: SizeMg.height(headerHeight),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              spreadRadius: SizeMg.radius(2.0),
              blurRadius: SizeMg.radius(4.0),
              offset: const Offset(0.0, 1.0),
              color: isDarkMode ? Colors.black38 : const Color(0xfff8f8f8)),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            child: Container(
              height: headerHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/solarians.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDarkMode
                        ? [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.75),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.75),
                            Colors.black.withOpacity(0.9),
                          ]
                        : [
                            const Color(0xfff8f8f8),
                            const Color(0xfff8f8f8).withOpacity(0.7),
                            const Color(0xfff8f8f8).withOpacity(0.4),
                            const Color(0xfff8f8f8).withOpacity(0.6),
                            const Color(0xfff8f8f8),
                          ],
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: topPadding, left: 15.0, right: 15.0, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildRefreshIcon(isDarkMode),
                    _buildFavIcon(isDarkMode),
                    _buildBellIcon(isDarkMode),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _buildTitle(isDarkMode),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _buildAvatar(isDarkMode),
                ),
                _buildCollectionStats(isDarkMode)
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build the top icons at the top right corner of the header
  Widget _buildBellIcon(isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.notifications_active,
              color: isDarkMode ? Colors.white : Colors.black,
              size: 25.0,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildFavIcon(isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: isDarkMode ? Colors.white : Colors.black,
              size: 25.0,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildRefreshIcon(isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.refresh,
              color: isDarkMode ? Colors.white : Colors.black,
              size: 25.0,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildTitle(isDarkMode) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Solarians",
                      style: TextStyle(
                          fontFamily: AppFontNames.timeBurner,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 35.0,
                          letterSpacing: 1.0))
                ])));
  }

  /// The avatar consists of the profile image, the users name and location
  Widget _buildAvatar(isDarkMode) {
    final subTextStyle = TextStyle(
        fontFamily: AppFontNames.timeBurner,
        fontSize: 16.0,
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.w700);

    return Row(
      children: <Widget>[
        Container(
          width: 70.0,
          height: 60.0,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/solarians-profile.png"),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: isDarkMode ? Colors.black : Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 20.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 230,
              height: 80,
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Text(profile.topText, style: subTextStyle),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCollectionStats(isDarkMode) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildCollectionStat("Floor", "◎315", isDarkMode),
            _buildVerticalDivider(isDarkMode),
            _buildCollectionStat("Volume", "◎3150", isDarkMode),
            _buildVerticalDivider(isDarkMode),
            _buildCollectionStat("Supply", "10", isDarkMode),
            _buildVerticalDivider(isDarkMode),
            _buildCollectionStat("Listed", "10", isDarkMode),

//        _buildVerticalDivider(isDarkMode),
//        _buildCollectionStat("Total Likes", profile.totalLikesString),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionStat(String title, String value, bool isDarkMode) {
    final titleStyle = TextStyle(
      fontSize: 16.0,
      color: isDarkMode ? Colors.white : Colors.black,
    );
    final valueStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: isDarkMode ? Colors.white : Colors.black,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(title, style: titleStyle),
        Text(value, style: valueStyle),
      ],
    );
  }

  Widget _buildVerticalDivider(isDarkMode) {
    return Container(
      height: 30.0,
      width: 1.0,
      color: isDarkMode ? Colors.white : Colors.black,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
