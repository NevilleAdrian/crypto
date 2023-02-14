import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class ListedNftCard extends StatelessWidget {
  const ListedNftCard({
    Key? key, required this.collection,
  }) : super(key: key);
  final Collections collection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
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
                  borderRadius:  BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(collection.image),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: Container(
                      width: 46,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: cardColor.withOpacity(0.75),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Vector2.png'),
                          SizedBox(
                            width: 3,
                          ),
                          Text('1402',
                            style: textStyleSmall.copyWith(
                              fontSize: 11,
                            ),)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Container(
                      width: 46,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: cardColor.withOpacity(0.75),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Vector2.png'),
                          SizedBox(
                            width: 3,
                          ),
                          Text('2791',
                            style: textStyleSmall.copyWith(
                              fontSize: 11,
                            ),)
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('DeGod #3307',
                      style: textStyleSmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),


                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.asset("assets/images/solana-sol-logo 1.png", scale: 1.2,),
                    SizedBox(width: 2,),
                    Text('599',
                    style: textStyleBig.copyWith(
                      fontWeight: FontWeight.w500,
                    ),),
                    Spacer(),
                    Image.asset('assets/images/eye.png', scale: 0.8,),
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