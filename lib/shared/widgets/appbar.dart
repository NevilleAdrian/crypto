import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/buttons/buttons.dart';
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
        SizedBox(
          height: 10,
        ),
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
                    style: textStyleSmall.copyWith(
                      color: lemonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' SOL/USD '),
                  TextSpan(
                    text: ' \$31.50',
                    style: textStyleSmall.copyWith(
                      color: lemonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' Solana Network: '),
                  TextSpan(
                    text: ' 2,857 TPS',
                    style: textStyleSmallBold.copyWith(
                      color: lemonColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
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
                    await Auth.authProvider(context).getTokenAccounts();
                  })
            ],
          ),
        ),
      ],
    ),
  );
}
