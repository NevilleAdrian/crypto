import '../../../core/app_navigation/app_navigator.dart';
import '../../../core/app_navigation/app_route.dart';
import '../../../features/dashboard/data/models/args.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: CONVERT TO CLASS BASED
Column buildFeaturedBanner(bool isDarkMode, String collectionName,
    String collectionBannerImg, Size size) {
  double width = size.width;
  double height = size.width * 0.7;
  Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;

  return Column(
    children: [
      Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black,
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
                ClipRRect(
                  child: Image.asset(
                    'assets/images/solarians.png',
                    fit: BoxFit.fill,
                    width: width,
                    height: height,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.05)
                              : Colors.black,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: size.height * 0.025,
                    ),
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        width: width,
        padding: EdgeInsets.only(
          left: size.width * 0.075,
          right: size.height * 0.02,
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  "Solarians",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: defaultFontColor,
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 0),
              width: width,
              child: Text(
                "The First On-Chain Generative NFTs on Solana.",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  color: defaultFontColor,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                  child: Row(
                    children: [
                      Text("View Collection",
                          style: GoogleFonts.lato(
                            color: defaultFontColor.withOpacity(0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                      Icon(Icons.arrow_right,
                          color: defaultFontColor.withOpacity(0.9), size: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 0.5,
        width: width,
        color: Colors.grey.withOpacity(0.5),
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      )
    ],
  );
}
