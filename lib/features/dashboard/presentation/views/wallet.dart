import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/buttons/buttons.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/textform/textform.dart';
import 'package:de_marketplace/features/profile/presenation/views/profile_page.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/domains/listed_domain/listed_domain_page.dart';
import 'package:de_marketplace/wallet/domains/live_domain_bids/live_domain_page.dart';
import 'package:de_marketplace/wallet/domains/owned_domain/owned_domain_page.dart';
import 'package:de_marketplace/wallet/nfts/listed_nft/listed_nft_page.dart';
import 'package:de_marketplace/wallet/nfts/nft_activities/nft_activities_page.dart';
import 'package:de_marketplace/wallet/nfts/offers/offers_made_page.dart';
import 'package:de_marketplace/wallet/nfts/offers/offers_received_page.dart';
import 'package:de_marketplace/wallet/nfts/owned_nft/owned_nft_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/option_box/option_box.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Type type = Type.parent;
  FocusNode textFocus = FocusNode();

  @override
  void initState() {
    Auth.authProvider(context).setLatestOffset(10);
    Auth.authProvider(context).setTrendingOffset(10);
    Auth.authProvider(context).setVerifiedOffset(10);
    super.initState();
  }

  @override
  void dispose() {
    textFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    Color oppositeFontColor = isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Container(
                    color: appColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet',
                            style: textStyleBig.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                            // TextStyle(
                            //   color: Colors.white,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  kNormalHeight,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/profile-circle.svg',
                                  height: 60,
                                ),
                                kSmallWidth,
                                Image.asset(
                                  "assets/images/solana-sol-logo 1.png",
                                ),
                                kVerySmallWidth,
                                Text('CZnNK...ToE',
                                    style: textStyleSmallMedium.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                    )),
                              ],
                            ),
                            OutlineCustomButton(
                                size: const Size(400, 600),
                                defaultFontColor: whiteColor,
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfilePage()));
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                  kBiggerHeight,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        TextRow(
                          decoration: textStyleBigBold,
                          text: 'Total Portfolio Value',
                          subText: '373',
                        ),
                        kSmallHeight,
                        TextRow(
                          decoration: textStyleSmall14,
                          text: 'Wallet Balance',
                          subText: '200',
                        ),
                        kSmallHeight,
                        TextRow(
                          decoration: textStyleSmall14,
                          text: 'Bidding Account',
                          subText: '73',
                        ),
                        kSmallHeight,
                        TextRow(
                          decoration: textStyleSmall14,
                          text: 'Total NFTs (Floor)',
                          subText: '100',
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 30,
                    color: borderColor,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabMenu(
                          text: "NFT'S",
                          style: type == Type.parent
                              ? textStyleBigBold.copyWith(
                                  fontSize: 18, color: backGroundColor)
                              : textStyleBigBold,
                          onTap: () {
                            setState(() {
                              type = Type.parent;
                            });
                          },
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            gradient: type == Type.parent
                                ? const LinearGradient(
                                    colors: <Color>[
                                      Color(0XFFBBE71F),
                                      Color(0XFF00C5FF)
                                    ],
                                  )
                                : LinearGradient(
                                    colors: <Color>[
                                      backGroundColor,
                                      backGroundColor
                                    ],
                                  ),
                          ),
                        ),
                        TabMenu(
                            text: 'Domains',
                            style: type == Type.child
                                ? textStyleBigBold.copyWith(
                                    fontSize: 18, color: backGroundColor)
                                : textStyleBigBold,
                            onTap: () {
                              setState(() {
                                type = Type.child;
                              });
                            },
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              gradient: type == Type.child
                                  ? const LinearGradient(
                                      colors: <Color>[
                                        Color(0XFFBBE71F),
                                        Color(0XFF00C5FF)
                                      ],
                                    )
                                  : LinearGradient(
                                      colors: <Color>[
                                        opaqueBackGroundColor,
                                        opaqueBackGroundColor
                                      ],
                                    ),
                            )),
                      ],
                    ),
                  ),
                  kSmallHeight,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: type == Type.parent
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OwnedNftPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'Owned  NFTs',
                                  subText: '10',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                              kSmallHeight,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListedNftPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'Listed  NFTs',
                                  subText: '23',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                              kSmallHeight,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OffersReceivedPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'Offers  Received',
                                  subText: '5',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                              kSmallHeight,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OffersMadePage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'Offers  Made',
                                  subText: '101',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                              kSmallHeight,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NftActivitiesPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'NFT Activities',
                                  subText: '89',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OwnedDomainPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'Owned  Domains',
                                  subText: '10',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                              kSmallHeight,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListedDomainPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: 'Listed  Domains',
                                  subText: '10',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                              kSmallHeight,
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LiveDomainPage()));
                                },
                                child: TextRow(
                                  decoration: textStyleBig500,
                                  text: "Live Domain Bids",
                                  subText: '10',
                                  showIcon: false,
                                  showArrow: true,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                color: backGroundColor,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Divider(
                      thickness: 1,
                      height: 30,
                      color: borderColor,
                    ),
                    TextRow(
                      decoration: textStyleBig500,
                      text: 'Bidding Account',
                      subText: '0',
                    ),
                    kSmallHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: MyTextForm(
                            onChangedCallback: (String value) async {},
                            textInputType: TextInputType.text,
                            labelText: "Enter amount",
                            focusNode: textFocus,
                            textColor: Colors.white.withOpacity(0.4),
                            fillColor: backGroundColor,
                          ),
                        ),
                        kSmallestWidth,
                        Row(
                          children: [
                            GreyButton(
                                size: const Size(400, 600),
                                text: 'Deposit',
                                defaultFontColor: whiteColor,
                                onPressed: () async {
                                  print('hi');
                                  // await Auth.authProvider(context).getTokenAccounts();
                                }),
                            kSmallestWidth,
                            GreyButton(
                                size: const Size(400, 600),
                                text: 'Withdraw',
                                defaultFontColor: whiteColor,
                                onPressed: () async {
                                  print('hi');
                                  // await Auth.authProvider(context).getTokenAccounts();
                                }),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  TextRow({
    Key? key,
    required this.text,
    required this.subText,
    required this.decoration,
    this.showIcon = true,
    this.showArrow = false,
  }) : super(key: key);

  final String text;
  final String subText;
  final TextStyle decoration;
  final bool showIcon;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: decoration,
        ),
        Row(
          children: [
            Text(
              subText,
              style: decoration,
            ),
            showArrow ? kModerateWidth : kSmallestWidth,
            showArrow
                ? Icon(
                    Icons.chevron_right,
                    color: whiteColor.withOpacity(0.7),
                  )
                : Container(),
            showIcon
                ? Image.asset(
                    "assets/images/solana-sol-logo 1.png",
                  )
                : Container(),
          ],
        )
      ],
    );
  }
}
