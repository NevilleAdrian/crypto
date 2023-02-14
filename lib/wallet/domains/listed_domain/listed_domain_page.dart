import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:de_marketplace/wallet/domains/listed_domain/listed_domain_card.dart';

import 'package:de_marketplace/wallet/wallet_collections.dart';
import 'package:flutter/material.dart';

class ListedDomainPage extends StatelessWidget {
  const ListedDomainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
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
                          child: Icon(Icons.arrow_back_ios,
                            color: Colors.white,
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10),
                child: Row(
                  children: [
                      Text('Listed Domain',
                        style: textStyleBig.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: appColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                          color: Colors.grey,
                          size: 15,),
                        SizedBox(width: 5,),
                        Text("Search Domains By Name",
                          style: textStyleBig.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 0.5,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 10,

                  ),
                  itemCount: walletproduct.length,
                  itemBuilder: (context, index) => ListedDomainCard(
                    walletproduct: walletproduct[index],

                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}


