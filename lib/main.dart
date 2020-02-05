import 'package:flutter/material.dart';
import 'package:flutter_dojo/pages/main/navigatormanager.dart';
import 'package:flutter_dojo/pages/notfound/notfound.dart';
import 'package:flutter_dojo/pages/splash/slpash.dart';

import 'backend/pageroute.dart';

void main() => runApp(MyApp());

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
    return Scaffold(
      body: SplashPage(),
    );
  }
}
