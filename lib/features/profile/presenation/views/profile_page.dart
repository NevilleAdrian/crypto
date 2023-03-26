import 'dart:convert';

import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/collections/collections_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<dynamic> futureData;

  List<String> values = ['Recent', '24 H', 'L to H', 'H to L'];

  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getOfferings('', '-addEpoch');

      setState(() {});

      print('result:$result');

      //Return future value
      return Future.value(result);
    } catch (ex) {}
  }

  @override
  void initState() {
    futureData = futureTask();
    Auth.authProvider(context).setLatestOffset(10);
    Auth.authProvider(context).setTrendingOffset(10);
    Auth.authProvider(context).setVerifiedOffset(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    Color oppositeFontColor = isDarkMode ? Colors.black : Colors.white;
    var data = Auth.authProvider(context).offerings;
    Auth auth = Auth.authProvider(context);
    print('Daniel data $data');

    return Scaffold(
      body: SafeArea(
        child: FutureHelper(
          task: futureData,
          loader:
              Center(child: circularProgressIndicator(color: defaultFontColor)),
          builder: (context, _) => ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: appColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            Text(
                              'Profile',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                firstGradientColor,
                                secondGradientColor,
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        left: 20,
                        child: CircleAvatar(
                          radius: 36,
                          backgroundImage:
                              AssetImage('assets/images/ajayi.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        padding: EdgeInsets.all(0.9),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0XFFBBE71F),
                              Color(0XFF00C5FF)
                            ],
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          height: size.height * 0.045,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                            color: backGroundColor,

                            // border: Border.all(color: Color(0XFFBBE71F)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: GradientText(
                            'Edit Profile',
                            style: GoogleFonts.poppins(
                              color: Color(0XFFBBE71F),
                              fontSize: size.width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                            icon: Icons.note_alt_outlined,
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color(0XFFBBE71F),
                                Color(0XFF00C5FF)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Nuel Ajayi',
                        style: textStyleBig.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Image.asset('assets/images/Vector.png'),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'CZnNK...ToE',
                        style: textStyleSmall.copyWith(
                            fontSize: 13, color: babyBlue),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset('assets/images/Vector_up.png'),
                          Positioned(
                            top: 2.5,
                            left: -4.5,
                            bottom: -3,
                            right: 1,
                            child: Image.asset('assets/images/Vector_down.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 350),
                      child: Text(
                        'An awesome NFT trader in  Califonia. Product Designer, Product Manger and Visual Designer',
                        style: textStyleSmall.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              'assets/images/image_up.png',
                            ),
                            Positioned(
                                bottom: -4,
                                left: -3.5,
                                child: Image.asset(
                                    'assets/images/image_down.png')),
                          ],
                        ),
                        Text(
                          'www.nuelajayi_sol.com',
                          style: textStyleSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: babyBlue,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Image.asset(
                          'assets/images/Twitter.png',
                          color: Colors.grey,
                        ),
                        Image.asset(
                          'assets/images/Discord.png',
                          color: Colors.grey,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset('assets/images/Instagram_outer.png'),
                            Positioned(
                              bottom: 3,
                              left: 3,
                              child: Image.asset(
                                  'assets/images/Instagram_inner.png'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '158',
                          style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Text(
                          'Followers',
                          style: textStyleBig.copyWith(
                              fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '500',
                          style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Text(
                          'Followers',
                          style: textStyleBig.copyWith(
                              fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 13,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lemonColor,
                            ),
                            child: Text(
                              'Collections',
                              textAlign: TextAlign.center,
                              style: textStyleSmall.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        kSmallestWidth,
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     vertical: 13,
                        //     horizontal: 25,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: lightcardColor,
                        //   ),
                        //   child: Text(
                        //     'Creations',
                        //     style: textStyleSmall.copyWith(
                        //       color: Colors.white,
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 13,
                              horizontal: 32,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightcardColor,
                            ),
                            child: Text(
                              'Listings',
                              textAlign: TextAlign.center,
                              style: textStyleSmall.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20 / 2,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var metaData = jsonDecode(
                        data[index]['metadata']
                            .replaceAll('\\', '')
                            .replaceAll('"O"', '')
                            .replaceAll('"E"', '')
                            .replaceAll('"L"', '')
                            .replaceAll('"S"', ''),
                      );
                      var newPrice = (data[index]['price'] / price);
                      return CollectionsCard(
                        collection: data[index],
                        remove: true,
                        title: 'Cyborg',
                        amount: newPrice,
                        nftImg: metaData['image'] ??
                            "https://metadata.y00ts.com/y/14010.png",
                        metadata: metaData,
                        collectionName: 'Neville',
                      );
                    },
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             vertical: 13,
                  //             horizontal: 11,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: lightcardColor,
                  //         ),
                  //         child: Text('Add All',
                  //         style: textStyleSmall.copyWith(
                  //           color: Colors.grey,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 13,
                  //         ),
                  //         ),
                  //       ),
                  //       SizedBox(width: 3,),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //           vertical: 13,
                  //           horizontal: 11,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: lightcardColor,
                  //         ),
                  //         child: Text('Remove All',
                  //           style: textStyleSmall.copyWith(
                  //             color: Colors.grey,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 13,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(width: 30,),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //           vertical: 13,
                  //           horizontal: 11,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: lightcardColor,
                  //         ),
                  //         child: Text('Cancel',
                  //           style: textStyleSmall.copyWith(
                  //             color: Colors.grey,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 13,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(width: 5,),
                  //       Container(
                  //         padding: EdgeInsets.all(0.9),
                  //         decoration: const BoxDecoration(
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(10),
                  //           ),
                  //           gradient: LinearGradient(
                  //             colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
                  //           ),
                  //         ),
                  //         child: Container(
                  //           padding: EdgeInsets.only(
                  //             left: 4,
                  //           ),
                  //           height: size.height * 0.045,
                  //           width: size.width * 0.27,
                  //           decoration: BoxDecoration(
                  //             color: backGroundColor,
                  //
                  //             // border: Border.all(color: Color(0XFFBBE71F)),
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10),
                  //             ),
                  //           ),
                  //           child:  Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text('Save Changes',
                  //                 style: textStyleSmall.copyWith(
                  //                   fontWeight: FontWeight.w500,
                  //                   fontSize: 13,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
