import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/async/futurebuilder.dart';
import 'package:flutter_dojo/widgets/async/inheritedmodel.dart';
import 'package:flutter_dojo/widgets/async/inheritedwidget.dart';
import 'package:flutter_dojo/widgets/async/streambuilder.dart';
import 'package:flutter_dojo/widgets/async/valuelistenablebuilder.dart';
import 'package:flutter_dojo/widgets/async/valuenotifier.dart';

List<DemoItem> buildAsyncDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.network_wifi,
      title: 'FutureBuilder',
      subtitle: 'Widget that builds itself based on the latest snapshot of interaction with a Future.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html',
      buildRoute: (context) => BaseWidget('FutureBuilder', codePath, FutureBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'InheritedModel',
      subtitle: 'InheritedModel',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/InheritedModel-class.html',
      buildRoute: (context) => BaseWidget('InheritedModel', codePath, InheritedModelWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'InheritedWidget',
      subtitle: 'InheritedWidget',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html',
      buildRoute: (context) => BaseWidget('InheritedWidget', codePath, InheritedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'StreamBuilder',
      subtitle: 'Widget that builds itself based on the latest snapshot of interaction with a Stream.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html',
      buildRoute: (context) => BaseWidget('StreamBuilder', codePath, StreamBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'ValueListenableBuilder',
      subtitle: 'ValueListenableBuilder',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html',
      buildRoute: (context) => BaseWidget('ValueListenableBuilder', codePath, ValueListenableBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'ValueNotifier',
      subtitle: 'ValueNotifier',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ValueNotifier-class.html',
      buildRoute: (context) => BaseWidget('ValueNotifier', codePath, ValueNotifierWidget()),
    ),
  ];
}
