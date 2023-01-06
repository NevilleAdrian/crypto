import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/collections_page.dart';
import 'package:de_marketplace/shared/home/volume_card.dart';
import 'package:de_marketplace/shared/ui_widgets/card_wizard.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/widgets/homePage/category.dart';
import '../../../../shared/widgets/homePage/collections_verified.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<dynamic> futureData;
  var _scrollController = ScrollController();

  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getTopCollections();
      var trendingResult = await auth.getTrendingCollections();
      var verifiedResult = await auth.getTopVerifiedCollections();

      setState(() {
        auth.setLatestCollection(result);
        auth.setTrendingCollections(trendingResult);
        auth.setTopVerifiedCollections(verifiedResult);
      });

      //Return future value
      return Future.value(result);
    } catch (ex) {}
  }

  @override
  void initState() {
    futureData = futureTask();

    _scrollController.addListener(() async {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
          print('top');
        } else {
          // You're at the bottom.
          setState(() {
            int offset = 10;
            int trendingOffset = 0;
            int verifiedOffset = 0;
            Auth.authProvider(context).setLatestOffset(offset += 10);
            Auth.authProvider(context).setTrendingOffset(trendingOffset += 10);
            Auth.authProvider(context).setVerifiedOffset(verifiedOffset += 10);
            print('bottom');
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    final collection =
        Auth.authProvider(context, listen: true).latestCollections;
    final trending =
        Auth.authProvider(context, listen: true).trendingCollections;
    final top = Auth.authProvider(context, listen: true).topVerifiedCollections;
    return Scaffold(
      body: SafeArea(
        child: FutureHelper(
          task: futureData,
          loader: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [circularProgressIndicator(color: defaultFontColor)],
          ),
          builder: (context, _) => Padding(
            padding: const EdgeInsets.only(top: 0),
            child: ListView(
              shrinkWrap: true,
              children: [
                buildAppBar(context),
                const SizedBox(height: 500, child: CardWizardRoute()),
                kSmallHeight,

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: appColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
                              ),
                            ),
                            child: Image.asset('assets/images/black_collection.png'),
                          ),
                          kVerySmallWidth,
                          Text('Popular collections',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          ),
                          kMediumWidth,
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: appColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(' 24H',
                                style: textStyleBig.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 33,),
                          InkWell(
                            onTap: (){},
                            child: GradientText(
                              'View All',
                              style: textStyleBig.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
                              ),
                            ),
                          ),

                          /// couldn't use the textButton cos it's difficult to use
                          /// a color gradient.
                          // TextButton(
                          //     onPressed: (){},
                          //     child: Text('View All',
                          //     style: textStyleBig.copyWith(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 14,
                          //
                          //     ),
                          //
                          //     ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      VolumeCard(image: 'assets/images/image_nft 2.jpeg',),
                      SizedBox(height: 12,),
                      VolumeCard(image: 'assets/images/creative_nft.jpeg',),
                      SizedBox(height: 12,),
                      VolumeCard(image: 'assets/images/creative_nft2.jpeg',),
                      SizedBox(height: 12,),
                      VolumeCard(image: 'assets/images/creative_nft6.jpeg',),
                    ],
                  ),
                ),

                kLargeHeight,
                Expanded(
                  child: CollectionCard("New Collections", defaultFontColor,
                      size, collection, isDarkMode),
                ),
                kLargeHeight,
                Expanded(
                  child: CollectionCard("Trending Collections",
                      defaultFontColor, size, trending, isDarkMode),
                ),
                kLargeHeight,
                Expanded(
                  child: CollectionCard("Top Verified Collections",
                      defaultFontColor, size, top, isDarkMode),
                ),

                // kSmallHeight,
                // buildCategory("Trending Collections", "", true,
                //     defaultFontColor, size),
                // kSmallHeight,
                // SizedBox(
                //   width: size.width,
                //   height: size.height * 0.25,
                //   child: ListView.builder(
                //     primary: false,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: Auth.authProvider(context, listen: true)
                //         .trendingCollections
                //         .length,
                //     itemBuilder: (context, i) {
                //       //! example bids
                //       dynamic collection =
                //           Auth.authProvider(context, listen: true)
                //               .trendingCollections;
                //
                //       return buildCollections(
                //           collection[i]['name'],
                //           20.0,
                //           'Nicole Boa',
                //           'assets/images/avatar2.jpg',
                //           checkImage(collection[i]['thumbnail'])
                //               ? collection[i]['thumbnail']
                //               : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                //           defaultFontColor,
                //           isDarkMode,
                //           size,
                //           '',
                //           onTap: () => Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => DetailsPage(
                //                         args: Args(
                //                           isDarkMode: isDarkMode,
                //                           collectionName: collection[i]
                //                               ['name'],
                //                           collectionId: "solarians-1234",
                //                           collectionProfileImg:
                //                               "assets/images/solarians.png",
                //                           size: size,
                //                           collectionImg: checkImage(
                //                                   collection[i]
                //                                       ['thumbnail'])
                //                               ? collection[i]['thumbnail']
                //                               : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                //                         ),
                //                       ))));
                //       // if (i == 0) {
                //       //   return buildCollections(
                //       //       'Dragon Watch Heroes',
                //       //       1,
                //       //       'Nicole Boa',
                //       //       'assets/images/avatar2.jpg',
                //       //       'assets/collections/dragonwatchheroes.jpeg',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // } else if (i == 1) {
                //       //   return buildCollections(
                //       //       'Alpha Puppies',
                //       //       3,
                //       //       'Nicole Boa',
                //       //       'assets/images/avatar2.jpg',
                //       //       'assets/collections/alphapuppies.gif',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // } else if (i == 2) {
                //       //   return buildCollections(
                //       //       'Poker Neko',
                //       //       3,
                //       //       'Nicole Boa',
                //       //       'assets/images/avatar2.jpg',
                //       //       'assets/collections/kitties.png',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // } else {
                //       //   return buildCollections(
                //       //       'Solarians',
                //       //       0.2,
                //       //       'Ohme Ohmy',
                //       //       'assets/images/avatar1.jpg',
                //       //       'assets/images/solarians-profile.png',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // }
                //     },
                //   ),
                // ),
                //
                // const SizedBox(height: 20),
                //
                // buildCategory("Top Verified Collections", "", true,
                //     defaultFontColor, size),
                //
                // const SizedBox(height: 10),
                //
                // SizedBox(
                //   width: size.width,
                //   height: size.height * 0.25,
                //   child: ListView.builder(
                //     primary: false,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: Auth.authProvider(context, listen: true)
                //         .topVerifiedCollections
                //         .length,
                //     itemBuilder: (context, i) {
                //       dynamic collection =
                //           Auth.authProvider(context, listen: true)
                //               .topVerifiedCollections;
                //
                //       return buildCollections(
                //           collection[i]['name'],
                //           20.0,
                //           'Nicole Boa',
                //           'assets/images/avatar2.jpg',
                //           checkImage(collection[i]['thumbnail'])
                //               ? collection[i]['thumbnail']
                //               : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                //           defaultFontColor,
                //           isDarkMode,
                //           size,
                //           '',
                //           onTap: () => Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => DetailsPage(
                //                         args: Args(
                //                           isDarkMode: isDarkMode,
                //                           collectionName: collection[i]
                //                               ['name'],
                //                           collectionId: "solarians-1234",
                //                           collectionProfileImg:
                //                               "assets/images/solarians.png",
                //                           size: size,
                //                           collectionImg: checkImage(
                //                                   collection[i]
                //                                       ['thumbnail'])
                //                               ? collection[i]['thumbnail']
                //                               : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                //                         ),
                //                       ))));
                //
                //       // AppNavigator.pushNamed(
                //       //   detailsViewRoute,
                //       //   arguments: Args(
                //       //     isDarkMode: isDarkMode,
                //       //     collectionName: 'Solarians',
                //       //     collectionId: "solarians-1234",
                //       //     collectionProfileImg: "assets/images/solarians.png",
                //       //     size: size,
                //       //   ),
                //       // )
                //       //! example bids
                //       // if (i == 0) {
                //       //   return buildCollections(
                //       //       'Solarians',
                //       //       0.2,
                //       //       'Ohme Ohmy',
                //       //       'assets/images/avatar1.jpg',
                //       //       'assets/images/solarians-profile.png',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // } else if (i == 1) {
                //       //   return buildCollections(
                //       //       'Alpha Puppies',
                //       //       3,
                //       //       'Nicole Boa',
                //       //       'assets/images/avatar2.jpg',
                //       //       'assets/collections/alphapuppies.gif',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // } else if (i == 2) {
                //       //   return buildCollections(
                //       //       'Poker Neko',
                //       //       3,
                //       //       'Nicole Boa',
                //       //       'assets/images/avatar2.jpg',
                //       //       'assets/collections/kitties.png',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // } else {
                //       //   return buildCollections(
                //       //       'Dragon Watch Heroes',
                //       //       1,
                //       //       'Nicole Boa',
                //       //       'assets/images/avatar2.jpg',
                //       //       'assets/collections/dragonwatchheroes.jpeg',
                //       //       defaultFontColor,
                //       //       isDarkMode,
                //       //       size,
                //       //       '');
                //       // }
                //     },
                //   ),
                // ),
                //
                // const SizedBox(height: 20),

                // buildCategory(
                //     "Upcoming Launches", "", true, defaultFontColor, size),
                //
                // const SizedBox(height: 10),
                //
                // SizedBox(
                //   width: size.width,
                //   height: size.height * 0.25,
                //   child: ListView.builder(
                //     primary: false,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 4,
                //     itemBuilder: (context, i) {
                //       //! example bids
                //       if (i == 0) {
                //         return buildCollections(
                //             'Solarians',
                //             0.2,
                //             'Ohme Ohmy',
                //             'assets/images/avatar1.jpg',
                //             'assets/images/solarians-profile.png',
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //             '');
                //       } else if (i == 1) {
                //         return buildCollections(
                //             'Alpha Puppies',
                //             3,
                //             'Nicole Boa',
                //             'assets/images/avatar2.jpg',
                //             'assets/collections/alphapuppies.gif',
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //             '');
                //       } else if (i == 2) {
                //         return buildCollections(
                //             'Poker Neko',
                //             3,
                //             'Nicole Boa',
                //             'assets/images/avatar2.jpg',
                //             'assets/collections/kitties.png',
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //             '');
                //       } else {
                //         return buildCollections(
                //             'Dragon Watch Heroes',
                //             1,
                //             'Nicole Boa',
                //             'assets/images/avatar2.jpg',
                //             'assets/collections/dragonwatchheroes.jpeg',
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //             '');
                //       }
                //     },
                //   ),
                // ),
                //
                // const SizedBox(height: 20),
                //
                // buildCategory(
                //     "Top Solo Creators", "", true, defaultFontColor, size),
                //
                // const SizedBox(height: 10),
                //
                // SizedBox(
                //   width: size.width,
                //   height: 150,
                //   child: ListView.builder(
                //     primary: false,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 3,
                //     itemBuilder: (context, i) {
                //       //! example bids
                //       if (i == 0) {
                //         return Padding(
                //           padding: const EdgeInsets.only(left: 20),
                //           child: buildTopCreator(
                //             'Nicole Boa',
                //             'assets/images/avatar2.jpg',
                //             "1.2M",
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //           ),
                //         );
                //       } else if (i == 1) {
                //         return Padding(
                //           padding: const EdgeInsets.only(left: 20),
                //           child: buildTopCreator(
                //             'Nicole Boa',
                //             'assets/images/avatar2.jpg',
                //             "1.2M",
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //           ),
                //         );
                //       } else {
                //         return Padding(
                //           padding: const EdgeInsets.only(left: 20),
                //           child: buildTopCreator(
                //             'Nicole Boa',
                //             'assets/images/avatar2.jpg',
                //             "1.2M",
                //             defaultFontColor,
                //             isDarkMode,
                //             size,
                //           ),
                //         );
                //       }
                //     },
                //   ),
                // ),
                //
                // const SizedBox(height: 20),

//                BOTTOM SPACING


                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column CollectionCard(
      String name,
      Color defaultFontColor,
      Size size,
      collection,
      bool isDarkMode
      ) {
    return Column(
      children: [
        buildCategory(name, "", false, defaultFontColor, size),
        kSmallHeight,
        SizedBox(
          height: size.height * 0.38,
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: collection.length,
            itemBuilder: (context, i) {
              return buildCollections(
                  collection[i]['name'],
                  20.0,
                  'Nicole Boa',
                  'assets/images/avatar2.jpg',
                  checkImage(collection[i]['thumbnail'])
                      ? collection[i]['thumbnail']
                      : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                  defaultFontColor,
                  isDarkMode,
                  size,
                  '',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                args: Args(
                                  isDarkMode: isDarkMode,
                                  collectionName: collection[i]['name'],
                                  collectionId: "solarians-1234",
                                  collectionProfileImg:
                                      "assets/images/solarians.png",
                                  size: size,
                                  collectionImg: checkImage(
                                          collection[i]['thumbnail'])
                                      ? collection[i]['thumbnail']
                                      : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                                ),
                              ))));
            },
          ),
        )
      ],
    );
  }
}


