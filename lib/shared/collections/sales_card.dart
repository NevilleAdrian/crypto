import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({
    Key? key,
    required this.text,
    required this.text2,
    required this.isShowing,
  }) : super(key: key);
  final String text;
  final String text2;
  final bool isShowing;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 35,
      width: MediaQuery.of(context).size.width / 2.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
      child: Row(
        children: [
          Text(text,
            style: textStyleSmall,
          ),
          Spacer(),
          Text(text2,
            style: textStyleSmallMedium.copyWith(fontSize: 13),
          ),
          SizedBox(width: 3,),
          isShowing? Image.asset('assets/images/solana-sol-logo 33.png') : Text(''),

        ],
      ),
    );
  }
}