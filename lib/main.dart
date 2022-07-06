import 'package:de_marketplace/core/providers/app_provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'core/app_navigation/app_navigator.dart';

import 'core/app_navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/dependencies/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            title: 'Digital Eyes Marketplace',
            onGenerateRoute: AppRouter.generateRoutes,
          );
        },
      ),
    );
  }
}
