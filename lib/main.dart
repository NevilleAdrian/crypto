import 'package:de_marketplace/core/providers/app_provider/app_provider.dart';
import 'package:de_marketplace/shared/utils/themedata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'core/app_navigation/app_navigator.dart';
import 'core/app_navigation/app_router.dart';
import 'core/dependencies/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initHiveForFlutter();
  registerDependencies();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    // _handleIncomingLinks(context);
    initDynamicLink(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: AppNavigator.key,
            debugShowCheckedModeBanner: false,
            title: 'kyzzen',
            onGenerateRoute: AppRouter.generateRoutes,
            theme: myThemeData(context),
          );
        },
      ),
    );
  }
}

// void _handleIncomingLinks(context) async {
//   // final provider = Provider.of<WalletStateProvider>(context, listen: false);
//   try {
//     uriLinkStream.listen((Uri? link) {
//       // if (!mounted) return;
//       Map<String, String> params = link?.queryParameters ?? {};
//       print("Params: $params");
//       print("Params: ${link.toString()}");
//       // if (params.containsKey("errorCode")) {
//       //   // _showSnackBar(context,
//       //   //     params["errorMessage"] ?? "Error connecting wallet", "error");
//       //   // logger.e(params["errorMessage"]);
//       // }
//       // else {
//       //   switch (link?.path) {
//       //     case '/connected':
//       //       if (phantomConnectInstance.createSession(params)) {
//       //         provider.updateConnection(true);
//       //         _showSnackBar(context, "Connected to Wallet", "success");
//       //       } else {
//       //         _showSnackBar(context, "Error connecting to Wallet", "error");
//       //       }
//       //       break;
//       //     case '/disconnect':
//       //       setState(() {
//       //         provider.updateConnection(false);
//       //       });
//       //       _showSnackBar(context, "Wallet Disconnected", "success");
//       //       break;
//       //     case '/signAndSendTransaction':
//       //       var data = phantomConnectInstance.decryptPayload(
//       //           data: params["data"]!, nonce: params["nonce"]!);
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (context) => TransactionStatus(
//       //             signature: data['signature'],
//       //           ),
//       //         ),
//       //       );
//       //       break;
//       //     case '/signTransaction':
//       //       var data = phantomConnectInstance.decryptPayload(
//       //           data: params["data"]!, nonce: params["nonce"]!);
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (context) => SendTxScreen(
//       //             transaction: data["transaction"],
//       //           ),
//       //         ),
//       //       );
//       //       break;
//       //     case '/onSignMessage':
//       //       var data = phantomConnectInstance.decryptPayload(
//       //           data: params["data"]!, nonce: params["nonce"]!);
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (context) => SignatureVerifyScreen(
//       //             signature: data['signature'],
//       //             phantomConnectInstance: phantomConnectInstance,
//       //           ),
//       //         ),
//       //       );
//       //       break;
//       //     default:
//       //       logger.i('unknown');
//       //       _showSnackBar(context, "Unknown Redirect", "error");
//       //   }
//       // }
//     }, onError: (err) {
//       print('OnError Error: $err');
//     });
//   } on PlatformException {
//     // Handle exception by warning the user their action did not succeed
//     print("Error occured PlatfotmException");
//     return;
//   }
// }

void initDynamicLink(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink.listen((event) {
    final Uri deepLink = event.link;
    Map<String, String> params = event.link.queryParameters ?? {};

    print('params: ${deepLink.data}');
    print('deeplinkUrl: ${event.link}');

    if (deepLink != null) {
      print('deeplinkUrl: ${deepLink.toString()}');
      if (deepLink.toString() == 'http://phantomconnect.io/connected') {
        AppNavigator.pushNamed('/profile');
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const Dashboard(
        //               index: 3,
        //             )));
      }
    }
  }).onError((error) {
    print('onLink error');
    print(error.message);
  });

  final PendingDynamicLinkData? data =
      await FirebaseDynamicLinks.instance.getInitialLink();
  final Uri deepLink = data!.link;

  print('deepLink: $deepLink');
}
