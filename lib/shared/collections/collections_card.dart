import 'package:de_marketplace/shared/collections/deGods_generation.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class CollectionsCard extends StatelessWidget {
  const CollectionsCard({
    Key? key,
    required this.collection,
    required this.title,
    this.collectionName,
    required this.amount,
    required this.nftImg,
    this.metadata,
  }) : super(key: key);

  final dynamic collection;
  final String title;
  final String? collectionName;
  final double amount;
  final String nftImg;
  final dynamic metadata;

  @override
  Widget build(BuildContext context) {
    print('collection: $collection');
    print(title);
    print(collectionName);
    print(price);
    print(nftImg);
    print(metadata);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeGodsGeneration(
              collection: collection,
              title: title,
              amount: amount,
              nftImg: nftImg,
              metadata: metadata,
              collectionName: collectionName,
              // metadata: metaData,
            ),
          ),
        );
      },
      child: Container(
        height: 230,
        width: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cardColor,
        ),
        child: Column(
          children: [
            Container(
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                          nftImg,
                        ),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 12,
                      child: Image.asset('assets/images/Group 19070.png'),

                      /// The image has an issue
                      // child: CircleAvatar(
                      //   radius: 17,
                      //   backgroundColor: firstCardColor.withOpacity(0.5),
                      //   child: Image.asset('KYZZEN GRAD ICON 1.png'),
                      //
                      // ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Container(
                        width: 55,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: cardColor.withOpacity(0.75),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Vector2.png'),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              amount.toString(),
                              style: textStyleSmall.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 15,
                      child: Container(
                        width: 55,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: cardColor.withOpacity(0.75),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '으 ${metadata['seller_fee_basis_points'].toString() ?? '500'}',
                              style: textStyleSmall.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      metadata['name']?? 'Cyborg',
                      style: textStyleSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.5,
                          letterSpacing: 0.3,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    metadata['name'].toString().contains('#')
                        ? '#${metadata['name'].toString().split('#')[1]}'
                        : '',
                    style: textStyleSmall.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset('assets/images/solana-sol-logo 33.png'),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    (collection['price'] / price).toString(),
                    style: textStyleBig.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
