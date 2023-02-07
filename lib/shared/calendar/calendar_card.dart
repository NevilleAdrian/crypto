import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({
    Key? key,
    required this.calendar,
  }) : super(key: key);
  final dynamic calendar;

  @override
  Widget build(BuildContext context) {
    openBrowser(String url) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication,
      );
    }

    String? formatDate(int timestamp, String? type) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      String? formattedDate;
      if (type != 'time') {
        formattedDate = DateFormat("MM-dd-yyyy").format(dateTime);
      } else {
        formattedDate = DateFormat("hh:mm").format(dateTime);
      }

      return formattedDate;
    }



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
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                  calendar['thumbnail'] == '' ? 'https://creator-hub-prod.s3.us-east-2.amazonaws.com/punkkidswtf_pfp_1662035897457.png' :  checkImage(calendar['thumbnail'])
                        ? calendar['thumbnail']
                        : '$IMAGE_KIT_ENDPOINT_URL${calendar['thumbnail']}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          kMediumHeight,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                calendar['name'],
                style: textStyleBig.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 20),
              ),
              kVerySmallHeight,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      calendar['description'],
                      maxLines: 3,
                      style: textStyleSmall.copyWith(
                        fontSize: 13,
                        letterSpacing: 0.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
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
                    Text(
                      formatDate(calendar['launch_date'], 'year')!,
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
                      )),
                    ),
                    kSmallestWidth,
                    Text(
                      formatDate(calendar['launch_date'], 'time')!,
                      style: textStyleBig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          openBrowser(calendar['website']);
                        },
                        child: Image.asset('assets/images/Internet3.png')),
                    kSmallestWidth,
                    InkWell(
                        onTap: () {
                          openBrowser(calendar['twitter']);
                        },
                        child: Image.asset('assets/images/Twitter.png')),
                    kSmallestWidth,
                    InkWell(
                        onTap: () {
                          openBrowser(calendar['discord']);
                        },
                        child: Image.asset('assets/images/Discord.png')),
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
