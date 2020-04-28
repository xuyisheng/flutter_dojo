import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/pages/main/navigatormanager.dart';
import 'package:flutter_dojo/pages/notfound/notfound.dart';
import 'package:flutter_dojo/pages/splash/slpash.dart';

import 'category/backend/pageroute.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 在组件渲染之后，再覆写状态栏颜色
    // 如果使用了APPBar，则需要修改brightness属性
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

SystemUiOverlayStyle setNavigationBarTextColor(bool light) {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: null,
    statusBarIconBrightness: light ? Brightness.light : Brightness.dark,
    statusBarBrightness: light ? Brightness.dark : Brightness.light,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dojo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewHome(),
      routes: <String, WidgetBuilder>{
        '/page2': (context) => Page2('静态Value'),
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) => NotFoundWidget());
      },
      navigatorKey: RouteManager.navigatorKey,
      navigatorObservers: [NavigatorManager.getInstance()],
    );
  }
}

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: setNavigationBarTextColor(true),
      child: Scaffold(
        body: SplashPage(),
      ),
    );
  }
}
