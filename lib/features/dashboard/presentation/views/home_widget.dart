import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/home.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/dropdown/dropdown.dart';
import 'package:de_marketplace/shared/collections/deGods_collection.dart';
import 'package:de_marketplace/shared/home/volume_card.dart';
import 'package:de_marketplace/shared/ui_widgets/card_wizard.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';

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
  var _upcomingScrollController = ScrollController();

  List<String> values = ['24 H', '7 Days', 'All'];

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

    print('trending: $trending');
    return Scaffold(
      body: SafeArea(
        child: FutureHelper(
          task: futureData,
          loader:
              Center(child: circularProgressIndicator(color: defaultFontColor)),
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
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color(0XFFBBE71F),
                                  Color(0XFF00C5FF)
                                ],
                              ),
                            ),
                            child: Image.asset(
                                'assets/images/black_collection.png'),
                          ),
                          kVerySmallWidth,
                          Text(
                            'Popular collections',
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          kModerateWidth,
                          DropDownItem(
                            values: values,
                            onPressed: (String? value) {
                              setState(() {
                                Auth.authProvider(context).setDropValue(value);
                                print('value: $value');
                              });
                            },
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: appColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard(
                                            index: 1,
                                          )));
                            },
                            child: GradientText(
                              'View All',
                              style: textStyleBig.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color(0XFFBBE71F),
                                  Color(0XFF00C5FF)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 500,
                        child: ListView.separated(
                          separatorBuilder: (context, i) => const SizedBox(
                            height: 12,
                          ),
                          itemCount: trending.length,
                          itemBuilder: (context, i) => VolumeCard(
                            image: checkImage(trending[i]['thumbnail'])
                                ? trending[i]['thumbnail']
                                : '$IMAGE_KIT_ENDPOINT_URL${trending[i]['thumbnail']}',
                            name: trending[i]['name'],
                            hours:
                                Auth.authProvider(context).dropValue == '7 Days'
                                    ? '7D'
                                    : Auth.authProvider(context).dropValue,
                            floorPrice: '0',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                kLargeHeight,
                Expanded(
                  child: CollectionCard("New Collections", _scrollController,
                      defaultFontColor, size, collection, isDarkMode),
                ),
                kLargeHeight,
                // Expanded(
                //   child: CollectionCard("Trending Collections",
                //       defaultFontColor, size, trending, isDarkMode),
                // ),
                // kLargeHeight,
                Expanded(
                  child: CollectionCard(
                      "Upcoming Launches",
                      _upcomingScrollController,
                      defaultFontColor,
                      size,
                      top,
                      isDarkMode),
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

  Column CollectionCard(String name, ScrollController controller,
      Color defaultFontColor, Size size, collection, bool isDarkMode) {
    return Column(
      children: [
        buildCategory(name, "", false, defaultFontColor, size),
        kSmallHeight,
        SizedBox(
          height: size.height * 0.38,
          child: ListView.builder(
            controller: controller,
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
                          builder: (context) => DeGodsCollection(
                                args: Args(
                                  isDarkMode: isDarkMode,
                                  collectionName: collection[i]['name'],
                                  description: collection[i]['description'],
                                  collectionId: "solarians-1234",
                                  collectionProfileImg:
                                      "assets/images/solarians.png",
                                  size: size,
                                  collectionImg: checkImage(
                                          collection[i]['thumbnail'])
                                      ? collection[i]['thumbnail']
                                      : '$IMAGE_KIT_ENDPOINT_URL${collection[i]['thumbnail']}',
                                  verified: collection[i]['verifeyed'],
                                  floorPrice: collection[i]['floorPrice'],
                                  volume24hrs: collection[i]['volumePast24h'],
                                  totalVol: collection[i]['volumeTotal'],
                                ),
                              ))));
            },
          ),
        )
      ],
    );
  }
}
