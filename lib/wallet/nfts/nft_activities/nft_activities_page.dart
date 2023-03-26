import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/nfts/components/wallet_activities.dart';
import 'package:flutter/material.dart';

class NftActivitiesPage extends StatelessWidget {
  const NftActivitiesPage({Key? key}) : super(key: key);

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
                      'NFT Activities',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      '89 Activities',
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Dollarsign.png'),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Sales',
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: walletGrey.withOpacity(0.6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Listings.png'),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Listings',
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: walletGrey.withOpacity(0.2),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Listings.png'),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'All',
                            style: textStyleBig.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(25).copyWith(
                  right: 50,
                  left: 20,
                  bottom: 20,
                ),
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
                      'Type',
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
              WalletActivities(
                image: 'assets/images/KYZZEN GRAD ICON 1 (1).png',
              ),
              WalletActivities(
                image: 'assets/images/magic-eden 1.png',
              ),
              WalletActivities(
                image: 'assets/images/Vector zz.png',
              ),
              WalletActivities(
                image: 'assets/images/KYZZEN GRAD ICON 1 (1).png',
              ),
              WalletActivities(
                image: 'assets/images/Vector zz.png',
              ),
              WalletActivities(
                image: 'assets/images/magic-eden 1.png',
              ),
              WalletActivities(
                image: 'assets/images/Vector zz.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
