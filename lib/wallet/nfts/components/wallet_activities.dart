import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';


class WalletActivities extends StatelessWidget {
  const WalletActivities({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

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
        padding: const EdgeInsets.all(20).copyWith(right: 53),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/images/image 75.png"),
            ),
            SizedBox(width: 15,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DeGods #3092",
                    style: textStyleBig.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,

                    ),),
                  SizedBox(height: 2,),
                  Row(
                    children: [
                      Image.asset('assets/images/solana-sol-logo 1.png'),
                      SizedBox(width: 5,),
                      Text('42.09',style: textStyleBig.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Text("2023/01/28 08:08",
                    style: textStyleBig.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text('Sale',
                  style: textStyleBig.copyWith(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5,),
                CircleAvatar(
                  backgroundColor: cardColor,
                  radius: 15,
                  child: Image.asset(image),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}