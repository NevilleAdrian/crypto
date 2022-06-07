import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:de_marketplace/widgets/appbar.dart';
import 'package:de_marketplace/widgets/top_creator_widget.dart';
import 'package:unicons/unicons.dart';
import 'package:de_marketplace/pages/profile_header.dart';
import 'package:de_marketplace/pages/models.dart';

import 'package:flutter/cupertino.dart';
import 'package:de_marketplace/widgets/homePage/collections_nfts.dart';


class DetailsPage extends StatefulWidget {
  final bool isDarkMode;
  final String collectionName;
  final String collectionId;
  final String collectionProfileImg;

  const DetailsPage({
    Key? key,
    required this.isDarkMode,
    required this.collectionName,
    required this.collectionId,
    required this.collectionProfileImg,

  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _CollectionDetailsState();

}


class _CollectionDetailsState extends State<DetailsPage> {
  bool isUseSafeArea = false;

  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Size size = MediaQuery.of(context).size;

//  COLLECTION DATA
//  info
    String collectionDesc = "The First On-Chain Gesnerative NFTs on Solana";

//  numbers
    String price = "2.9";
    String collectionVolumne = "◎83.3K";

//  images
    String collectionBanner = "assets/images/solarians.png";

//  socials
    String collectionTwitter = "https://twitter.com/SolariansNFT";
    String collectionDiscord = "https://twitter.com/SolariansNFT";
    String collectionWebsite = "https://twitter.com/SolariansNFT";

//  others
    bool verifEyed = true;

    List listOfSimpleObjects =
    [
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [1, 2, 3]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": [],
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [],
        "aListOfDoubles": [1.0, 2.0, 3.0]
      },
      {
        "aString": "Blah, blah, blah.",
        "anInt": 1,
        "aDouble": 1.0,
        "aListOfStrings": ["one", "two", "three"],
        "aListOfInts": [1, 2, 3],
        "aListOfDoubles": []
      }
    ];

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final profile = getProfile();


    return


      Scaffold(
        backgroundColor: isDarkMode? Colors.black : const Color(0xfff8f8f8),
        appBar: buildAppBar(
          InkWell(
            onTap: () => {


            },
          ),
          isDarkMode,
          size,
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.7),
          child: const Icon(
              Icons.manage_search,
              color: Colors.white,
          ),
          onPressed: () => {
            _showSheetWithoutList()
          },
        ),

        body:
        SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: size.width,
                child:
                  ProfileHeader(profile),
              ),


              Container(
                color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
                child: GridView.count(
                  childAspectRatio: (1 / 1.7),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(10, (index) {
                    return
                      buildNFT(
                        'Solarians',
                        0.2,
                        'Ohme Ohmy',
                        'assets/images/avatar2.jpg',
                        'assets/collections/solarian.gif',
                        isDarkMode ? Colors.white : Colors.black,
                        isDarkMode,
                        size,
                      )

                    ;
                  }),
                ),
              ),

            ],
          ),
        ),
      );

  }


  void _showSheetWithoutList() {
    showStickyFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: .8,
      headerHeight: 80,
      context: context,
//      isSafeArea: isUseSafeArea,
//      bottomSheetColor: Colors.transparent,
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      headerBuilder: (context, offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(offset == 0.8 ? 0 : 40),
              topRight: Radius.circular(offset == 0.8 ? 0 : 40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Filter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Text(
                'position $offset',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          _children,
        );
      },
      anchors: [.2, 0.5, .8],
    );
  }
}

class _BottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const _BottomSheet({
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: scrollController,
      children: [
        Text(
          'position $bottomSheetOffset',
          style: Theme.of(context).textTheme.headline6,
        ),
        Column(
          children: _children,
        ),
      ],
    );
  }


}

List<Widget> _children = [
  const _TextField(),
  const _TestContainer(color: Color(0xEEFFFF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xDD99FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0xCC00FFFF)),
  const _TextField(),
  const _TestContainer(color: Color(0xBB555555)),
  const _TextField(),
  const _TestContainer(color: Color(0xAAFF5555)),
  const _TextField(),
  const _TestContainer(color: Color(0x9900FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x8800FF00)),
  const _TextField(),
  const _TestContainer(color: Color(0x7700FF00)),
  const _TextField(),
];

class _TextField extends StatelessWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }
}

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}