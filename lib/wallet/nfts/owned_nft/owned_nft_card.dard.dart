import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class OwnedNftCard extends StatelessWidget {
  const OwnedNftCard({
    Key? key,
    required this.collection,
  }) : super(key: key);
  final Collections collection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardColor,
      ),
      child: Column(
        children: [
          Container(
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(collection.image), fit: BoxFit.cover)),
              child: Stack(
                children: [
                  // Positioned(
                  //   bottom: 10,
                  //   left: 15,
                  //   child: Container(
                  //     width: 46,
                  //     height: 20,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(9),
                  //       color: cardColor.withOpacity(0.75),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset('assets/images/Vector2.png'),
                  //         SizedBox(
                  //           width: 3,
                  //         ),
                  //         Text(
                  //           '1402',
                  //           style: textStyleSmall.copyWith(
                  //             fontSize: 11,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 10,
                  //   right: 15,
                  //   child: Container(
                  //     width: 46,
                  //     height: 20,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(9),
                  //       color: cardColor.withOpacity(0.75),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.asset('assets/images/Vector2.png'),
                  //         SizedBox(
                  //           width: 3,
                  //         ),
                  //         Text(
                  //           '2791',
                  //           style: textStyleSmall.copyWith(
                  //             fontSize: 11,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DeGod #3307',
                  style: textStyleSmall.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                // Image.asset(
                //   'assets/images/eye.png',
                //   scale: 0.8,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
