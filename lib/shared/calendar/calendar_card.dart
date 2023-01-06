import 'package:de_marketplace/shared/calendar/calendar.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';


class CalendarCard extends StatelessWidget {
  const CalendarCard({
    Key? key, required this.calendar,
  }) : super(key: key);
  final Calendar calendar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 545,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10),),
                  child: Image.asset(calendar.image, fit: BoxFit.contain,),
                ),
              ),
            ],
          ),
          kMediumHeight,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('The Anime Sol',
                style: textStyleBig.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
              kVerySmallHeight,
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 360,),
                child: Text('The Anime SOL is a sporadic NFT collection on solana of about 4444 hand-drawn full-body NF collections',
                  style: textStyleSmall.copyWith(
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(17),
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: calendarColor,
                ),
                child: Row(
                  children: [
                    Text('10 Aug',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    kSmallestWidth,
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: lemonColor,
                          )
                      ),
                    ),
                    kSmallestWidth,
                    Text('02:20',
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/images/Internet3.png'),
                    kSmallestWidth,
                    Image.asset('assets/images/Twitter.png'),
                    kSmallestWidth,
                    Image.asset('assets/images/Discord.png'),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),

    );
  }
}