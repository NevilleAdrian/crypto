import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';

class LiveDomainPage extends StatelessWidget {
  const LiveDomainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                ),
                image: DecorationImage(image: AssetImage("assets/images/image 136.png"),
                fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/Horse.png'),
                      SizedBox(height: 7,),
                      Text('CZnNK...ToE',
                      style: textStyleBig.copyWith(
                        color: babyBlue,
                        fontSize: 13,
                        letterSpacing: 0.5,

                      ),),
                      SizedBox(height: 20,),
                      Text('Current Price:',
                        style: textStyleBig.copyWith(
                          fontSize: 15,
                          letterSpacing: 0.5,
                        ),),
                      SizedBox(height: 2,),
                      Row(
                        children: [
                          Image.asset('assets/images/k 5 1 (2).png'),
                          SizedBox(width: 5,),
                          Text('373.3333',
                            style: textStyleBig.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text('Time Left',
                        style: textStyleBig.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ).copyWith(left: 0),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: appColor,
                              ),
                            ),
                            child: Center(
                              child: Text('29',
                                style: textStyleBig.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(':',
                            style: textStyleBig.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: appColor,
                              ),
                            ),
                            child: Center(
                              child: Text('7',
                                style: textStyleBig.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(':',
                            style: textStyleBig.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: appColor,
                              ),
                            ),
                            child: Center(
                              child: Text('8',
                                style: textStyleBig.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(':',
                            style: textStyleBig.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: appColor,
                              ),
                            ),
                            child: Center(
                              child: Text('21',
                                style: textStyleBig.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
