import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';


class WalletOffers extends StatelessWidget {
  const WalletOffers({
    Key? key,
    required this.image,
    required this.text,
    required this.status,
    required this.statusColor,
  }) : super(key: key);
  final String image;
  final String text;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: cardColor,
                  width: 2
              )
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width *0.39,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 155),
                child: Text(text,
                  style: textStyleBig.copyWith(
                    fontSize: 15,
                    letterSpacing: 0.5,

                  ),),
              ),

              /// decided to use the ConstrainedBox, instead of the
              /// column below.
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('The Anime Sol',
              //     style: textStyleBig.copyWith(
              //       letterSpacing: 0.5,
              //       fontSize: 14,
              //     ),),
              //     Text('',
              //       style: textStyleBig.copyWith(
              //         letterSpacing: 0.5,
              //         fontSize: 14,
              //       ),),
              //
              //   ],
              // ),
            ),
            SizedBox(width: 10,),
            Row(
              children: [
                Image.asset('assets/images/solana-sol-logo 1.png'),
                SizedBox(width: 5,),
                Text('42.09',style: textStyleBig.copyWith(
                  fontSize: 15,
                  letterSpacing: 0.3,
                ),),
              ],
            ),
            Spacer(),
            Text(status,
              style: textStyleBig.copyWith(
                color: statusColor,
                fontSize: 15,
                letterSpacing: 0.3,
              ),)
          ],
        ),
      ),
    );
  }
}