import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/shared/collections/deGods_collection.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../shared/utils/colors.dart';

// class CollectionTable extends StatefulWidget {
//   const CollectionTable({Key? key, this.collections, this.controller})
//       : super(key: key);
//
//   final List<dynamic>? collections;
//   final ScrollController? controller;
//
//   @override
//   State<CollectionTable> createState() => _CollectionTableState();
// }
//
// class _CollectionTableState extends State<CollectionTable> {
//   var rowTabs = [
//     'Collections',
//     'Tokens',
//     'Listed',
//     'Total Vol',
//     '24 Hrs Vol',
//     'Floor Price',
//   ];
//
//   navigateToNextScreen(dynamic collections) {
//     Size size = MediaQuery.of(context).size; //check the size of device
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => DeGodsCollection(
//                   args: Args(
//                 isDarkMode: false,
//                 collectionName: collections['name'],
//                 description: collections['description'],
//                 collectionId: "solarians-1234",
//                 collectionProfileImg: "assets/images/solarians.png",
//                 size: size,
//                 collectionImg: checkImage(collections['thumbnail'])
//                     ? collections['thumbnail']
//                     : '$IMAGE_KIT_ENDPOINT_URL${collections['thumbnail']}',
//                 verified: collections['verifeyed'],
//                 floorPrice: collections['floorPrice'],
//                 volume24hrs: collections['volumePast24h'],
//                 totalVol: collections['volumeTotal'],
//               ))),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: DataTable2(
//         scrollController: widget.controller,
//         columnSpacing: 1,
//         horizontalMargin: 12,
//         minWidth: 900,
//         fixedLeftColumns: 1,
//         showCheckboxColumn: false,
//
//         columns: rowTabs
//             .map((e) => DataColumn2(
//                   label: Text(
//                     e,
//                     style: textStyleSmall.copyWith(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 0.5,
//                       color: lemonColor,
//                     ),
//                   ),
//                   size: ColumnSize.L,
//                 ))
//             .toList(),
//
//         rows: widget.collections!
//             .map((e) => DataRow2(
//                     onTap: () {
//                       navigateToNextScreen(e);
//                     },
//                     cells: [
//                       DataCell(
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 10.0,
//                               ),
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: NetworkImage(checkImage(
//                                             e['thumbnail'])
//                                         ? e['thumbnail']
//                                         : '$IMAGE_KIT_ENDPOINT_URL${e['thumbnail']}'),
//                                   ),
//                                 ),
//                                 child: Text(''),
//                               ),
//                             ),
//                             Container(
//                               width: 90,
//                               child: Text(
//                                 e['name'],
//                                 style: textStyleSmall.copyWith(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 13,
//                                     overflow: TextOverflow.ellipsis),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       DataCell(
//                         Text(
//                           '10,100',
//                           style: textStyleSmall.copyWith(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                       ),
//                       DataCell(
//                         Text(
//                           '142',
//                           style: textStyleSmall.copyWith(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                       ),
//                       DataCell(
//                         Row(
//                           children: [
//                             Text(
//                               e['volumePast24h'].toString(),
//                               style: textStyleSmall.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   overflow: TextOverflow.ellipsis),
//                             ),
//                             kSmallestWidth,
//                             Image.asset(
//                               "assets/images/solana-sol-logo 1.png",
//                             ),
//                           ],
//                         ),
//                       ),
//                       DataCell(
//                         Row(
//                           children: [
//                             Text(
//                               (e['volumePast24h'] / 10000000000)
//                                   .ceilToDouble()
//                                   .toString(),
//                               style: textStyleSmall.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   overflow: TextOverflow.ellipsis),
//                             ),
//                             kSmallestWidth,
//                             Image.asset(
//                               "assets/images/solana-sol-logo 1.png",
//                             ),
//                           ],
//                         ),
//                       ),
//                       DataCell(
//                         Text(
//                           e['floorPrice'].toString() ?? '',
//                           style: textStyleSmall.copyWith(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                       ),
//                     ]))
//             .toList(),
//         // rows: List<DataRow>.generate(
//         //     100,
//         //     (index) => DataRow(cells: [
//         //           DataCell(Text(
//         //             'A' * (10 - index % 10),
//         //             style: TextStyle(color: whiteColor),
//         //           )),
//         //           DataCell(Text(
//         //             'B' * (10 - (index + 5) % 10),
//         //             style: TextStyle(color: whiteColor),
//         //           )),
//         //           DataCell(Text(
//         //             'C' * (15 - (index + 5) % 10),
//         //             style: TextStyle(color: whiteColor),
//         //           )),
//         //           DataCell(Text(
//         //             'D' * (15 - (index + 10) % 10),
//         //             style: TextStyle(color: whiteColor),
//         //           )),
//         //           DataCell(Text(
//         //             ((index + 0.1) * 25.4).toString(),
//         //             style: TextStyle(color: whiteColor),
//         //           ))
//         //         ]))
//       ),
//     );
//   }
// }

class CollectionTable extends StatefulWidget {
  const CollectionTable({Key? key, this.collections, this.controller})
      : super(key: key);

  final List<dynamic>? collections;
  final ScrollController? controller;
  @override
  State<CollectionTable> createState() => _CollectionTableState();
}

class _CollectionTableState extends State<CollectionTable> {
  @override
  void initState() {
    // widget.user.initData(3000);
    super.initState();
  }

  navigateToNextScreen(dynamic collections) {
    Size size = MediaQuery.of(context).size; //check the size of device

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DeGodsCollection(
                  args: Args(
                isDarkMode: false,
                collectionName: collections['name'],
                description: collections['description'],
                collectionId: "solarians-1234",
                collectionProfileImg: "assets/images/solarians.png",
                size: size,
                collectionImg: checkImage(collections['thumbnail'])
                    ? collections['thumbnail']
                    : '$IMAGE_KIT_ENDPOINT_URL${collections['thumbnail']}',
                verified: collections['verifeyed'],
                floorPrice: collections['floorPrice'],
                volume24hrs: collections['volumePast24h'],
                totalVol: collections['volumeTotal'],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HorizontalDataTable(
          onScrollControllerReady: (ScrollController h, ScrollController v) {
            print('controller: $h');
            print('maincontroller: $v');
          },
          leftHandSideColumnWidth: 250,
          rightHandSideColumnWidth: 600,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          // isFixedHeader: true,
          // footerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: widget.collections!.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black38,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: Colors.transparent,
          rightHandSideColBackgroundColor: Colors.transparent
          // itemExtent: 55,
          ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Collections', 300),
      _getTitleItemWidget('Tokens', 100),
      _getTitleItemWidget('Listed', 100),
      _getTitleItemWidget('Total Vol', 100),
      _getTitleItemWidget('24 Hrs Vol', 100),
      _getTitleItemWidget('Floor Price', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: textStyleSmall.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: lemonColor,
        ),
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 300,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(checkImage(
                          widget.collections![index]['thumbnail'])
                      ? widget.collections![index]['thumbnail']
                      : '$IMAGE_KIT_ENDPOINT_URL${widget.collections![index]['thumbnail']}'),
                ),
              ),
              child: Text(''),
            ),
          ),
          Container(
            width: 170,
            child: Text(
              widget.collections![index]['name'],
              style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            '10,100',
            style: textStyleSmall.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Container(
          width: 100,
          child: Text(
            '142',
            style: textStyleSmall.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                widget.collections![index]['volumePast24h'].toString(),
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
          ),
        ),
        Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  (widget.collections![index]['volumePast24h'] / 10000000000)
                      .ceilToDouble()
                      .toString(),
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
            )),
        Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.collections![index]['floorPrice'].toString() ?? '',
              style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            )),
      ],
    );
  }
}
