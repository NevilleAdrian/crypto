import 'dart:convert';

import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/core/providers/tab_provider/tab_provider.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/details_page.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/tab_bar/tab_bar.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../shared/widgets/homePage/collections_nfts.dart';
import '../../../profile/data/model/profile.dart';
import '../../../profile/presenation/widgets/profile_header.dart';
import '../../data/models/args.dart';

enum Type { items, activity }

class DetailsPage extends StatefulWidget {
  final Args? args;

  const DetailsPage({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isUseSafeArea = false;

  final children = ["Items", "Activity"];

  late Future<dynamic> futureData;

  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getCollectionDetails(widget.args!.collectionName);
      await auth.getListingTotal(widget.args!.collectionName);
      await auth.getOfferings(widget.args!.collectionName);
      await auth.getActivities(widget.args!.collectionName);

      setState(() {});

      print('result:$result');

      //Return future value
      return Future.value(result);
    } catch (ex) {}
  }

  @override
  void initState() {
    futureData = futureTask();

    // print('argsss:${widget.args!.collectionName}');

    TabProvider.tab(context).changeTabBar('Items');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

    Size size = MediaQuery.of(context).size;

    final profile = getProfile();

    var data = Auth.authProvider(context).offerings;
    var activity = Auth.authProvider(context).transactions;

    print('dataaa:$data');
    print('activity:$data');

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
      body: Center(
        child: FutureHelper(
          task: futureData,
          loader: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [circularProgressIndicator(color: defaultFontColor)],
          ),
          builder: (context, _) => ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  ProfileHeader(
                    profile: profile,
                    image: widget.args!.collectionImg,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TabBars(
                    children: children,
                    type: TabProvider.tab(context, listen: true).type,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TabProvider.tab(context, listen: true).type == 'Items'
                      ? Container(
                          color: isDarkMode
                              ? Colors.black
                              : const Color(0xfff8f8f8),
                          child: GridView.count(
                            childAspectRatio: (1 / 1.54),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(data.length, (index) {
                              var metaData = jsonDecode(
                                data[index]['metadata']
                                    .replaceAll('\\', '')
                                    .replaceAll('"O"', '')
                                    .replaceAll('"E"', '')
                                    .replaceAll('"L"', '')
                                    .replaceAll('"S"', ''),
                              );

                              // print('metadata: ${data[index]}');
                              var newPrice = (data[index]['price'] / price);
                              return buildNFT(
                                  metaData['name'],
                                  widget.args!.collectionName,
                                  newPrice,
                                  'Ohme Ohmy',
                                  'assets/images/avatar2.jpg',
                                  metaData['image'],
                                  isDarkMode ? Colors.white : Colors.black,
                                  isDarkMode,
                                  size, () {
                                print('dattaa: ${data[index]}');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListingPage(
                                              args: Args(
                                                  isDarkMode: isDarkMode,
                                                  collectionName:
                                                      metaData['name'],
                                                  collectionId: widget
                                                      .args!.collectionName,
                                                  collectionProfileImg:
                                                      metaData['image'],
                                                  size: size,
                                                  data: data[index],
                                                  metaData: metaData),
                                            )));
                              });
                            }),
                          ),
                        )
                      : activity.length == 0
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.all(8),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var metaData = jsonDecode(activity[index]
                                            ['tags']
                                        .replaceAll('\\', '')
                                        .replaceAll('"O"', '')
                                        .replaceAll('"E"', '')
                                        .replaceAll('"L"', '')
                                        .replaceAll('"S"', '')
                                        .replaceAll('"P"', ''));
                                    var newPrice =
                                        (activity[index]['price'] / price);
                                    var date = timeago.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            activity[index]['epoch'] * 1000));
                                    var seller = activity[index]['seller'];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(metaData[
                                                              'image'] ??
                                                          'https://images.pexels.com/photos/12610341/pexels-photo-12610341.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'))),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  metaData['name'] ??
                                                      'DeGod 7602',
                                                  style: GoogleFonts.poppins(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('◎${newPrice.toString()}',
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(date.toString(),
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                        const Text('Sale',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.green,
                                            ))
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, _) => SizedBox(
                                        height: 30,
                                      ),
                                  itemCount: activity.length),
                            ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//   void _showSheetWithoutList() {
//     showStickyFlexibleBottomSheet<void>(
//       minHeight: 0,
//       initHeight: 0.5,
//       maxHeight: .8,
//       headerHeight: 80,
//       context: context,
// //      isSafeArea: isUseSafeArea,
// //      bottomSheetColor: Colors.transparent,
//       decoration: const BoxDecoration(
//         color: Colors.teal,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40.0),
//           topRight: Radius.circular(40.0),
//         ),
//       ),
//       headerBuilder: (context, offset) {
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           width: double.infinity,
//           height: 200,
//           decoration: BoxDecoration(
//             color: Colors.green,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(offset == 0.8 ? 0 : 40),
//               topRight: Radius.circular(offset == 0.8 ? 0 : 40),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Center(
//                   child: Text(
//                     'Filter',
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                 ),
//               ),
//               Text(
//                 'position $offset',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ],
//           ),
//         );
//       },
//       bodyBuilder: (context, offset) {
//         return SliverChildListDelegate(
//           _children,
//         );
//       },
//       anchors: [.2, 0.5, .8],
//     );
//   }
// }
//
// List<Widget> _children = [
//   const _TextField(),
//   const _TestContainer(color: Color(0xEEFFFF00)),
//   const _TextField(),
//   const _TestContainer(color: Color(0xDD99FF00)),
//   const _TextField(),
//   const _TestContainer(color: Color(0xCC00FFFF)),
//   const _TextField(),
//   const _TestContainer(color: Color(0xBB555555)),
//   const _TextField(),
//   const _TestContainer(color: Color(0xAAFF5555)),
//   const _TextField(),
//   const _TestContainer(color: Color(0x9900FF00)),
//   const _TextField(),
//   const _TestContainer(color: Color(0x8800FF00)),
//   const _TextField(),
//   const _TestContainer(color: Color(0x7700FF00)),
//   const _TextField(),
// ];

}

class TabMenu extends StatelessWidget {
  const TabMenu(
      {required this.text,
      required this.onTap,
      required this.decoration,
      required this.style});

  final String text;
  final Function() onTap;
  final BoxDecoration decoration;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: decoration,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
