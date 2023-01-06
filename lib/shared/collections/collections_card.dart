import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectionsCard extends StatelessWidget {
  const CollectionsCard({Key? key,

    required this.collection,

  }
  ) : super(key: key);

  final Collections collection;




  @override
  Widget build(BuildContext context) {
    return Container(
    height: 230,
    width: MediaQuery.of(context).size.width * 0.4,
    margin: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: cardColor,

    ),
    child: Column(
      children: [ 
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10),),
          child: Stack(
            children: [
              Image.asset(collection.image, fit: BoxFit.cover,),
              Positioned(
                  left: 10,
                  top: 12,
                  child:Image.asset('assets/images/Group 19070.png'),

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
                      SizedBox(width: 3,),
                      Text('1402',
                        style: textStyleSmall.copyWith(fontWeight: FontWeight.w500),),


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
                      Image.asset('assets/images/Vector2.png'),
                      SizedBox(width: 3,),
                      Text('2791',
                        style: textStyleSmall.copyWith(fontWeight: FontWeight.w500),),


                    ],
                  ),
                ),
              ),
            ],
          )
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('DeGod Generation',
              style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                fontSize: 10.5,
                letterSpacing: 0.3,
              ),
              ),
              Text('#3307',
                style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: 0.3,
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 6,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Image.asset('assets/images/solana-sol-logo 33.png'),
              SizedBox(width: 3,),
              Text('599',
              style: textStyleBig.copyWith(
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),
        ),
      ],
    ),
    );
  }
}





