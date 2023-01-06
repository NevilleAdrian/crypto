import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/collections_page.dart';
import 'package:de_marketplace/features/profile/presenation/views/profile_page.dart';
import 'package:de_marketplace/main.dart';
import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/collections/collections_card.dart';
import 'package:de_marketplace/shared/collections/sales_card.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/shared/widgets/homePage/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:de_marketplace/shared/widgets/homePage/category.dart';


import '../../../../shared/widgets/homePage/collections_verified.dart';

class CollectionExplore extends StatefulWidget {
  const CollectionExplore({Key? key}) : super(key: key);

  @override
  State<CollectionExplore> createState() => _CollectionExploreState();
}

class _CollectionExploreState extends State<CollectionExplore> {
  late Future<dynamic> futureData;
  List<dynamic>? data;




  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getAllCollections();

      setState(() {});

      print('result:$result');

      //Return future value
      return Future.value(result);
    } catch (ex) {}
  }

  // @override
  // void initState() {
  //   futureData = futureTask();
  //
  //   Auth.authProvider(context).setLatestOffset(10);
  //   Auth.authProvider(context).setTrendingOffset(10);
  //   Auth.authProvider(context).setVerifiedOffset(10);
  //   super.initState();
  // }



  @override
  Widget build(BuildContext context) {
    final collection =
        Auth.authProvider(context, listen: true).latestCollections;
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    var collections = Auth.authProvider(context).allCollections;


    return Scaffold(
      // backgroundColor: isDarkMode? Colors.black : const Color(0xfff8f8f8),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: appColor,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10,),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onTap: (){},
                      ),
                      SizedBox(width: 10,),
                      Text('Collections',
                        style: textStyleBig.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                        // TextStyle(
                        //   color: Colors.white,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 20,
                        // ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/images/filter.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/image 54.png'),
                        SizedBox(width: 15,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('DeGods',
                                    style: textStyleBig.copyWith(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10,),
                                  Image.asset('assets/images/Group 19653.png'),
                                ],
                              ),
                              SizedBox(height: 3,),
                              ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 280),
                                  child: Text('DeGods is a digital art collection and global community of creators, developers, entrepreneurs, athletes, artists, experimenters and innovators.',
                                    style: textStyleSmall.copyWith(fontWeight: FontWeight.w500, fontSize: 12),)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Column(
                          children: const [
                            SalesCard(
                              text: 'Price Floor',
                              text2: '373',
                              isShowing: true,
                            ),
                            SizedBox(height: 10,),
                            SalesCard(
                              text: 'Highest Scale',
                              text2: '7,033',
                              isShowing: true,
                            ),
                            SizedBox(height: 10,),
                            SalesCard(
                              text: 'Owners',
                              text2: '4,395',
                              isShowing: false,
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                        Column(
                          children: const [
                            SalesCard(
                              text: 'Volume',
                              text2: '1.1M',
                              isShowing: true,
                            ),
                            SizedBox(height: 10,),
                            SalesCard(
                              text: 'Listings',
                              text2: '118',
                              isShowing: false,
                            ),
                            SizedBox(height: 10,),
                            SalesCard(
                              text: 'Total Supply',
                              text2: '10K',
                              isShowing: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1.5,
                              color: cardColor,
                            ),
                          ),
                          child: Image.asset('assets/images/bitcoin-refresh.png'),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1.5,
                                color: cardColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 15,),
                                Text('Recently Listed',
                                  style: textStyleSmall,
                                ),
                                Spacer(),
                                const Icon(Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    // CollectionsCard(collection: product[0]),


                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20 / 2,
                        ),
                        itemCount: product.length,
                        itemBuilder: (context, index) => CollectionsCard(
                          collection: product[index],
                            ),
                    ),


                  ],
                ),
              ),


            ],
          ),
        )
      ),


    );

    // return Scaffold(
    //   // backgroundColor: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
    //   body: Center(
    //     child: FutureHelper(
    //       task: futureData,
    //       loader: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [circularProgressIndicator(color: defaultFontColor)],
    //       ),
    //       builder: (context, _) => SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             const SizedBox(height: 30),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Container(
    //                   padding: const EdgeInsets.only(left: 10),
    //                   child: Text(
    //                     "Explore All Collections",
    //                     textAlign: TextAlign.center,
    //                     style: GoogleFonts.lato(
    //                       color: isDarkMode ? Colors.white : Colors.black,
    //                       fontSize: size.width * 0.055,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 // Row(
    //                 //   children: [
    //                 //     InkWell(
    //                 //       onTap: () {},
    //                 //       child: Icon(Icons.sort,
    //                 //           color: isDarkMode ? Colors.white : Colors.black,
    //                 //           size: 30),
    //                 //     ),
    //                 //     const SizedBox(width: 10),
    //                 //     InkWell(
    //                 //       onTap: () {},
    //                 //       child: Icon(Icons.filter_alt_outlined,
    //                 //           color: isDarkMode ? Colors.white : Colors.black,
    //                 //           size: 30),
    //                 //     ),
    //                 //     const SizedBox(width: 10),
    //                 //   ],
    //                 // )
    //               ],
    //             ),
    //             const SizedBox(height: 30),
    //             // Container(
    //             //   color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
    //             //   child: GridView.count(
    //             //     childAspectRatio: (1 / 1.35),
    //             //     shrinkWrap: true,
    //             //     physics: const NeverScrollableScrollPhysics(),
    //             //     crossAxisCount: 2,
    //             //     // Generate 100 widgets that display their index in the List.
    //             //     children: List.generate(10, (index) {
    //             //       return buildCollections(
    //             //         'Solarians',
    //             //         0.2,
    //             //         'Ohme Ohmy',
    //             //         'assets/images/avatar1.jpg',
    //             //         'assets/images/solarians-profile.png',
    //             //         isDarkMode ? Colors.white : Colors.black,
    //             //         isDarkMode,
    //             //         size,
    //             //         'slim', // slim or square or wide
    //             //       );
    //             //     }),
    //             //   ),
    //             // ),
    //             Container(
    //               color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
    //               child: GridView.count(
    //                 childAspectRatio: (1 / 1),
    //                 shrinkWrap: true,
    //                 physics: const NeverScrollableScrollPhysics(),
    //                 crossAxisCount: 2,
    //                 mainAxisSpacing: 30,
    //                 // Generate 100 widgets that display their index in the List.
    //                 children: List.generate(collections.length, (i) {
    //                   return buildCollections(
    //                       collections[i]['name'],
    //                       20.0,
    //                       'Nicole Boa',
    //                       'assets/images/avatar2.jpg',
    //                       collections[i]['thumbnail']
    //                               .contains('firebasestorage')
    //                           ? 'https://ik.imagekit.io/srjnqnjbpn9/thumbnails/solarians.jpeg?ik-sdk-version=react-1.0.11'
    //                           : checkImage(collections[i]['thumbnail'])
    //                               ? collections[i]['thumbnail']
    //                               : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}',
    //                       defaultFontColor,
    //                       isDarkMode,
    //                       size,
    //                       '',
    //                       onTap: () => Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => DetailsPage(
    //                                     args: Args(
    //                                       isDarkMode: isDarkMode,
    //                                       collectionName: collections[i]
    //                                           ['name'],
    //                                       collectionId: "solarians-1234",
    //                                       collectionProfileImg:
    //                                           "assets/images/solarians.png",
    //                                       size: size,
    //                                       collectionImg: checkImage(
    //                                               collections[i]['thumbnail'])
    //                                           ? collections[i]['thumbnail']
    //                                           : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}',
    //                                     ),
    //                                   ))));
    //                 }),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}




