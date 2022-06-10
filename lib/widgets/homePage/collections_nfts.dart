import '../../core/app_navigation/app_navigator.dart';
import '../../core/app_navigation/app_route.dart';
import '../../features/dashboard/data/models/args.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';

Padding buildNFT(
  String title,
  double price,
  String author,
  String authorImg,
  String nftImg,
  Color defaultFontColor,
  bool isDarkMode,
  Size size,
) {
  double width = size.width * 0.6;
  double height = size.height * 0.2;

//  final bytes = await dart_io.File(image).readAsBytes();
//
//  final image = await image_builder.decodeImage(bytes))!;

  return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      width: width - 90,
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.grey.withOpacity(0.3)
            : Colors.black.withOpacity(0.15),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => AppNavigator.pushNamed(
              collectionsViewRoute,
              arguments: Args(
                isDarkMode: isDarkMode,
                collectionName: title,
                collectionId: "solarians-1234",
                collectionProfileImg: nftImg,
                size: size,
              ),
            ),
            child: Stack(children: [
              Column(children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.05)
                        : Colors.black,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.asset(
                          nftImg,
                          height: 170,
                          width: width,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.white.withOpacity(0.05)
                                    : Colors.black,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(0),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

//                  Align(
//                    alignment: Alignment.bottomRight,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Container(
//                        height: height * 0.1,
//                        width: width * 0.25,
//                        decoration: BoxDecoration(
//                          color: Colors.grey.withOpacity(0.8),
//                          borderRadius: const BorderRadius.all(
//                            Radius.circular(5),
//                          ),
//                        ),
//                        child: Align(
//                          child: Text(
//                            "01:30:02",
//                            style: GoogleFonts.inconsolata(
//                              color: Colors.white,
//                              fontSize: width * 0.055,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 4, bottom: 2),
                    width: width,
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.2)
                        : Colors.grey.withOpacity(0.3),
                    child: Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width * 1 / 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Text(
                                title,
                                style: GoogleFonts.poppins(
                                  color: defaultFontColor,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: height * 0.15,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Align(
                              child: Row(
                                children: [
                                  Image.asset(
                                    isDarkMode
                                        ? 'assets/icons/verif.png'
                                        : 'assets/icons/verif-black.png',
                                    height: height * 0.2,
                                    width: width * 0.08,
                                  ),

                                  const SizedBox(width: 3),

//                        Padding(
//                          padding:
//                          EdgeInsets.symmetric(horizontal: width * 0.01),
//                          child: Icon(
//                              CupertinoIcons.down_arrow,
//                              color: Colors.white.withOpacity(0.5),
//                              size: 15,
//                          ),
//                        ),
//                        Padding(
//                          padding:
//                              EdgeInsets.symmetric(horizontal: width * 0.01),
//                          child: Text(
//                            " $price",
//                            style: GoogleFonts.poppins(
//                              color: isDarkMode ? Colors.white : Colors.black,
//                              fontSize: width * 0.045,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),

//                        Padding(
//                          padding:
//                          EdgeInsets.symmetric(horizontal: width * 0.01),
//                          child: Text(
//                            " $price",
//                            style: GoogleFonts.poppins(
//                              color: isDarkMode ? Colors.white : Colors.black,
//                              fontSize: width * 0.045,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 1 / 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Text(
                                  "DRONE \nSolarians",
                                  style: GoogleFonts.poppins(
                                    color: defaultFontColor.withOpacity(0.6),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 1 / 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Text(
                                "◎4.44",
                                style: GoogleFonts.poppins(
                                  color: defaultFontColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: height * 0.15,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Align(
                              child: Row(
                                children: [
                                  Text(
                                    "Last ◎3",
                                    style: GoogleFonts.poppins(
                                      color: defaultFontColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
              ]),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: defaultFontColor.withOpacity(0.5),
                      ),
                    ),
                  ),

                  const Spacer(),

//                  SizedBox(
//                    child: Padding(
//                      padding: EdgeInsets.only(left: width * 0.02),
//                      child:
//                      const Icon(
//                        Icons.remove_red_eye_outlined,
//                        size: 20,
//                      ),
//                    ),
//                  ),
//
//                  const Spacer(),

                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: Icon(
                        Icons.link,
                        size: 24,
                        color: defaultFontColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
