import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/nfts/components/wallet_offers.dart';
import 'package:flutter/material.dart';

class OffersMadePage extends StatelessWidget {
  const OffersMadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
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
              Container(
                margin: EdgeInsets.all(25).copyWith(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Offers Made',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      '15 Offers',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: 20,
              //   ),
              //
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 15,
              //             vertical: 6
              //         ).copyWith(right: 2),
              //         width: MediaQuery.of(context).size.width * 0.9,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12),
              //           border: Border.all(
              //             color: appColor,
              //           ),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text('Show All Offers',
              //               style: textStyleSmall.copyWith(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 letterSpacing: 0.5,
              //               ),),
              //             SizedBox(width: 15,),
              //             Icon(Icons.arrow_drop_down_rounded,
              //               color: Colors.white,
              //               size: 30,),
              //           ],
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),
              Container(
                margin: EdgeInsets.all(25).copyWith(right: 30, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Item',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Offer Amt',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Status',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: walletGrey,
                    width: 1.5,
                  ),
                ),
              ),
              WalletOffers(
                image: 'assets/images/image 75.png',
                text: 'TheAnimeSol',
                status: 'INVALID',
                statusColor: Colors.orange,
              ),
              WalletOffers(
                image: 'assets/images/image 76.png',
                text: 'OKAY BEARS ZOMBIE',
                status: 'ACTIVE',
                statusColor: lemonColor,
              ),
              WalletOffers(
                image: 'assets/images/image 77.png',
                text: 'The Sports Club - Most Valuable Players',
                status: 'INACTIVE',
                statusColor: Colors.grey.shade800,
              ),
              WalletOffers(
                image: 'assets/images/image 78.png',
                text: 'EyePhuc Ked Kitty',
                status: 'ACCEPTED',
                statusColor: Colors.green,
              ),
              WalletOffers(
                image: 'assets/images/image 79.png',
                text: 'Stranger Fins',
                status: 'REJECTED',
                statusColor: Colors.red,
              ),
              WalletOffers(
                image: 'assets/images/image 80 (1).png',
                text: 'Glorious Lions',
                status: 'INVALID',
                statusColor: Colors.orange,
              ),
              WalletOffers(
                image: 'assets/images/image 81.png',
                text: 'Elemento Dragons',
                status: 'ACTIVE',
                statusColor: Colors.green,
              ),
              WalletOffers(
                image: 'assets/images/image 82.png',
                text: 'Pixel Bears',
                status: 'INACTIVE',
                statusColor: Colors.grey.shade800,
              ),
              WalletOffers(
                image: 'assets/images/image 83.png',
                text: 'Outcast Academy',
                status: 'ACTIVE',
                statusColor: Colors.green,
              ),
              WalletOffers(
                image: 'assets/images/image 83.png',
                text: 'Outcast Academy',
                status: 'INACTIVE',
                statusColor: Colors.grey.shade800,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
