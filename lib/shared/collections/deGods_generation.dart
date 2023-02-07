import 'package:accordion/accordion.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class DeGodsGeneration extends StatelessWidget {
  const DeGodsGeneration(
      {Key? key,
      this.collection,
      required this.title,
      this.collectionName,
      required this.amount,
      required this.nftImg,
      this.metadata})
      : super(key: key);

  final dynamic collection;
  final String title;
  final String? collectionName;
  final double amount;
  final String nftImg;
  final dynamic metadata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  color: appColor,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            metadata['name'],
                            style: textStyleBig.copyWith(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 370,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        nftImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 35,
                      child: Container(
                        width: 110,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: cardColor.withOpacity(0.65),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/deGodsVector.png'),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              amount.toString(),
                              style: textStyleSmall.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      right: 35,
                      child: Container(
                        width: 110,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: cardColor.withOpacity(0.65),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '으 ${metadata['seller_fee_basis_points'].toString() ?? '500'}',
                              style: textStyleSmall.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ).copyWith(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              metadata['name'] ?? '',
                              style: textStyleBig.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  collectionName!,
                                  style: textStyleGreySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: 0.3),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: lightcardColor,
                                    ),
                                    child: Image.asset(
                                        'assets/images/deGodsVerifiedVector.png'))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/solana-sol-logo 26.png'),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            amount.toString(),
                            style: textStyleBig.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: lemonColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buy On',
                              style: textStyleBig.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: lightcardColor,
                              child: Image.asset(
                                'assets/images/magic-eden 1.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: cardColor),
                        child: Center(
                          child: Text(
                            'Make Offer',
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DeGodsCard(
                        text: 'Message',
                        image: 'assets/images/messenger2ndPart.png',
                      ),
                      DeGodsCard(
                        text: 'Refresh',
                        image: 'assets/images/refresh.png',
                      ),
                      DeGodsCard(
                        text: 'Heart',
                        image: 'assets/images/heart.png',
                      ),
                      DeGodsCard(
                        text: 'Flag',
                        image: 'assets/images/flag.png',
                      ),
                      DeGodsCard(
                        text: 'Share',
                        image: 'assets/images/share.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Accordion(
                  headerBackgroundColorOpened: Colors.transparent,
                  maxOpenSections: 1,
                  openAndCloseAnimation: false,
                  disableScrolling: true,
                  contentBackgroundColor: Colors.transparent,
                  contentBorderColor: Colors.transparent,
                  headerPadding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                    top: 10,
                    bottom: 0,
                  ),
                  headerBackgroundColor: Colors.transparent,
                  children: [
                    AccordionSection(
                      isOpen: false,
                      contentBackgroundColor: cardColor,
                      headerBackgroundColorOpened: Colors.transparent,
                      headerBackgroundColor: cardColor,
                      rightIcon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      header: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                        child: Text(
                          'About Collection Name',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      content: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${metadata['description']}',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: whiteColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    AccordionSection(
                      contentBackgroundColor: cardColor,
                      headerBackgroundColorOpened: Colors.transparent,
                      headerBackgroundColor: cardColor,
                      rightIcon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      header: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                        child: Text(
                          'Attributes',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      content: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 80,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 20),
                          itemCount: metadata['attributes'] == null
                              ? 0
                              : metadata['attributes'].length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${metadata['attributes'][index]['trait_type'].toString().toUpperCase()} ',
                                    style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          metadata['attributes'][index]['value']
                                              .toString(),
                                          style: TextStyle(
                                              color: whiteColor, fontSize: 17),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    // AccordionSection(
                    //   contentBackgroundColor: cardColor,
                    //   headerBackgroundColorOpened: Colors.transparent,
                    //   headerBackgroundColor: cardColor,
                    //   rightIcon: const Icon(
                    //     Icons.keyboard_arrow_down_outlined,
                    //     color: Colors.white,
                    //     size: 30,
                    //   ),
                    //   header: Padding(
                    //     padding: const EdgeInsets.only(top: 15, bottom: 25),
                    //     child: Text('Details',
                    //         style: textStyleBig.copyWith(
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 18,
                    //           letterSpacing: 0.5,
                    //         )),
                    //   ),
                    //   content: Row(
                    //     children: [
                    //       Expanded(
                    //         child: SingleChildScrollView(
                    //           scrollDirection: Axis.horizontal,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               Text('${metadata['description']}',
                    //                   style: TextStyle(color: whiteColor)),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    AccordionSection(
                      contentBackgroundColor: cardColor,
                      headerBackgroundColorOpened: Colors.transparent,
                      headerBackgroundColor: cardColor,
                      rightIcon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      header: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 25),
                        child: Text(
                          'Mint Id',
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      content: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(collection['mint'],
                                      style: TextStyle(color: whiteColor)),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: Icon(Icons.copy,
                          //       size: 20, color: Colors.green[200]),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),

                // DropdownCard(
                //   text: 'About The Collection',
                // ),
                // DropdownCard(
                //   text: 'Offers',
                // ),
                // DropdownCard(
                //   text: 'Sales History',
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownCard extends StatelessWidget {
  const DropdownCard({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ).copyWith(
        right: 10,
      ),
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 15,
      ),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textStyleBig.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              letterSpacing: 0.5,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class DeGodsCard extends StatelessWidget {
  const DeGodsCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 58,
        width: MediaQuery.of(context).size.width * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: lightcardColor,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: textStyleSmall.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
