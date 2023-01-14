import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/collections/collections_card.dart';
import 'package:de_marketplace/shared/collections/sales_card.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class DeGodsCollection extends StatefulWidget {
  const DeGodsCollection({Key? key}) : super(key: key);

  @override
  State<DeGodsCollection> createState() => _DeGodsCollectionState();
}

class _DeGodsCollectionState extends State<DeGodsCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: isDarkMode? Colors.black : const Color(0xfff8f8f8),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: appColor,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10,),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Icon(Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onTap: (){Navigator.pop(context);},
                        ),
                        SizedBox(width: 10,),
                        Text('Collections',
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
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: backGroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset('assets/images/filter.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/image 54.png'),
                          SizedBox(width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('DeGods',
                                      style: textStyleBig.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 10,),
                                    Image.asset('assets/images/Group 19653.png'),
                                  ],
                                ),
                                SizedBox(height: 3,),
                                ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 280),
                                    child: Text('DeGods is a digital art collection and global community of creators, developers, entrepreneurs, athletes, artists, experimenters and innovators.',
                                      style: textStyleSmall.copyWith(fontWeight: FontWeight.w500, fontSize: 12),)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Column(
                            children: const [
                              SalesCard(
                                text: 'Price Floor',
                                text2: '373',
                                isShowing: true,
                              ),
                              SizedBox(height: 10,),
                              SalesCard(
                                text: 'Highest Scale',
                                text2: '7,033',
                                isShowing: true,
                              ),
                              SizedBox(height: 10,),
                              SalesCard(
                                text: 'Owners',
                                text2: '4,395',
                                isShowing: false,
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                          Column(
                            children: const [
                              SalesCard(
                                text: 'Volume',
                                text2: '1.1M',
                                isShowing: true,
                              ),
                              SizedBox(height: 10,),
                              SalesCard(
                                text: 'Listings',
                                text2: '118',
                                isShowing: false,
                              ),
                              SizedBox(height: 10,),
                              SalesCard(
                                text: 'Total Supply',
                                text2: '10K',
                                isShowing: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1.5,
                                color: cardColor,
                              ),
                            ),
                            child: Image.asset('assets/images/bitcoin-refresh.png'),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1.5,
                                  color: cardColor,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 15,),
                                  Text('Recently Listed',
                                    style: textStyleSmall,
                                  ),
                                  Spacer(),
                                  const Icon(Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),

                      // CollectionsCard(collection: product[0]),


                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20 / 2,
                        ),
                        itemCount: product.length,
                        itemBuilder: (context, index) => CollectionsCard(
                          collection: product[index],
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          )
      ),


    );
  }
}



