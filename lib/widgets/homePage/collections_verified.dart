import '../../core/app_navigation/app_navigator.dart';
import '../../core/app_navigation/app_route.dart';
import '../../features/dashboard/data/models/args.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

//import 'package:de_marketplace/pages/details_page.dart';

import 'package:flutter/cupertino.dart';

Padding buildCollections(
    String title,
    double price,
    String author,
    String authorImg,
    String nftImg,
    Color defaultFontColor,
    bool isDarkMode,
    Size size,
    String aspect) {
  double width = size.width * 0.6;
  double height = size.height * 0.2;

//  final bytes = await dart_io.File(image).readAsBytes();
//
//  final image = await image_builder.decodeImage(bytes))!;

  return Padding(
    padding: aspect != 'slim'
        ? EdgeInsets.only(left: size.width * 0.055)
        : const EdgeInsets.all(6),
    child: Container(
      width: width - 90,
      height: 100,
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.15),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: InkWell(
              onTap: () => AppNavigator.pushNamed(
                detailsViewRoute,
                arguments: Args(
                  isDarkMode: isDarkMode,
                  collectionName: "Solarians",
                  collectionId: "solarians-1234",
                  collectionProfileImg: "assets/images/solarians.png",
                  size: size,
                ),
              ),
              child: Stack(
                children: [
                  aspect != 'slim'
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            nftImg,
                            height: 150,
                            fit: BoxFit.fitHeight,
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
                        )
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            nftImg,
//                      height: 150,
                            fit: BoxFit.fill,
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
          ),
          SizedBox(
            width: width,
            height: 60,
            child: Row(
              children: [
                SizedBox(
                  width: width * 1 / 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        color: defaultFontColor,
                        fontSize: aspect != 'slim' ? width * 0.05 : 15,
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
                          'assets/icons/verif.png',
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
          ),
        ],
      ),
    ),
  );
}
