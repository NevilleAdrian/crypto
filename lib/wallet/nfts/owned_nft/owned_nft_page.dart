import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/nfts/owned_nft/owned_nft_card.dard.dart';
import 'package:flutter/material.dart';

class OwnedNftPage extends StatelessWidget {
  const OwnedNftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    Text('Owned NFTs',
                    style: textStyleBig.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                    ),
                    Text('10 NFTs',
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
                          horizontal: 8,
                      vertical: 6
                      ).copyWith(right: 2),
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: appColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Collection',
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
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6
                      ).copyWith(right: 2),
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: appColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Collection Name: A-Z',
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
              SizedBox(height: 20,),
              OwnedNFTItems(
                image: 'assets/images/image 55.png',
                text1: '5',
                text2: '200',
                text3: '1,000',),
              SizedBox(height: 15,),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 3,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => OwnedNftCard(
                  collection: collection[index],

                ),
              ),
              SizedBox(height: 25,),
              OwnedNFTItems(
                image: 'assets/images/image 56.png',
                text1: '3',
                text2: '15',
                text3: '45',),
              SizedBox(height: 15,),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 3,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => OwnedNftCard(
                  collection: collection[index],

                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OwnedNFTItems extends StatelessWidget {
  const OwnedNFTItems({
    Key? key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);
  final String image;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 7,
            ),
            height: 38,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: appColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items',
                style: textStyleSmall.copyWith(
                  fontSize: 14,
                ),),
                SizedBox(width: 15,),
                Text(text1,
                  style: textStyleSmall.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 7,
            ),
            height: 38,
            width: MediaQuery.of(context).size.width * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: appColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Floor',
                  style: textStyleSmall.copyWith(
                    fontSize: 14,
                  ),),
                Row(
                  children: [
                    Text(text2,
                      style: textStyleSmall.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                    SizedBox(width: 2,),
                    Image.asset('assets/images/solana-sol-logo 33.png'),
                  ],
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 7,
            ),
            height: 38,
            width: MediaQuery.of(context).size.width * 0.29,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: appColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                  style: textStyleSmall.copyWith(
                    fontSize: 14,
                  ),),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Text(text3,
                      style: textStyleSmall.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                    SizedBox(width: 2,),
                    Image.asset('assets/images/solana-sol-logo 33.png'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


