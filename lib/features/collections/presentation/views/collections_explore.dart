import '../../../../shared/widgets/homePage/collections_verified.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionExplore extends StatelessWidget {
  const CollectionExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Explore All Collections",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.sort,
                          color: isDarkMode ? Colors.white : Colors.black,
                          size: 30),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.filter_alt_outlined,
                          color: isDarkMode ? Colors.white : Colors.black,
                          size: 30),
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Container(
              color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
              child: GridView.count(
                childAspectRatio: (1 / 1.35),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(10, (index) {
                  return buildCollections(
                    'Solarians',
                    0.2,
                    'Ohme Ohmy',
                    'assets/images/avatar1.jpg',
                    'assets/images/solarians-profile.png',
                    isDarkMode ? Colors.white : Colors.black,
                    isDarkMode,
                    size,
                    'slim', // slim or square or wide
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
