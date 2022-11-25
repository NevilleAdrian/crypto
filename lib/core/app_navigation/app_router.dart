import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/views/details_page.dart';
import '../../features/dashboard/presentation/views/home.dart';
import 'app_route.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return getPageRoute(
          settings: settings,
          view: const Dashboard(),
        );
      case '/profile':
        return getPageRoute(
          settings: settings,
          view: const Dashboard(
            index: 3,
          ),
        );

      case collectionsViewRoute:
        return getPageRoute(
          settings: settings,
          view: const ListingPage(),
        );

      // case detailsViewRoute:
      //   return getPageRoute(
      //     settings: settings,
      //     view: const DetailsPage(),
      //   );

      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
