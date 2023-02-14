import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/wallet_collections.dart';
import 'package:flutter/material.dart';

class OwnedDomainCard extends StatelessWidget {
  const OwnedDomainCard({
    Key? key,
    required this.ownedproduct,
  }) : super(key: key);
  final WalletCollections ownedproduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: MediaQuery.of(context).size.width * 0.32,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage(ownedproduct.image),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
            child: Text(ownedproduct.text, style:  textStyleBig.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),),
          ),
        ],
      ),
    );
  }
}