import '../../../../shared/widgets/appbar.dart';

import '../../../../core/app_navigation/app_navigator.dart';
import '../../data/models/args.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:accordion/accordion.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({
    Key? key,
    this.args,
  }) : super(key: key);

  final Args? args;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

//  COLLECTION DATA
//  info

//  numbers
    String price = "2.9";

//  images
    String collectionBanner = "assets/collections/solarian.gif";

    return Scaffold(
      appBar: buildAppBar(
        InkWell(
          onTap: () => AppNavigator.pop(),
          child: Icon(
            UniconsLine.arrow_circle_left,
            color: isDarkMode
                ? Colors.white
                : const Color(0xff3b22a1), //icon bg color
            size: size.height * 0.03,
          ),
        ),
        isDarkMode,
        size,
      ),
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
            child: ListView(
              children: [
                const SizedBox(height: 20),

                InkWell(
                  onTap: () => AppNavigator.pop(),
                  child: Text(
                    args?.collectionName ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "019-7 the Timey",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ])),
                  ),
                ),

                Text(
                  "Guds...wsxg",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.6),
                    fontSize: size.width * 0.035,
                  ),
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                UniconsLine.heart,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff3b22a1), //icon bg color
                                size: size.height * 0.03,
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                CupertinoIcons.link,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff3b22a1), //icon bg color
                                size: size.height * 0.03,
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                UniconsLine.refresh,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff3b22a1), //icon bg color
                                size: size.height * 0.03,
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                CupertinoIcons.flag,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff3b22a1), //icon bg color
                                size: size.height * 0.03,
                              ),
                            ])),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    child: Container(
                        width: 20,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border:
                              Border.all(color: Colors.blueAccent, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              CupertinoIcons.checkmark_shield_fill,
                              color: Colors.blueAccent,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Verifeyed",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 15),
                            ),
                          ],
                        ))),

                const SizedBox(height: 20),

                SizedBox(
                  width: size.width,
                  height: size.height * 0.35,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      collectionBanner,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

//                Padding(
//                  padding: EdgeInsets.only(top: size.height * 0.01),
//                  child: buildTopCreator(
//                    collectT,
//                    authorImg,
//                    "1.2M",
//                    defaultFontColor,
//                    isDarkMode,
//                    size,
//
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CURRENT PRICE:",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: defaultFontColor.withOpacity(0.6),
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "◎$price",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: defaultFontColor,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Accordion(
                  headerBackgroundColorOpened: Colors.transparent,
                  maxOpenSections: 1,
                  openAndCloseAnimation: false,
                  disableScrolling: true,
                  contentBackgroundColor: Colors.transparent,
                  contentBorderColor: Colors.transparent,
                  headerPadding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                    top: 10,
                    bottom: 0,
                  ),
                  headerBackgroundColor: Colors.transparent,
//                  leftIcon: Icon(Icons.audiotrack, color: Colors.white),
                  children: [
                    AccordionSection(
                      isOpen: false,
                      rightIcon: Icon(Icons.arrow_drop_down),
                      header: Text('About Collection Name',
                          style:
                              TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: const Text(
                          'This is the introduction right here ...',
                          textAlign: TextAlign.left),
                    ),
                    AccordionSection(
                      isOpen: false,
                      rightIcon: Icon(Icons.arrow_drop_down),

                      header: Text('Attributes',
                          style:
                              TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                      "sodinxinoisdnodisnfodsinfodifnsdfsf sdofkno dsfin sod sdof idnofi noin"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.copy,
                                size: 20, color: Colors.green[200]),
                          )
                        ],
                      ),
                    ),
                    AccordionSection(
                      isOpen: false,
                      rightIcon: Icon(Icons.arrow_drop_down),

                      header: Text('Details',
                          style:
                              TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                      "sodinxinoisdnodisnfodsinfodifnsdfsf sdofkno dsfin sod sdof idnofi noin"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.copy,
                                size: 20, color: Colors.green[200]),
                          )
                        ],
                      ),
                    ),
                    AccordionSection(
                      isOpen: false,
                      rightIcon: Icon(Icons.arrow_drop_down),

                      header: Text('Sales History',
                          style:
                              TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                      "sodinxinoisdnodisnfodsinfodifnsdfsf sdofkno dsfin sod sdof idnofi noin"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.copy,
                                size: 20, color: Colors.green[200]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),


                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.005),
                  child: InkWell(
                    onTap: () => print(
                        'place a bid'), //TODO: add place a bid action
                    child: Center(
                      child: Container(
                        height: size.height * 0.075,
                        width: size.width * 0.7,
                        decoration: const BoxDecoration(
                          color: Color(0xff4FBBEB),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Align(
                          child: Text(
                            "Connect Wallet",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Accordion(
                  headerBackgroundColorOpened: Colors.transparent,
                  maxOpenSections: 1,
                  openAndCloseAnimation: false,
                  disableScrolling: true,
                  contentBackgroundColor: Colors.transparent,
                  contentBorderColor: Colors.transparent,
                  headerPadding: const EdgeInsets.only(
                      left: 20, right: 10, top: 20, bottom: 20),
                  headerBackgroundColor: Colors.transparent,
//                  leftIcon: Icon(Icons.audiotrack, color: Colors.white),
                  children: [
                    AccordionSection(
                      isOpen: false,
                      rightIcon: Icon(Icons.arrow_drop_down),

                      header:  Text('ATTRIBUTES',
                          style: TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: const Text(
                        'This is the introduction right here ...',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    AccordionSection(
                      isOpen: false,
                      rightIcon: Icon(Icons.arrow_drop_down),

                      header:  Text('SALES HISTORY',
                          style: TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: Row(
                        children: const [],
                      ),
                    ),
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
