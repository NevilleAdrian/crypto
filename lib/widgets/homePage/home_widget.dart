import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:de_marketplace/widgets/homePage/category.dart';
import 'package:de_marketplace/widgets/top_creator_widget.dart';
import 'package:de_marketplace/widgets/homePage/featured_banner_widget.dart';
import 'package:de_marketplace/widgets/homePage/collections_verified.dart';


Scaffold buildHome(
    BuildContext context,
    ) {

  Size size = MediaQuery.of(context).size; //check the size of device
  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
//  bool isDarkMode = true; //check if device is in dark or light mode


  Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;


  return
    Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xff06090d)
                : const Color(0xfff8f8f8), //background color
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ListView(
                children: [

//                buildVideoThumbnail(isDarkMode, true, size),


                  buildFeaturedBanner(
                      isDarkMode,
                      "Solarians",
                      "assets/images/solarians.png",
                      size
                  ),


                  buildCategory("Latest Collections", "", false, defaultFontColor, size),

                  const SizedBox( height: 10),

                  SizedBox(
                    width: size.width,
                    height: size.height * 0.25,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        //! example bids
                        if (i == 0) {
                          return buildCollections(
                            'Solarians',
                            0.2,
                            'Ohme Ohmy',
                            'assets/images/avatar1.jpg',
                            'assets/images/solarians-profile.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 1) {
                          return buildCollections(
                            'Spectrum Labs Studio - Chapter I',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/spectrum-lab.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 2) {
                          return buildCollections(
                            'Poker Neko',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/kitties.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else {
                          return buildCollections(
                            'Dragon Watch Heroes',
                            1,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/dragonwatchheroes.jpeg',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox( height: 20),

                  buildCategory("Top Verified Collections", "", true, defaultFontColor, size),

                  const SizedBox( height: 10),

                  SizedBox(
                    width: size.width,
                    height: size.height * 0.25,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        //! example bids
                        if (i == 0) {
                          return buildCollections(
                              'Dragon Watch Heroes',
                              1,
                              'Nicole Boa',
                              'assets/images/avatar2.jpg',
                              'assets/collections/dragonwatchheroes.jpeg',
                              defaultFontColor,
                              isDarkMode,
                              size,
                              ''
                          );
                        } else if (i == 1) {
                          return buildCollections(
                            'Alpha Puppies',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/alphapuppies.gif',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 2) {
                          return buildCollections(
                            'Poker Neko',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/kitties.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else {
                          return buildCollections(
                              'Solarians',
                              0.2,
                              'Ohme Ohmy',
                              'assets/images/avatar1.jpg',
                              'assets/images/solarians-profile.png',
                              defaultFontColor,
                              isDarkMode,
                              size,
                              ''
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox( height: 20),

                  buildCategory("Ongoing Launches", "", true, defaultFontColor, size),

                  const SizedBox( height: 10),

                  SizedBox(
                    width: size.width,
                    height: size.height * 0.25,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        //! example bids
                        if (i == 0) {
                          return buildCollections(
                            'Solarians',
                            0.2,
                            'Ohme Ohmy',
                            'assets/images/avatar1.jpg',
                            'assets/images/solarians-profile.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 1) {
                          return buildCollections(
                            'Alpha Puppies',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/alphapuppies.gif',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 2) {
                          return buildCollections(
                            'Poker Neko',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/kitties.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else {
                          return buildCollections(
                            'Dragon Watch Heroes',
                            1,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/dragonwatchheroes.jpeg',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox( height: 20),

                  buildCategory("Upcoming Launches", "", true, defaultFontColor, size),

                  const SizedBox( height: 10),

                  SizedBox(
                    width: size.width,
                    height: size.height * 0.25,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        //! example bids
                        if (i == 0) {
                          return buildCollections(
                            'Solarians',
                            0.2,
                            'Ohme Ohmy',
                            'assets/images/avatar1.jpg',
                            'assets/images/solarians-profile.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 1) {
                          return buildCollections(
                            'Alpha Puppies',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/alphapuppies.gif',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else if (i == 2) {
                          return buildCollections(
                            'Poker Neko',
                            3,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/kitties.png',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        } else {
                          return buildCollections(
                            'Dragon Watch Heroes',
                            1,
                            'Nicole Boa',
                            'assets/images/avatar2.jpg',
                            'assets/collections/dragonwatchheroes.jpeg',
                            defaultFontColor,
                            isDarkMode,
                            size,
                            ''
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox( height: 20),

                  buildCategory("Top Solo Creators", "", true, defaultFontColor, size),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: size.width,
                    height: 150,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        //! example bids
                        if (i == 0) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: buildTopCreator(
                                'Nicole Boa',
                                'assets/images/avatar2.jpg',
                                "1.2M",
                                defaultFontColor,
                                isDarkMode,
                                size,
                              ),
                          );
                        } else if (i == 1) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: buildTopCreator(
                                'Nicole Boa',
                                'assets/images/avatar2.jpg',
                                "1.2M",
                                defaultFontColor,
                                isDarkMode,
                                size,
                              ),
                            );
                        } else {
                          return
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: buildTopCreator(
                                'Nicole Boa',
                                'assets/images/avatar2.jpg',
                                "1.2M",
                                defaultFontColor,
                                isDarkMode,
                                size,
                              ),
                            );
                        }
                      },
                    ),
                  ),

                  const SizedBox( height: 20),


//                BOTTOM SPACING

                  const SizedBox(
                    height: 80,
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
}
