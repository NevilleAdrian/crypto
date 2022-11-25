import 'package:accordion/accordion.dart';
import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/args.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({
    Key? key,
    this.args,
  }) : super(key: key);

  final Args? args;

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

    print('metaData: ${widget.args!.metaData}');
    print('data: ${widget.args!.data}');
//  COLLECTION DATA
//  info

//  numbers
    String newPrice = (widget.args!.data['price'] / price).toString();

    print('price: $newPrice');

//  images
    String collectionBanner = "assets/collections/solarian.gif";

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: isDarkMode ? Colors.white : Colors.black,
      //   onPressed: () {
      //     AppNavigator.pop();
      //   },
      //   child: Icon(
      //     UniconsLine.arrow_circle_left,
      //     color: isDarkMode ? Colors.black : Colors.white, //icon bg color
      //     size: size.height * 0.03,
      //   ),
      // ),
      // appBar: buildAppBar(
      //   InkWell(
      //     onTap: () => AppNavigator.pop(),
      //     child: Icon(
      //       UniconsLine.arrow_circle_left,
      //       color: isDarkMode
      //           ? Colors.white
      //           : const Color(0xff3b22a1), //icon bg color
      //       size: size.height * 0.03,
      //     ),
      //   ),
      //   isDarkMode,
      //   size,
      // ),
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

                SizedBox(
                  width: size.width,
                  height: size.height * 0.35,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      widget.args!.collectionProfileImg,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // InkWell(
                //   onTap: () => AppNavigator.pop(),
                //   child: Text(
                //     args?.collectionName ?? '',
                //     textAlign: TextAlign.center,
                //     overflow: TextOverflow.ellipsis,
                //     style: GoogleFonts.poppins(
                //       color: isDarkMode ? Colors.white : Colors.black,
                //       fontSize: size.width * 0.04,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.args?.collectionName ?? '',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Image.asset(
                                  'assets/icons/verif.png',
                                  height: 10,
                                  // width: width * 0.08,
                                ),
                              ),
                            ])),
                  ),
                ),

                Text(
                  widget.args?.collectionId ?? "Guds...wsxg",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.6),
                    fontSize: size.width * 0.035,
                  ),
                ),

                // const SizedBox(height: 20),

                // Align(
                //   alignment: Alignment.center,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 100),
                //     child: SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               // Icon(
                //               //   UniconsLine.heart,
                //               //   color: isDarkMode
                //               //       ? Colors.white
                //               //       : const Color(0xff3b22a1), //icon bg color
                //               //   size: size.height * 0.03,
                //               // ),
                //               const SizedBox(width: 20),
                //               // Icon(
                //               //   CupertinoIcons.link,
                //               //   color: isDarkMode
                //               //       ? Colors.white
                //               //       : const Color(0xff3b22a1), //icon bg color
                //               //   size: size.height * 0.03,
                //               // ),
                //               const SizedBox(width: 20),
                //               // Icon(
                //               //   UniconsLine.refresh,
                //               //   color: isDarkMode
                //               //       ? Colors.white
                //               //       : const Color(0xff3b22a1), //icon bg color
                //               //   size: size.height * 0.03,
                //               // ),
                //               const SizedBox(width: 20),
                //               // Icon(
                //               //   CupertinoIcons.flag,
                //               //   color: isDarkMode
                //               //       ? Colors.white
                //               //       : const Color(0xff3b22a1), //icon bg color
                //               //   size: size.height * 0.03,
                //               // ),
                //             ])),
                //   ),
                // ),
                //
                const SizedBox(height: 20),
                // Center(
                //   child: Container(
                //     padding: EdgeInsets.only(bottom: 20),
                //     child: Image.asset(
                //       'assets/icons/verif.png',
                //       height: 30,
                //       // width: width * 0.08,
                //     ),
                //   ),
                // ),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 110),
                //     child: Container(
                //         width: 20,
                //         height: 50,
                //         decoration: BoxDecoration(
                //           borderRadius: const BorderRadius.all(
                //             Radius.circular(10),
                //           ),
                //           border:
                //               Border.all(color: Colors.blueAccent, width: 1),
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [
                //             Icon(
                //               CupertinoIcons.checkmark_shield_fill,
                //               color: Colors.blueAccent,
                //               size: 20,
                //             ),
                //             SizedBox(width: 10),
                //             Text(
                //               "Verifeyed",
                //               style: TextStyle(
                //                   color: Colors.blueAccent, fontSize: 15),
                //             ),
                //           ],
                //         ))),

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                              "◎$newPrice",
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
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.005),
                        child: InkWell(
                          onTap: () => Auth.authProvider(context).connectWallet(
                            context,
                            widget.args?.collectionId,
                            widget.args!.data['mint'],
                            widget.args!.data['pubkey'],
                          ),
                          child: Center(
                            child: Container(
                              height: size.height * 0.075,
                              width: size.width * 0.3,
                              decoration: const BoxDecoration(
                                color: Color(0xff4FBBEB),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Align(
                                child: Auth.authProvider(context, listen: true)
                                        .loading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          backgroundColor: Colors.grey,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  defaultFontColor),
                                        ),
                                      )
                                    : Text(
                                        "Connect Wallet",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
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
                  // leftIcon: Icon(Icons.audiotrack, color: Colors.white),
                  children: [
                    AccordionSection(
                      contentHorizontalPadding: 19,
                      isOpen: false,
                      contentBackgroundColor: isDarkMode
                          ? const Color(0xff06090d)
                          : const Color(0xfff8f8f8),
                      headerBackgroundColorOpened: Colors.transparent,
                      headerBackgroundColor: isDarkMode
                          ? const Color(0xff06090d)
                          : const Color(0xfff8f8f8),
                      rightIcon: Icon(
                        Icons.arrow_drop_down,
                        color: defaultFontColor,
                      ),
                      header: Text('About Collection Name',
                          style:
                              TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.args!.metaData['description'] == null
                                  ? ''
                                  : '${widget.args!.metaData['description'].trim()}',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: defaultFontColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    // AccordionSection(
                    //   isOpen: false,
                    //   rightIcon: Icon(Icons.arrow_drop_down),
                    //   header: Text('Attributes',
                    //       style:
                    //           TextStyle(color: defaultFontColor, fontSize: 17)),
                    //   content: Row(
                    //     children: [
                    //       Expanded(
                    //         child: SingleChildScrollView(
                    //           scrollDirection: Axis.horizontal,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: const [
                    //               Text(
                    //                   "sodinxinoisdnodisnfodsinfodifnsdfsf sdofkno dsfin sod sdof idnofi noin"),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       // Padding(
                    //       //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       //   child: Icon(Icons.copy,
                    //       //       size: 20, color: Colors.green[200]),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    // AccordionSection(
                    //   isOpen: false,
                    //   rightIcon: Icon(Icons.arrow_drop_down),
                    //   header: Text('Details',
                    //       style:
                    //           TextStyle(color: defaultFontColor, fontSize: 17)),
                    //   content: Row(
                    //     children: [
                    //       Expanded(
                    //         child: SingleChildScrollView(
                    //           scrollDirection: Axis.horizontal,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               Text('${args!.metaData['description']}'),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       // Padding(
                    //       //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       //   child: Icon(Icons.copy,
                    //       //       size: 20, color: Colors.green[200]),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    // AccordionSection(
                    //   isOpen: false,
                    //   rightIcon: Icon(Icons.arrow_drop_down),
                    //   header: Text('Sales History',
                    //       style:
                    //           TextStyle(color: defaultFontColor, fontSize: 17)),
                    //   content: Row(
                    //     children: [
                    //       Expanded(
                    //         child: SingleChildScrollView(
                    //           scrollDirection: Axis.horizontal,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: const [
                    //               Text(
                    //                   "sodinxinoisdnodisnfodsinfodifnsdfsf sdofkno dsfin sod sdof idnofi noin"),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       // Padding(
                    //       //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       //   child: Icon(Icons.copy,
                    //       //       size: 20, color: Colors.green[200]),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    AccordionSection(
                      contentHorizontalPadding: 19,
                      isOpen: false,
                      contentBackgroundColor: isDarkMode
                          ? const Color(0xff06090d)
                          : const Color(0xfff8f8f8),
                      headerBackgroundColorOpened: Colors.transparent,
                      headerBackgroundColor: isDarkMode
                          ? const Color(0xff06090d)
                          : const Color(0xfff8f8f8),
                      rightIcon: Icon(
                        Icons.arrow_drop_down,
                        color: defaultFontColor,
                      ),
                      header: Text('Mint Id',
                          style:
                              TextStyle(color: defaultFontColor, fontSize: 17)),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.args!.data['mint'],
                              textAlign: TextAlign.left,
                              style: TextStyle(color: defaultFontColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AccordionSection(
                      contentHorizontalPadding: 19,
                      isOpen: false,
                      contentBackgroundColor: isDarkMode
                          ? const Color(0xff06090d)
                          : const Color(0xfff8f8f8),
                      headerBackgroundColorOpened: Colors.transparent,
                      headerBackgroundColor: isDarkMode
                          ? const Color(0xff06090d)
                          : const Color(0xfff8f8f8),
                      rightIcon: Icon(
                        Icons.arrow_drop_down,
                        color: defaultFontColor,
                      ),
                      header: Text(
                        'Attributes ',
                        style: TextStyle(color: defaultFontColor, fontSize: 17),
                      ),
                      content: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 80,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 20),
                          itemCount: widget.args!.metaData['attributes'] == null
                              ? 0
                              : widget.args!.metaData['attributes'].length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${widget.args!.metaData['attributes'][index]['trait_type'].toString().toUpperCase()} ',
                                    style: TextStyle(
                                        color: defaultFontColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget
                                              .args!
                                              .metaData['attributes'][index]
                                                  ['value']
                                              .toString(),
                                          style: TextStyle(
                                              color: defaultFontColor,
                                              fontSize: 17),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),

                // Accordion(
                //   headerBackgroundColorOpened: Colors.transparent,
                //   maxOpenSections: 1,
                //   openAndCloseAnimation: false,
                //   disableScrolling: true,
                //   contentBackgroundColor: Colors.transparent,
                //   contentBorderColor: Colors.transparent,
                //   headerPadding: const EdgeInsets.only(
                //     left: 20,
                //     right: 10,
                //     bottom: 0,
                //   ),
                //   headerBackgroundColor: Colors.transparent,
                //   // leftIcon: Icon(Icons.audiotrack, color: Colors.white),
                //   children: [
                //     AccordionSection(
                //       contentHorizontalPadding: 19,
                //       isOpen: false,
                //       contentBackgroundColor: isDarkMode
                //           ? const Color(0xff06090d)
                //           : const Color(0xfff8f8f8),
                //       headerBackgroundColorOpened: Colors.transparent,
                //       headerBackgroundColor: isDarkMode
                //           ? const Color(0xff06090d)
                //           : const Color(0xfff8f8f8),
                //       rightIcon: Icon(
                //         Icons.arrow_drop_down,
                //         color: defaultFontColor,
                //       ),
                //       header: Text(
                //         'Attributes: ',
                //         style: TextStyle(color: defaultFontColor, fontSize: 17),
                //       ),
                //       content: GridView.builder(
                //           gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                   mainAxisExtent: 80,
                //                   crossAxisCount: 2,
                //                   crossAxisSpacing: 12,
                //                   mainAxisSpacing: 20),
                //           itemCount: args!.metaData['attributes'].length,
                //           shrinkWrap: true,
                //           physics: const NeverScrollableScrollPhysics(),
                //           itemBuilder: (context, index) {
                //             return Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.grey.withOpacity(0.2),
                //                   borderRadius: BorderRadius.circular(10)),
                //               padding: const EdgeInsets.only(
                //                   left: 10, top: 10, bottom: 10),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '${args!.metaData['attributes'][index]['trait_type'].toString().toUpperCase()} ',
                //                     style: TextStyle(
                //                         color: defaultFontColor,
                //                         fontSize: 13,
                //                         fontWeight: FontWeight.w700),
                //                   ),
                //                   SizedBox(
                //                     height: 8,
                //                   ),
                //                   Row(
                //                     children: [
                //                       Expanded(
                //                         child: Text(
                //                           args!.metaData['attributes'][index]
                //                                   ['value']
                //                               .toString(),
                //                           style: TextStyle(
                //                               color: defaultFontColor,
                //                               fontSize: 17),
                //                           overflow: TextOverflow.ellipsis,
                //                         ),
                //                       )
                //                     ],
                //                   )
                //                 ],
                //               ),
                //             );
                //           }),
                //     ),
                //   ],
                // ),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(
                //         left: 30,
                //         right: 10,
                //         top: 0,
                //         bottom: 10,
                //       ),
                //       child: Text(
                //         'Attributes: ',
                //         style: TextStyle(color: defaultFontColor, fontSize: 17),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(22.0),
                //       child: GridView.builder(
                //           gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                   mainAxisExtent: 80,
                //                   crossAxisCount: 2,
                //                   crossAxisSpacing: 12,
                //                   mainAxisSpacing: 20),
                //           itemCount: args!.metaData['attributes'].length,
                //           shrinkWrap: true,
                //           physics: const NeverScrollableScrollPhysics(),
                //           itemBuilder: (context, index) {
                //             return Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.grey.withOpacity(0.2),
                //                   borderRadius: BorderRadius.circular(10)),
                //               padding: const EdgeInsets.only(
                //                   left: 10, top: 10, bottom: 10),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     '${args!.metaData['attributes'][index]['trait_type'].toString().toUpperCase()} ',
                //                     style: TextStyle(
                //                         color: defaultFontColor,
                //                         fontSize: 13,
                //                         fontWeight: FontWeight.w700),
                //                   ),
                //                   SizedBox(
                //                     height: 8,
                //                   ),
                //                   Row(
                //                     children: [
                //                       Expanded(
                //                         child: Text(
                //                           args!.metaData['attributes'][index]
                //                                   ['value']
                //                               .toString(),
                //                           style: TextStyle(
                //                               color: defaultFontColor,
                //                               fontSize: 17),
                //                           overflow: TextOverflow.ellipsis,
                //                         ),
                //                       )
                //                     ],
                //                   )
                //                 ],
                //               ),
                //             );
                //           }),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 80,
                ),

//                 Accordion(
//                   headerBackgroundColorOpened: Colors.transparent,
//                   maxOpenSections: 1,
//                   openAndCloseAnimation: false,
//                   disableScrolling: true,
//                   contentBackgroundColor: Colors.transparent,
//                   contentBorderColor: Colors.transparent,
//                   headerPadding: const EdgeInsets.only(
//                       left: 20, right: 10, top: 0, bottom: 20),
//                   headerBackgroundColor: Colors.transparent,
// //                  leftIcon: Icon(Icons.audiotrack, color: Colors.white),
//                   children: [
//                     AccordionSection(
//                       isOpen: false,
//                       rightIcon: Icon(Icons.arrow_drop_down),
//                       header: Text('ATTRIBUTES',
//                           style:
//                               TextStyle(color: defaultFontColor, fontSize: 17)),
//                       content: const Text(
//                         'This is the introduction right here ...',
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     AccordionSection(
//                       isOpen: false,
//                       rightIcon: Icon(Icons.arrow_drop_down),
//                       header: Text('SALES HISTORY',
//                           style:
//                               TextStyle(color: defaultFontColor, fontSize: 17)),
//                       content: Row(
//                         children: const [],
//                       ),
//                     ),
//                   ],
//                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
