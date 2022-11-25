import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: CONVERT TO CLASS BASED
Padding buildCollections(
    String title,
    double price,
    String author,
    String authorImg,
    String? nftImg,
    Color defaultFontColor,
    bool isDarkMode,
    Size size,
    String aspect,
    {Function()? onTap}) {
  double width = size.width * 0.6;
  double height = size.height * 0.2;

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
              onTap: onTap,
              child: Stack(
                children: [
                  aspect != 'slim'
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            nftImg != null || nftImg != ''
                                ? nftImg!
                                : 'https://images.pexels.com/photos/12638731/pexels-photo-12638731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            height: 150,
                            fit: BoxFit.fitWidth,
                            width: 300,
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
                            nftImg != null || nftImg != ''
                                ? nftImg!
                                : 'https://images.pexels.com/photos/12638731/pexels-photo-12638731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
                ],
              ),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.only(top: 15),
            // height: 0,
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
