import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/dashboard/data/models/args.dart';
import 'package:de_marketplace/features/dashboard/presentation/views/collections_page.dart';
import 'package:de_marketplace/features/profile/presenation/views/profile_page.dart';
import 'package:de_marketplace/main.dart';
import 'package:de_marketplace/shared/collections/collections.dart';
import 'package:de_marketplace/shared/collections/collections_card.dart';
import 'package:de_marketplace/shared/collections/deGods_collection.dart';
import 'package:de_marketplace/shared/collections/sales_card.dart';
import 'package:de_marketplace/shared/ui_widgets/future_helper.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/constants.dart';
import 'package:de_marketplace/shared/utils/functions.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/shared/widgets/homePage/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:de_marketplace/shared/widgets/homePage/category.dart';


import '../../../../shared/widgets/homePage/collections_verified.dart';

class CollectionExplore extends StatefulWidget {
  const CollectionExplore({Key? key}) : super(key: key);

  @override
  State<CollectionExplore> createState() => _CollectionExploreState();
}

class _CollectionExploreState extends State<CollectionExplore> {
  late Future<dynamic> futureData;
  // List<dynamic>? data;




  Future<dynamic> futureTask() async {
    //Initialize provider
    Auth auth = Auth.authProvider(context);

    //Make call to get videos
    try {
      var result = await auth.getAllCollections();

      setState(() {});

      print('result:$result');

      //Return future value
      return Future.value(result);
    } catch (ex) {}
  }

  // @override
  // void initState() {
  //   futureData = futureTask();
  //
  //   Auth.authProvider(context).setLatestOffset(10);
  //   Auth.authProvider(context).setTrendingOffset(10);
  //   Auth.authProvider(context).setVerifiedOffset(10);
  //   super.initState();
  // }



  @override
  Widget build(BuildContext context) {
    final collection =
        Auth.authProvider(context, listen: true).latestCollections;
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    var collections = Auth.authProvider(context).allCollections;



    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  color: appColor,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10,),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Explore Collections',
                          style: textStyleBig.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: cardColor,
                            ),
                          ),
                          child: Text('Search Collections',
                            style: textStyleSmall,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1.5,
                            color: cardColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Text('Last 1 HR',
                              style: textStyleSmall,
                            ),
                            Spacer(),
                            const Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          height: MediaQuery.of(context).size.height * 1,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: backGroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                ),
                                child: Text('Collections',
                                style: textStyleSmall.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: lemonColor,
                                ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                      style: textStyleSmall.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: appColor),
                                    bottom: BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage('assets/images/deGodsFace.png'),),
                                        ),
                                        child: Text(''),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DeGodsCollection()),);},
                                      child: Text('DeGods',
                                        style: textStyleSmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 10,

                                    ),
                                    height: MediaQuery.of(context).size.height * 1,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      color: backGroundColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0),
                                          child: Text('Tokens',
                                            style: textStyleSmall.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              color: lemonColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,001',
                                          style: textStyleSmall.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('5,000',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,489',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,000',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('7,777',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,000',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('8,589',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,280',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('3,333',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    height: MediaQuery.of(context).size.height * 1,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      color: backGroundColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                          ),
                                          child: Text('Owners',
                                            style: textStyleSmall.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              color: lemonColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('1879',
                                                  style: textStyleSmall.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('1190',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('1100',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('1100',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('1099',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('3112',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('500',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('1789',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('598',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('3310',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('8671',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('3112',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('3189',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('1192',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('1809',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('1132',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 18,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png',),
                                                  SizedBox(width: 3,),
                                                  Text('2111',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/Vector2.png'),
                                                  SizedBox(width: 3,),
                                                  Text('2911',
                                                    style: textStyleSmall.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                    ),),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    height: MediaQuery.of(context).size.height * 1,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      color: backGroundColor,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                          ),
                                          child: Text('Tokens',
                                            style: textStyleSmall.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              color: lemonColor,
                                            ),),
                                        ),
                                        SizedBox(height: 15,),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,001',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('5,000',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,489',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('9,450',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('7,863',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,001',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('10,231',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('9,867',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 30,
                                          ),
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(color: appColor),
                                              bottom: BorderSide.none,
                                            ),
                                          ),
                                          child: Text('4,525',
                                            style: textStyleSmall.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );




    // Row(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.symmetric(
    //         vertical: 12,
    //         horizontal: 12,
    //       ),
    //       height: 40,
    //       width: MediaQuery.of(context).size.width *0.5,
    //       decoration: BoxDecoration(
    //         color: backGroundColor,
    //       ),
    //       child: Text('Collections',
    //         style: textStyleSmall.copyWith(
    //           fontSize: 15,
    //           color: lemonColor,
    //           fontWeight: FontWeight.w500,
    //           letterSpacing: 0.5,
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 45,
    //       width: MediaQuery.of(context).size.width *0.5,
    //       child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         children: [
    //           Row(
    //             children: [
    //               Container(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 12,
    //                   horizontal: 12,
    //                 ),
    //                 height: 40,
    //                 width: MediaQuery.of(context).size.width *0.25,
    //                 decoration: BoxDecoration(
    //                   color: backGroundColor,
    //                 ),
    //                 child: Text('Tokens',
    //                   style: textStyleSmall.copyWith(
    //                     fontSize: 15,
    //                     color: lemonColor,
    //                     fontWeight: FontWeight.w500,
    //                     letterSpacing: 0.5,
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 12,
    //                   horizontal: 12,
    //                 ),
    //                 height: 40,
    //                 width: MediaQuery.of(context).size.width *0.25,
    //                 decoration: BoxDecoration(
    //                   color: backGroundColor,
    //                 ),
    //                 child: Text('Owners',
    //                   style: textStyleSmall.copyWith(
    //                     fontSize: 15,
    //                     color: lemonColor,
    //                     fontWeight: FontWeight.w500,
    //                     letterSpacing: 0.5,
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 12,
    //                   horizontal: 12,
    //                 ),
    //                 height: 40,
    //                 width: MediaQuery.of(context).size.width *0.25,
    //                 decoration: BoxDecoration(
    //                   color: backGroundColor,
    //                 ),
    //                 child: Text('Tokens',
    //                   style: textStyleSmall.copyWith(
    //                     fontSize: 15,
    //                     color: lemonColor,
    //                     fontWeight: FontWeight.w500,
    //                     letterSpacing: 0.5,
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 12,
    //                   horizontal: 12,
    //                 ),
    //                 height: 40,
    //                 width: MediaQuery.of(context).size.width *0.25,
    //                 decoration: BoxDecoration(
    //                   color: backGroundColor,
    //                 ),
    //                 child: Text('Owners',
    //                   style: textStyleSmall.copyWith(
    //                     fontSize: 15,
    //                     color: lemonColor,
    //                     fontWeight: FontWeight.w500,
    //                     letterSpacing: 0.5,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //
    //   ],
    // ),
    // Row(
    // children: [
    // Container(
    // padding: EdgeInsets.symmetric(
    // vertical: 12,
    // horizontal: 12,
    // ),
    // height: 60,
    // width: MediaQuery.of(context).size.width *0.5,
    // decoration: BoxDecoration(
    // color: backGroundColor,
    // ),
    // child: Text('Collections',
    // style: textStyleSmall.copyWith(
    // fontSize: 15,
    // color: lemonColor,
    // fontWeight: FontWeight.w500,
    // letterSpacing: 0.5,
    // ),
    // ),
    // ),
    // Padding(
    // padding: const EdgeInsets.only(bottom: 1.0),
    // child: SizedBox(
    // height: 60,
    // width: MediaQuery.of(context).size.width *0.5,
    // child: ListView(
    // scrollDirection: Axis.horizontal,
    // children: [
    // Row(
    // children: [
    // Container(
    // padding: EdgeInsets.symmetric(
    // vertical: 12,
    // horizontal: 12,
    // ),
    // height: 60,
    // width: MediaQuery.of(context).size.width *0.25,
    // decoration: BoxDecoration(
    // color: backGroundColor,
    // ),
    // child: Text('Tokens',
    // style: textStyleSmall.copyWith(
    // fontSize: 15,
    // color: lemonColor,
    // fontWeight: FontWeight.w500,
    // letterSpacing: 0.5,
    // ),
    // ),
    // ),
    // Container(
    // padding: EdgeInsets.symmetric(
    // vertical: 12,
    // horizontal: 12,
    // ),
    // height: 60,
    // width: MediaQuery.of(context).size.width *0.25,
    // decoration: BoxDecoration(
    // color: backGroundColor,
    // ),
    // child: Text('Tokens',
    // style: textStyleSmall.copyWith(
    // fontSize: 15,
    // color: lemonColor,
    // fontWeight: FontWeight.w500,
    // letterSpacing: 0.5,
    // ),
    // ),
    // ),
    // Container(
    // padding: EdgeInsets.symmetric(
    // vertical: 12,
    // horizontal: 12,
    // ),
    // height: 60,
    // width: MediaQuery.of(context).size.width *0.25,
    // decoration: BoxDecoration(
    // color: backGroundColor,
    // ),
    // child: Text('Tokens',
    // style: textStyleSmall.copyWith(
    // fontSize: 15,
    // color: lemonColor,
    // fontWeight: FontWeight.w500,
    // letterSpacing: 0.5,
    // ),
    // ),
    // ),
    // Container(
    // padding: EdgeInsets.symmetric(
    // vertical: 12,
    // horizontal: 12,
    // ),
    // height: 60,
    // width: MediaQuery.of(context).size.width *0.25,
    // decoration: BoxDecoration(
    // color: backGroundColor,
    // ),
    // child: Text('Tokens',
    // style: textStyleSmall.copyWith(
    // fontSize: 15,
    // color: lemonColor,
    // fontWeight: FontWeight.w500,
    // letterSpacing: 0.5,
    // ),
    // ),
    // ),
    // ],
    // )
    // ],
    // ),
    // ),
    // ),
    //
    // ],
    // ),





    // return Scaffold(
    //   // backgroundColor: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
    //   body: Center(
    //     child: FutureHelper(
    //       task: futureData,
    //       loader: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [circularProgressIndicator(color: defaultFontColor)],
    //       ),
    //       builder: (context, _) => SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             const SizedBox(height: 30),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Container(
    //                   padding: const EdgeInsets.only(left: 10),
    //                   child: Text(
    //                     "Explore All Collections",
    //                     textAlign: TextAlign.center,
    //                     style: GoogleFonts.lato(
    //                       color: isDarkMode ? Colors.white : Colors.black,
    //                       fontSize: size.width * 0.055,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 // Row(
    //                 //   children: [
    //                 //     InkWell(
    //                 //       onTap: () {},
    //                 //       child: Icon(Icons.sort,
    //                 //           color: isDarkMode ? Colors.white : Colors.black,
    //                 //           size: 30),
    //                 //     ),
    //                 //     const SizedBox(width: 10),
    //                 //     InkWell(
    //                 //       onTap: () {},
    //                 //       child: Icon(Icons.filter_alt_outlined,
    //                 //           color: isDarkMode ? Colors.white : Colors.black,
    //                 //           size: 30),
    //                 //     ),
    //                 //     const SizedBox(width: 10),
    //                 //   ],
    //                 // )
    //               ],
    //             ),
    //             const SizedBox(height: 30),
    //             // Container(
    //             //   color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
    //             //   child: GridView.count(
    //             //     childAspectRatio: (1 / 1.35),
    //             //     shrinkWrap: true,
    //             //     physics: const NeverScrollableScrollPhysics(),
    //             //     crossAxisCount: 2,
    //             //     // Generate 100 widgets that display their index in the List.
    //             //     children: List.generate(10, (index) {
    //             //       return buildCollections(
    //             //         'Solarians',
    //             //         0.2,
    //             //         'Ohme Ohmy',
    //             //         'assets/images/avatar1.jpg',
    //             //         'assets/images/solarians-profile.png',
    //             //         isDarkMode ? Colors.white : Colors.black,
    //             //         isDarkMode,
    //             //         size,
    //             //         'slim', // slim or square or wide
    //             //       );
    //             //     }),
    //             //   ),
    //             // ),
    //             Container(
    //               color: isDarkMode ? Colors.black : const Color(0xfff8f8f8),
    //               child: GridView.count(
    //                 childAspectRatio: (1 / 1),
    //                 shrinkWrap: true,
    //                 physics: const NeverScrollableScrollPhysics(),
    //                 crossAxisCount: 2,
    //                 mainAxisSpacing: 30,
    //                 // Generate 100 widgets that display their index in the List.
    //                 children: List.generate(collections.length, (i) {
    //                   return buildCollections(
    //                       collections[i]['name'],
    //                       20.0,
    //                       'Nicole Boa',
    //                       'assets/images/avatar2.jpg',
    //                       collections[i]['thumbnail']
    //                               .contains('firebasestorage')
    //                           ? 'https://ik.imagekit.io/srjnqnjbpn9/thumbnails/solarians.jpeg?ik-sdk-version=react-1.0.11'
    //                           : checkImage(collections[i]['thumbnail'])
    //                               ? collections[i]['thumbnail']
    //                               : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}',
    //                       defaultFontColor,
    //                       isDarkMode,
    //                       size,
    //                       '',
    //                       onTap: () => Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => DetailsPage(
    //                                     args: Args(
    //                                       isDarkMode: isDarkMode,
    //                                       collectionName: collections[i]
    //                                           ['name'],
    //                                       collectionId: "solarians-1234",
    //                                       collectionProfileImg:
    //                                           "assets/images/solarians.png",
    //                                       size: size,
    //                                       collectionImg: checkImage(
    //                                               collections[i]['thumbnail'])
    //                                           ? collections[i]['thumbnail']
    //                                           : '$IMAGE_KIT_ENDPOINT_URL${collections[i]['thumbnail']}',
    //                                     ),
    //                                   ))));
    //                 }),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}




