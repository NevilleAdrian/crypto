import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class VolumeCard extends StatelessWidget {
  const VolumeCard({
    Key? key, required this.image,
  }) : super(key: key);
  final String image;

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
                    image: DecorationImage(image: AssetImage(image),
                    ),
                  ),
                  child: Text(''),

                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DeGods',
                      style: textStyleBig.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    kVerySmallHeight,
                    Row(
                      children: [
                        Text('Floor:',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        kSmallestWidth,
                        Image.asset("assets/images/solana-sol-logo 1.png",),
                        SizedBox(width: 3,),
                        Text('469',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('24H Volume',
                      style: textStyleBig.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    kVerySmallHeight,
                    Row(
                      children: [
                        Image.asset("assets/images/solana-sol-logo 1.png",),
                        SizedBox(width: 3,),
                        Text('469',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),),
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