import 'package:flutter/material.dart';

import 'package:hbologger/src/used_plugin.dart';

class LoggingNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    logger.i('Pushed route: ${route.settings.name ?? route.settings}');
    if (previousRoute != null) {
      logger.d('Previous route: ${previousRoute.settings.name ?? previousRoute.settings}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    logger.i('Popped route: ${route.settings.name ?? route.settings}');
    if (previousRoute != null) {
      logger.d('Previous route: ${previousRoute.settings.name ?? previousRoute.settings}');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    logger.i('Removed route: ${route.settings.name ?? route.settings}');
    if (previousRoute != null) {
      logger.d('Previous route: ${previousRoute.settings.name ?? previousRoute.settings}');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    logger.i(
        'Replaced route: ${oldRoute?.settings.name ?? oldRoute?.settings} with ${newRoute?.settings.name ?? newRoute?.settings}');
  }
}
