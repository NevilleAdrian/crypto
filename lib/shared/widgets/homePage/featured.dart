import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: CONVERT TO CLASS BASED
Center buildVideoThumbnail(bool isDarkMode, bool avideo, Size size) {
  double width = size.width * 0.85;
  double height = size.height * 0.2;
  return Center(
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: InkWell(
        onTap: () {
          if (avideo) {
            print('play video');
          } else {
            print('open collection');
          }
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                'assets/images/video.jpg',
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
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Text(
                'Solana\'s First Open\nNFT Marketplace', //title
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.025,
                ),
                child: Icon(
                  Icons.play_circle_fill, //play button
                  color: Colors.white,
                  size: size.width * 0.15,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
