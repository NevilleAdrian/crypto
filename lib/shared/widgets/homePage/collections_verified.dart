import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// TODO: CONVERT TO CLASS BASED
Widget buildCollections(
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

  return Container(
    margin: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: appColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              nftImg != null || nftImg != ''
                  ? nftImg!
                  : 'https://images.pexels.com/photos/12638731/pexels-photo-12638731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              height: 200,
              fit: BoxFit.cover,
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
                      Radius.circular(0),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleBig.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SvgPicture.asset('assets/images/svg/verified.svg')
                ],
              ),
              kMediumHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Floor Price',
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBig.copyWith(color: greyColor),
                  ),
                  Text(
                    '24H Volume',
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBig.copyWith(color: greyColor),
                  ),
                ],
              ),
              kMediumHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/sol.png',
                        height: 14,
                      ),
                      kSmallestWidth,
                      Text(
                        '0.5 SOL',
                        overflow: TextOverflow.ellipsis,
                        style: textStyleSmall.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/sol.png',
                        height: 14,
                      ),
                      kSmallestWidth,
                      Text(
                        '10',
                        overflow: TextOverflow.ellipsis,
                        style: textStyleSmall.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
