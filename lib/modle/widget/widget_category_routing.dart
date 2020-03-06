import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/animationmotion/hero.dart';
import 'package:flutter_dojo/widgets/routing/navigator.dart';

List<DemoItem> buildRoutingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.router,
      title: 'Hero',
      subtitle: 'A widget that marks its child as being a candidate for hero animations.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Hero-class.html',
      buildRoute: (context) => BaseWidget('Hero', codePath, HeroWidget()),
    ),
    DemoItem(
      icon: Icons.router,
      title: 'Navigator',
      subtitle: 'A widget that manages a set of child widgets with a stack discipline.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Navigator-class.html',
      buildRoute: (context) => BaseWidget('Navigator', codePath, NavigatorWidget()),
    )
  ];
}
