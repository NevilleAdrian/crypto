import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:de_marketplace/core/app_navigation/app_navigator.dart';
import 'package:de_marketplace/core/app_navigation/app_route.dart';
import 'package:de_marketplace/core/providers/tab_provider/tab_provider.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/tab_bar/tab_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../profile/data/model/profile.dart';
import '../../../../shared/widgets/appbar.dart';
import '../../../../shared/widgets/homePage/collections_nfts.dart';
import '../../data/models/args.dart';
import 'package:flutter/material.dart';

import '../../../profile/presenation/widgets/profile_header.dart';

enum Type { items, activity }

class DetailsPage extends StatefulWidget {
  final Args? args;

  const DetailsPage({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends State<DetailsPage> {
  bool isUseSafeArea = false;

  final children = ["Items", "Activity"];

  @override
  void initState() {
    TabProvider.tab(context).changeTabBar('Items');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Size size = MediaQuery.of(context).size;

    final profile = getProfile();

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
      appBar: buildAppBar(
        InkWell(
          onTap: () => {},
        ),
        isDarkMode,
        size,
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black.withOpacity(0.7),
      //   child: const Icon(
      //     Icons.manage_search,
      //     color: Colors.white,
      //   ),
      //   onPressed: () => {
      //     _showSheetWithoutList()
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(profile: profile),
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
                    color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
                    child: GridView.count(
                      childAspectRatio: (1 / 1.7),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(10, (index) {
                        return buildNFT(
                          'Solarians',
                          0.2,
                          'Ohme Ohmy',
                          'assets/images/avatar2.jpg',
                          'assets/collections/solarian.gif',
                          isDarkMode ? Colors.white : Colors.black,
                          isDarkMode,
                          size,
                        );
                      }),
                    ),
                  )
                : InkWell(
                onTap: () => AppNavigator.pushNamed(
                  collectionsViewRoute,
                  arguments: Args(
                    isDarkMode: isDarkMode,
                    collectionName: 'Solarians',
                    collectionId: "solarians-1234",
                    collectionProfileImg: 'assets/collections/solarian.gif',
                    size: size,
                  ),
                ),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
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
                                          Text('3.33',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('about 3 hours ago',
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
                              ),
                          separatorBuilder: (context, _) => SizedBox(
                                height: 30,
                              ),
                          itemCount: 10
                      ),
                    ),
                ),
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
