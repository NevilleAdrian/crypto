import '../../../core/app_navigation/app_navigator.dart';
import '../../../core/app_navigation/app_route.dart';
import '../../../features/dashboard/data/models/args.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';

// TODO: CONVERT TO CLASS BASED
Padding buildCollections(
  String title,
  double price,
  String author,
  String authorImg,
  String nftImg,
  Color defaultFontColor,
  bool isDarkMode,
  Size size,
) {
  double width = size.width * 0.7;
  double height = size.height * 0.2;

  return Padding(
    padding: EdgeInsets.only(left: size.width * 0.055),
    child: SizedBox(
      width: width - 80,
      height: size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: InkWell(
              onTap: () => AppNavigator.pushNamed(
                detailsViewRoute,
                arguments: Args(
                  isDarkMode: isDarkMode,
                  collectionName: title,
                  collectionId: "solarians-1234",
                  collectionProfileImg: nftImg,
                  size: size,
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      nftImg,
                      fit: BoxFit.fill,
                      width: width,
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
                  width: width * 3 / 5,
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
                          'assets/icons/verif.png',
                          height: height * 0.12,
                          width: width * 0.08,
                        ),
                        const SizedBox(width: 3),
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
