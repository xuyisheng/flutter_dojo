import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorManager extends NavigatorObserver {
  static NavigatorManager navigatorManager;

  List<Route> routeList = List();
  StreamController _streamController;

  List<Route> get routes => routeList;

  Route get currentRoute => routeList[routeList.length - 1];

  StreamController get streamController => _streamController;

  static NavigatorManager getInstance() {
    if (navigatorManager == null) {
      navigatorManager = NavigatorManager();
      navigatorManager._streamController = StreamController.broadcast();
    }
    return navigatorManager;
  }

  pushReplacementNamed(String routeName, WidgetBuilder builder) {
    return navigator.pushReplacement(
      MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  push(String routeName, WidgetBuilder builder) {
    return navigator.push(
      MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  pushNamed(String routeName, WidgetBuilder builder) {
    return navigator.push(
      MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  pop<T extends Object>([T result]) {
    navigator.pop(result);
  }

  pushNamedAndRemoveUntil(String newRouteName) {
    return navigator.pushNamedAndRemoveUntil(newRouteName, (Route<dynamic> route) => false);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('didPush ${route.settings.name}');
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      routeList.add(route);
      updateObserver();
    }
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace();
    debugPrint('didReplace ${newRoute.settings.name}');
    if (newRoute is CupertinoPageRoute || newRoute is MaterialPageRoute) {
      routeList.remove(oldRoute);
      routeList.add(newRoute);
      updateObserver();
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('didPop ${route.settings.name}');
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      routeList.remove(route);
      updateObserver();
    }
  }

  @override
  void didRemove(Route removedRoute, Route oldRoute) {
    super.didRemove(removedRoute, oldRoute);
    debugPrint('didRemove ${removedRoute.settings.name}');
    if (removedRoute is CupertinoPageRoute || removedRoute is MaterialPageRoute) {
      routeList.remove(removedRoute);
      updateObserver();
    }
  }

  void updateObserver() {
    streamController.sink.add(routeList);
  }
}

class RouteManager {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get instance => navigatorKey.currentState;
}
