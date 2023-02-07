import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class VolumeCard extends StatelessWidget {
  const VolumeCard({
    Key? key,
    required this.image,
    required this.name,
    required this.floorPrice,
    required this.hours,
  }) : super(key: key);
  final String image;
  final String name;
  final String floorPrice;
  final String hours;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: cardColor,
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(image)),
                  ),
                  child: Text(''),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: textStyleBig.copyWith(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kVerySmallHeight,
                      Row(
                        children: [
                          Text(
                            'Floor:',
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          kSmallestWidth,
                          Image.asset(
                            "assets/images/solana-sol-logo 1.png",
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            floorPrice,
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$hours',
                      style: textStyleBig.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    kVerySmallHeight,
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/solana-sol-logo 1.png",
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          floorPrice,
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
