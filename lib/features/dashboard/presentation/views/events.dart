import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:de_marketplace/core/providers/tab_provider/tab_provider.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/tab_bar/tab_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../profile/data/model/profile.dart';
import '../../../../shared/widgets/appbar.dart';
import '../../../../shared/widgets/homePage/collections_nfts.dart';
import '../../data/models/args.dart';
import 'package:flutter/material.dart';

import '../../../profile/presenation/widgets/profile_header.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EventScreen> createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends State<EventScreen> {
  bool isUseSafeArea = false;

  final children = ["Trending", "All Drops"];

  @override
  void initState() {
    TabProvider.tab(context).changeEventTabBar("Trending");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Size size = MediaQuery.of(context).size;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: TabBars(
                children: children,
                type: TabProvider.tab(context, listen: true).eventType,
                isDarkMode: isDarkMode,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TabProvider.tab(context, listen: true).eventType == 'Trending'
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 500,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/collections/solarian.gif'),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Cheddar Block Games',
                                                  style: GoogleFonts.poppins(
                                                    color: defaultFontColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Advised by the former Head of Twitter Gaming and Sport, We are launching the worlds first ever...',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              FlatButton(
                                                color: Colors.black,
                                                  padding: EdgeInsets.all(10),
                                                  onPressed: (){},
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.star, color: Colors.white,),
                                                      SizedBox(width: 7,),
                                                      Text('Lauchpad', style: TextStyle(color: Colors.white),)
                                                    ],
                                                  ),

                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                        separatorBuilder: (context, _) => SizedBox(
                              height: 30,
                            ),
                        itemCount: 10),
                  )
                : Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                              Border.all(color: Colors.black)),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/avatar1.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text('Cheddar Block Games',
                                        style: GoogleFonts.poppins(
                                          color: defaultFontColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Advised by the former Head of Twitter Gaming and Sport, We are launching the worlds first ever...',
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      color: Colors.black,
                                      padding: EdgeInsets.all(10),
                                      onPressed: (){},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star, color: Colors.white,),
                                          SizedBox(width: 7,),
                                          Text('Lauchpad', style: TextStyle(color: Colors.white),)
                                        ],
                                      ),

                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  separatorBuilder: (context, _) => SizedBox(
                    height: 30,
                  ),
                  itemCount: 10),
            ),
            const SizedBox(
              height: 70,
            )
          ],
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
