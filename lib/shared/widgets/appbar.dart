import 'package:de_marketplace/features/profile/presenation/views/profile_page.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

// TODO: CONVERT TO CLASS BASED
PreferredSize buildAppBar(BuildContext context) {
  Size size = MediaQuery.of(context).size; //check the size of device

  return PreferredSize(
      preferredSize: const Size.fromHeight(40.0), //appbar size
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Volume total: ',
                  style: textStyleGreySmall.copyWith(fontSize: 10),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' 24,554,996 SOL ',
                        style: textStyleSmallBold.copyWith(
                            color: primaryColor, fontSize: 10)),
                    TextSpan(text: ' SOL/USD '),
                    TextSpan(
                        text: ' \$31.50',
                        style: textStyleSmallBold.copyWith(
                            color: primaryColor, fontSize: 10)),
                    TextSpan(text: ' Solana Network: '),
                    TextSpan(
                        text: ' 2,857 TPS',
                        style: textStyleSmallBold.copyWith(
                            color: primaryColor, fontSize: 10)),
                  ],
                ),
              )
            ],
          ),
          kSmallHeight,
          Container(
              color: appColor,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/kyzzen.png',
                    height: 70,
                  ),
                  CustomButton(
                      size: Size(400, 600),
                      defaultFontColor: whiteColor,
                      onPressed: () async {
                        print('hi');
                        // await Auth.authProvider(context).getTokenAccounts();
                      })
                ],
              )),
        ],
      ));
}
