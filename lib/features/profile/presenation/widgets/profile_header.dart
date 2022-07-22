import 'dart:ui';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:de_marketplace/features/profile/data/model/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/fonts.dart';
import '../../../../shared/utils/size_manager.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  const ProfileHeader({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    const headerHeight = 350.0;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

    List<Widget> _children = [
      const _TextField(),
      const _TestContainer(color: Color(0xEEFFFF00)),
      const _TextField(),
      const _TestContainer(color: Color(0xDD99FF00)),
      const _TextField(),
      const _TestContainer(color: Color(0xCC00FFFF)),
      const _TextField(),
      const _TestContainer(color: Color(0xBB555555)),
      const _TextField(),
      const _TestContainer(color: Color(0xAAFF5555)),
      const _TextField(),
      const _TestContainer(color: Color(0x9900FF00)),
      const _TextField(),
      const _TestContainer(color: Color(0x8800FF00)),
      const _TextField(),
      const _TestContainer(color: Color(0x7700FF00)),
      const _TextField(),
    ];
    void _showSheetWithoutList() {
      showStickyFlexibleBottomSheet<void>(
        minHeight: 0,
        initHeight: 0.5,
        maxHeight: .8,
        headerHeight: 80,
        context: context,
//      isSafeArea: isUseSafeArea,
//      bottomSheetColor: Colors.transparent,
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        headerBuilder: (context, offset) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(offset == 0.8 ? 0 : 40),
                topRight: Radius.circular(offset == 0.8 ? 0 : 40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Filter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Text(
                  'position $offset',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          );
        },
        bodyBuilder: (context, offset) {
          return SliverChildListDelegate(
            _children,
          );
        },
        anchors: [.2, 0.5, .8],
      );
    }

    Widget _buildPopupIcon(isDarkMode) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () => _showSheetWithoutList(),
              child: Icon(
                Icons.manage_search,
                size: 30.0,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      );
    }

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
                    // _buildPopupIcon(isDarkMode),
                    // _buildRefreshIcon(isDarkMode),
                    // _buildFavIcon(isDarkMode),
                    // _buildBellIcon(isDarkMode),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _buildTitle(isDarkMode),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _buildAvatar(isDarkMode),
                ),
                Center(
                  child: Container(
                      // width: 170,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blueAccent,
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.checkmark_shield_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Verifeyed",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      )),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isDarkMode
                            ? Image.asset(
                                'assets/images/browser_white.png',
                                height: 22,
                              )
                            : Image.asset(
                                'assets/images/browser_black.png',
                                height: 22,
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        isDarkMode
                            ? Image.asset(
                                'assets/images/twitter_white.png',
                                height: 22,
                              )
                            : Image.asset(
                                'assets/images/twitter_black.png',
                                height: 22,
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        isDarkMode
                            ? Image.asset(
                                'assets/images/discord_white.png',
                                height: 22,
                              )
                            : Image.asset(
                                'assets/images/discord_black.png',
                                height: 29,
                              ),
                      ],
                    ),
                  ),
                ),
                _buildCollectionStats(isDarkMode),
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

class _TextField extends StatelessWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }
}

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}
