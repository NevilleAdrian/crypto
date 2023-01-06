import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/features/profile/presenation/widgets/search_input.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:de_marketplace/shared/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Auth.authProvider(context).setLatestOffset(10);
    Auth.authProvider(context).setTrendingOffset(10);
    Auth.authProvider(context).setVerifiedOffset(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    Color oppositeFontColor = isDarkMode ? Colors.black : Colors.white;


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: appColor,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10,),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onTap: (){},
                    ),
                    SizedBox(width: 10,),
                    Text('Profile',
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
            kMediumHeight,
            TextButton(
                onPressed: (){},
                child: Text('Connect your wallet',
                style: textStyleSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
                ),
            ),
            kMediumHeight,
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: appColor,
                        width: 4,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/images/NFT phantom 1.png'),
                                radius: 14,
                              ),
                              SizedBox(width: 10,),
                              Text('Phantom',
                              style: textStyleSmall.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: appColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/images/NFT solflare 1.png'),
                                radius: 14,
                              ),
                              SizedBox(width: 10,),
                              Text('Solflare',
                                style: textStyleSmall.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),

    );



















    // return Scaffold(
    //   body: Container(
    //     height: size.height,
    //     width: size.height,
    //     decoration: BoxDecoration(
    //       color: isDarkMode
    //           ? const Color(0xff06090d)
    //           : const Color(0xfff8f8f8), //background color
    //     ),
    //     child: SafeArea(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const SizedBox(
    //               height: 15,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: CustomButton(
    //                       size: size,
    //                       defaultFontColor: defaultFontColor,
    //                       onPressed: () async {
    //                         print('hi');
    //                         await Auth.authProvider(context).getTokenAccounts();
    //                       }),
    //                 ),
    //               ],
    //             ),
    //             SearchInput(),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(right: 10),
    //               child: Row(
    //                 children: [
    //                   CircleAvatar(
    //                     radius: 40,
    //                     backgroundColor: Colors.transparent,
    //                     child: Image.network(
    //                         'https://images.pexels.com/photos/10866644/pexels-photo-10866644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
    //                   ),
    //                   Expanded(
    //                     child: Text(
    //                       'JoyLina Contina',
    //                       style: GoogleFonts.poppins(
    //                         color: defaultFontColor,
    //                         fontSize: size.width * 0.04,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                   Expanded(
    //                     child: Container(
    //                       height: size.height * 0.08,
    //                       decoration: BoxDecoration(
    //                         color: defaultFontColor,
    //                         borderRadius: const BorderRadius.all(
    //                           Radius.circular(20),
    //                         ),
    //                       ),
    //                       child: Align(
    //                         child: Text(
    //                           "Floor :  ◎ 0.02",
    //                           style: GoogleFonts.poppins(
    //                             color: oppositeFontColor,
    //                             fontSize: size.width * 0.04,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           textAlign: TextAlign.center,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //
    //                 //
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 10),
    //               child: GridView.builder(
    //                   gridDelegate:
    //                       const SliverGridDelegateWithFixedCrossAxisCount(
    //                           mainAxisExtent: 500,
    //                           crossAxisCount: 2,
    //                           crossAxisSpacing: 12,
    //                           mainAxisSpacing: 20),
    //                   itemCount: 2,
    //                   shrinkWrap: true,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   itemBuilder: (context, index) {
    //                     return Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             color: isDarkMode
    //                                 ? Colors.white.withOpacity(0.05)
    //                                 : Colors.black,
    //                             borderRadius: const BorderRadius.all(
    //                               Radius.circular(10),
    //                             ),
    //                           ),
    //                           child: ClipRRect(
    //                             borderRadius: const BorderRadius.only(
    //                                 topLeft: Radius.circular(10),
    //                                 topRight: Radius.circular(10)),
    //                             child: Image.network(
    //                               'https://firebasestorage.googleapis.com/v0/b/digitaleyes-prod.appspot.com/o/live%2F2f7dc37db0d641e9a517d68a9be13a6a%2Fthumbnail.png?alt=media',
    //                               fit: BoxFit.fill,
    //                               errorBuilder: (context, error, stackTrace) {
    //                                 return Container(
    //                                   decoration: BoxDecoration(
    //                                     color: isDarkMode
    //                                         ? Colors.white.withOpacity(0.05)
    //                                         : Colors.black,
    //                                     borderRadius: const BorderRadius.all(
    //                                       Radius.circular(0),
    //                                     ),
    //                                   ),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           padding: EdgeInsets.only(top: 15, left: 10),
    //                           height: 60,
    //                           decoration: BoxDecoration(
    //                             color: isDarkMode
    //                                 ? Colors.white.withOpacity(0.05)
    //                                 : Colors.black,
    //                             borderRadius: BorderRadius.only(
    //                               bottomLeft: Radius.circular(10),
    //                               bottomRight: Radius.circular(10),
    //                             ),
    //                           ),
    //                           child: Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text(
    //                                 'JoyLina Catalina',
    //                                 overflow: TextOverflow.ellipsis,
    //                                 maxLines: 2,
    //                                 style: GoogleFonts.poppins(
    //                                   color: isDarkMode
    //                                       ? Colors.white
    //                                       : Colors.black,
    //                                   fontSize: size.width * 0.03,
    //                                   fontWeight: FontWeight.bold,
    //                                 ),
    //                               ),
    //                               Container(
    //                                 decoration: const BoxDecoration(
    //                                   borderRadius: BorderRadius.all(
    //                                     Radius.circular(5),
    //                                   ),
    //                                 ),
    //                                 child: Align(
    //                                   child: Row(
    //                                     children: [
    //                                       Image.asset(
    //                                         'assets/icons/verif.png',
    //                                         width: size.width * 0.04,
    //                                       ),
    //                                       const SizedBox(width: 3),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     );
    //                   }),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.defaultFontColor,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final Color defaultFontColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.075,
        width: size.width * 0.3,
        decoration: const BoxDecoration(
          color: Color(0xff4FBBEB),
          gradient: LinearGradient(
            colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Align(
          child: Auth.authProvider(context, listen: true).loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(defaultFontColor),
                  ),
                )
              : Text(
                  "Connect Wallet",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF122645),
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
