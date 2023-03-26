import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/dropdown/dropdown.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/textform/textform.dart';
import 'package:de_marketplace/shared/collections/deGods_collection.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class CollectionExplore extends StatefulWidget {
  const CollectionExplore({Key? key}) : super(key: key);

  @override
  State<CollectionExplore> createState() => _CollectionExploreState();
}

class _CollectionExploreState extends State<CollectionExplore> {
  late Future<dynamic> futureData;
  var _scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  FocusNode textFocus = FocusNode();

  List<String> values = [
    'Recent',
    '24 H',
    '7 Days',
    'Total',
    'L to H',
    'H to L'
  ];

  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getAllCollections('epoch');

      setState(() {
        auth.setAllCollections(result);
      });

      print('result:$result');

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
          Auth.authProvider(context).setAllOffset(0);
        } else {
          // You're at the bottom.
          setState(() {
            int offset = Auth.authProvider(context).allOffset;
            Auth.authProvider(context).setAllOffset(offset += 10);
            print('bottom');
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textFocus.dispose();
    super.dispose();
  }

  navigateToNextScreen(int i, dynamic collections) {
    Size size = MediaQuery.of(context).size; //check the size of device

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DeGodsCollection(
                  args: Args(
                isDarkMode: false,
                collectionName: collections[i]['name'],
                description: collections[i]['description'],
                collectionId: "solarians-1234",
                collectionProfileImg: "assets/images/solarians.png",
                size: size,
                collectionImg: checkImage(collections[i]['thumbnail'])
                    ? collections[i]['thumbnail']
                    : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}',
                verified: collections[i]['verifeyed'],
                floorPrice: collections[i]['floorPrice'],
                volume24hrs: collections[i]['volumePast24h'],
                totalVol: collections[i]['volumeTotal'],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Auth.authProvider(context);
    final collection =
        Auth.authProvider(context, listen: true).latestCollections;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    var collections = auth.allCollections;
    print('collections: $collections');

    var rowTabs = [
      'Tokens',
      'Listed',
      'Total Vol',
      '24 Hrs Vol',
      'Floor Price',
    ];

    List<Widget> _buildCells(int count, dynamic collections) {
      return List.generate(
        count,
        (i) => InkWell(
          onTap: () {
            navigateToNextScreen(i, collections);
          },
          child: Container(
            alignment: Alignment.center,
            width: 120.0,
            height: 60.0,
            // color: Colors.white,
            margin: EdgeInsets.all(4.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(checkImage(
                                collections[i]['thumbnail'])
                            ? collections[i]['thumbnail']
                            : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}'),
                      ),
                    ),
                    child: Text(''),
                  ),
                ),
                Expanded(
                  child: Text(
                    collections[i]['name'],
                    style: textStyleSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget tableBody(String type, String amount, String vol, int totalVol,
        String floorPrice) {
      if (type == 'Tokens') {
        return Text(
          '10,100',
          style: textStyleSmall.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              overflow: TextOverflow.ellipsis),
        );
      } else if (type == 'Listed') {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '142',
              style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            // kVerySmallHeight,
            // Text(
            //   '30.45%',
            //   style: textStyleSmall.copyWith(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 10,
            //       overflow: TextOverflow.ellipsis),
            // ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  type == 'Total Vol'
                      ? vol
                      : (type == '24 Hrs Vol'
                          ? (totalVol / 10000000000).ceilToDouble().toString()
                          : vol),
                  style: textStyleSmall.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
                kSmallestWidth,
                Image.asset(
                  "assets/images/solana-sol-logo 1.png",
                ),
              ],
            )
          ],
        );
      }
    }

    List<Widget> _buildRows(int count, int i, dynamic collections) {
      return List.generate(
          count,
          (index) => InkWell(
                onTap: () {
                  navigateToNextScreen(index, collections);
                },
                child: Container(
                  height: 68,
                  width: 100,
                  child: tableBody(
                      rowTabs[i],
                      collections[index]['name'],
                      collections[index]['volumePast24h'].toString(),
                      collections[index]['volumePast24h'],
                      collections[index]['floorPrice'].toString()),
                ),
              ));
    }

    return Scaffold(
      body: SafeArea(
        child: FutureHelper(
          task: futureData,
          loader:
              Center(child: circularProgressIndicator(color: defaultFontColor)),
          builder: (context, _) => SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const ExploreHeader(),
                kSmallHeight,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextForm(
                            // controller: textController,
                            onChangedCallback: (String value) async {
                              var result =
                                  await auth.getAllCollections('search', value);

                              setState(() {
                                auth.setAllCollections(result);
                              });
                            },
                            textInputType: TextInputType.text,
                            labelText: "Search Collections",
                            fillColor: Colors.transparent,
                            focusNode: textFocus,
                            hintColor: whiteColor),
                      ),
                      kNormalHeight,
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: EdgeInsets.all(6),
                        child: DropDownItem(
                            values: values,
                            onPressed: (String? value) async {
                              setState(() {
                                auth.setDropValue(value);
                              });
                              var result = await auth
                                  .getAllCollections(auth.dropValue == 'Recent'
                                      ? 'epoch'
                                      : auth.dropValue == '24 H'
                                          ? 'vol24h'
                                          : auth.dropValue == '7 Days'
                                              ? 'vol7D'
                                              : auth.dropValue == 'Total'
                                                  ? 'total'
                                                  : auth.dropValue == 'L to H'
                                                      ? 'floorPriceH'
                                                      : 'floorPriceL');
                              if (result != null) {
                                setState(() {
                                  auth.setAllCollections(result);
                                  // Auth.authProvider(context).setAllOffset(10)
                                });
                              }
                            },
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1.5,
                                color: cardColor,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                kNormalHeight,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Collections',
                            style: textStyleSmall.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: lemonColor,
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  _buildCells(collections.length, collections)),
                        ],
                      ),
                    ),
                    kVerySmallWidth,
                    Expanded(
                      child: Container(
                        height: Auth.authProvider(context).allOffset == 0
                            ? 900
                            : (Auth.authProvider(context).allOffset == 10
                                ? 1500
                                : (Auth.authProvider(context).allOffset == 20
                                    ? 2300
                                    : (MediaQuery.of(context).size.height *
                                        ((Auth.authProvider(context).allOffset /
                                            10))))),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: rowTabs.length,
                          itemBuilder: (context, i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rowTabs[i],
                                style: textStyleSmall.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: lemonColor,
                                ),
                              ),
                              kBiggerHeight,
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _buildRows(
                                      collections.length, i, collections)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Explore Collections',
              style: textStyleBig.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
