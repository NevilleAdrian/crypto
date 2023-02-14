import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/shared/collections/deGods_collection.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class OffersReceivedPage extends StatelessWidget {
  const OffersReceivedPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final auth = Auth.authProvider(context);
    final collection =
        Auth.authProvider(context, listen: true).latestCollections;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    var collections = auth.allCollections;

    var rowTabs = [
      'Offer Amount',
      'Status',

    ];
    navigateToNextScreen(int i, dynamic collections) {
      Size size = MediaQuery.of(context).size; //check the size of device

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DeGodsCollection(
                args: Args(
                  isDarkMode: false,
                  collectionName: collections[i]['name'],
                  description: collections[i]['description'],
                  collectionId: "solarians-1234",
                  collectionProfileImg: "assets/images/solarians.png",
                  size: size,
                  collectionImg: checkImage(collections[i]['thumbnail'])
                      ? collections[i]['thumbnail']
                      : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}',
                  verified: collections[i]['verifeyed'],
                  floorPrice: collections[i]['floorPrice'],
                  volume24hrs: collections[i]['volumePast24h'],
                  totalVol: collections[i]['volumeTotal'],
                ))),
      );
    }

    Widget tableBody(String type, String amount, String vol, int totalVol,
        String floorPrice) {
      if (type == 'Tokens') {
        return Text(
          '10,100',
          style: textStyleSmall.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              overflow: TextOverflow.ellipsis),
        );
      } else if (type == 'Listed') {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '142',
              style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            // kVerySmallHeight,
            // Text(
            //   '30.45%',
            //   style: textStyleSmall.copyWith(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 10,
            //       overflow: TextOverflow.ellipsis),
            // ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  type == 'Total Vol'
                      ? vol
                      : (type == '24 Hrs Vol'
                      ? (totalVol / 10000000000).ceilToDouble().toString()
                      : vol),
                  style: textStyleSmall.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
                kSmallestWidth,
                Image.asset(
                  "assets/images/solana-sol-logo 1.png",
                ),
              ],
            )
          ],
        );
      }
    }
    List<Widget> _buildRows(int count, int i, dynamic collections) {
      return List.generate(
          count,
              (index) => InkWell(
            onTap: () {
              navigateToNextScreen(index, collections);
            },
            child: Container(
              height: 68,
              width: 100,
              child: tableBody(
                  rowTabs[i],
                  collections[index]['name'],
                  collections[index]['volumePast24h'].toString(),
                  collections[index]['volumePast24h'],
                  collections[index]['floorPrice'].toString()),
            ),
              ));
    }
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
                        onTap: (){Navigator.pop(context);},
                        child: Icon(Icons.arrow_back_ios, color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5,),
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
                margin: EdgeInsets.all(25).copyWith(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Offers Received',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text('10 Offers',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6
                      ).copyWith(right: 2),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: appColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Show All Offers',
                            style: textStyleSmall.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),),
                          SizedBox(width: 15,),
                          Icon(Icons.arrow_drop_down_rounded,
                            color: Colors.white,
                            size: 30,),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Item',
                          style: textStyleSmall.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      height: 1000,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: rowTabs.length,
                        itemBuilder: (context, i) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rowTabs[i],
                              style: textStyleSmall.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            kBiggerHeight,

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Solana", style: textStyleBig,),

                                  ],
                                )
                              ],
                            ),
                            // kBiggerHeight,
                            // Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: _buildRows(
                            //         collections.length, i, collections)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
