import 'dart:convert';

import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/features/dashboard/presentation/widgets/dropdown/dropdown.dart';
import 'package:de_marketplace/shared/collections/collections_card.dart';
import 'package:de_marketplace/shared/collections/sales_card.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class DeGodsCollection extends StatefulWidget {
  final Args? args;

  const DeGodsCollection({Key? key, this.args}) : super(key: key);

  @override
  State<DeGodsCollection> createState() => _DeGodsCollectionState();
}

class _DeGodsCollectionState extends State<DeGodsCollection> {
  late Future<dynamic> futureData;

  List<String> values = ['Recent', '24 H', 'L to H', 'H to L'];

  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getCollectionDetails(widget.args!.collectionName);
      await auth.getOfferings(widget.args!.collectionName, '-addEpoch');

      await auth.getListingTotal(widget.args!.collectionName);
      await auth.getActivities(widget.args!.collectionName);

      setState(() {});

      print('result:$result');

      //Return future value
      return Future.value(result);
    } catch (ex) {}
  }

  @override
  void initState() {
    futureData = futureTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var activity = Auth.authProvider(context).transactions;
    Auth auth = Auth.authProvider(context);

    return Scaffold(
      body: SafeArea(
          child: FutureHelper(
        task: futureData,
        loader: Center(child: circularProgressIndicator(color: Colors.white)),
        builder: (context, _) => SingleChildScrollView(
          child: Column(
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Collections',
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(widget.args!.collectionImg),
                          radius: 30.0,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.args!.collectionName,
                                        style: textStyleBig.copyWith(
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    widget.args!.verified
                                        ? Image.asset(
                                            'assets/images/Group 19653.png')
                                        : Container(),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 280),
                                    child: Text(
                                      widget.args!.description ?? '',
                                      style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SalesCard(
                              text: 'Price Floor',
                              text2: widget.args!.floorPrice.toString(),
                              isShowing: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const SalesCard(
                              text: 'Highest Scale',
                              text2: '7,033',
                              isShowing: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SalesCard(
                              text: 'Owners',
                              text2: '4,395',
                              isShowing: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Column(
                          children: [
                            SalesCard(
                              text: 'Volume',
                              text2: widget.args!.volume24hrs.toString(),
                              isShowing: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SalesCard(
                              text: 'Listings',
                              text2: '118',
                              isShowing: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SalesCard(
                              text: 'Total Supply',
                              text2: ((widget.args!.totalVol ?? 50000000000) /
                                      10000000000)
                                  .ceilToDouble()
                                  .toString()
                                  .toString(),
                              isShowing: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                          child:
                              Image.asset('assets/images/bitcoin-refresh.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropDownItem(
                              values: values,
                              onPressed: (String? value) async {
                                setState(() {
                                  auth.setDropValue(value);
                                });
                                await auth.getOfferings(
                                    widget.args!.collectionName,
                                    auth.dropValue == 'Recent'
                                        ? '-addEpoch'
                                        : auth.dropValue == 'L to H'
                                            ? 'price'
                                            : '-price');
                              },
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1.5,
                                  color: cardColor,
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20 / 2,
                      ),
                      itemCount: Auth.authProvider(context).offerings!.length,
                      itemBuilder: (context, index) {
                        var metaData = jsonDecode(
                          Auth.authProvider(context)
                              .offerings[index]['metadata']
                              .replaceAll('\\', '')
                              .replaceAll('"O"', '')
                              .replaceAll('"E"', '')
                              .replaceAll('"L"', '')
                              .replaceAll('"S"', ''),
                        );

                        var newPrice = (Auth.authProvider(context)
                                .offerings[index]['price'] /
                            price);
                        return CollectionsCard(
                            collection:
                                Auth.authProvider(context).offerings[index],
                            title: metaData['name'],
                            amount: newPrice,
                            nftImg: metaData['image'],
                            metadata: metaData,
                            collectionName: widget.args!.collectionName);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
