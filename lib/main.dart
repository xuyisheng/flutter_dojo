import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/category/backend/providercategory.dart';
import 'package:flutter_dojo/pages/main/navigatormanager.dart';
import 'package:flutter_dojo/pages/notfound/notfound.dart';
import 'package:flutter_dojo/pages/splash/slpash.dart';
import 'package:provider/provider.dart';

import 'category/backend/pageroute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          Provider(create: (_) => 1008),
          ChangeNotifierProvider(create: (_) => ChangeNotifyModel()),
          ValueListenableProvider<ValueNotifyModel>(
            create: (_) => ValueNotifyModelWrapper(ValueNotifyModel(0)),
            updateShouldNotify: (previous, current) => previous.value != current.value,
          ),
          StreamProvider<int>(
            create: (_) => ProviderStream().stream,
            initialData: 0,
          ),
          FutureProvider(create: (_) => providerFuture()),
          ChangeNotifierProvider(create: (_) => SelectorModel()),
        ],
        child: MyApp(),
      ),
    );
  });
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
    if (Platform.isAndroid) {
      // 在组件渲染之后，再覆写状态栏颜色
      // 如果使用了APPBar，则需要修改brightness属性
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
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
