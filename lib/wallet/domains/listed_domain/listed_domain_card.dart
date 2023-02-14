import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/wallet_collections.dart';
import 'package:flutter/material.dart';

class ListedDomainCard extends StatelessWidget {
  const ListedDomainCard({
    Key? key,
    required this.walletproduct,
  }) : super(key: key);
  final WalletCollections walletproduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
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
                    image: AssetImage(walletproduct.image),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 33,
                  child: Text(walletproduct.text, style:  textStyleBig.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),),
                ),
                SizedBox(height: 6,),
                Text("Current Bid:",
                  style: textStyleBig.copyWith(
                    fontSize: 12,
                  ),),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Image.asset('assets/images/k 5 1.png',scale: 0.6,),
                    SizedBox(width: 8,),
                    Text(
                      walletproduct.text3,
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),),

                  ],
                ),

              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: lightcardColor,
            ),
            child: Center(
              child: Text(walletproduct.text2,
                style: textStyleBig.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[350]
                ),),
            ),
          ),

        ],
      ),
    );
  }
}