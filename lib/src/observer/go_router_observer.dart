import 'package:flutter/material.dart';
import 'package:hbologger/hbologger.dart';

import 'package:hbologger/src/log_level_enum.dart';

class LoggingNavigatorObserver extends NavigatorObserver {
  final Logging loggerChain;

  LoggingNavigatorObserver()
      : loggerChain = DebugLogger()
          ..setNextLogger(InfoLogger())
          ..setNextLogger(ErrorLogger());

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    loggerChain.logMessage(
      'Pushed route: ${route.settings.name ?? route.settings}',
      LogLevel.INFO,
    );
    if (previousRoute != null) {
      loggerChain.logMessage(
        'Previous route: ${previousRoute.settings.name ?? previousRoute.settings}',
        LogLevel.DEBUG,
      );
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    loggerChain.logMessage(
      'Popped route: ${route.settings.name ?? route.settings}',
      LogLevel.INFO,
    );
    if (previousRoute != null) {
      loggerChain.logMessage(
        'Previous route: ${previousRoute.settings.name ?? previousRoute.settings}',
        LogLevel.DEBUG,
      );
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    loggerChain.logMessage(
      'Removed route: ${route.settings.name ?? route.settings}',
      LogLevel.INFO,
    );
    if (previousRoute != null) {
      loggerChain.logMessage(
        'Previous route: ${previousRoute.settings.name ?? previousRoute.settings}',
        LogLevel.DEBUG,
      );
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    loggerChain.logMessage(
      'Replaced route: ${oldRoute?.settings.name ?? oldRoute?.settings} with ${newRoute?.settings.name ?? newRoute?.settings}',
      LogLevel.INFO,
    );
  }
}
