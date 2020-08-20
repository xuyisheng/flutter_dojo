import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/async/futurebuilder.dart';
import 'package:flutter_dojo/category/widgets/async/inheritedmodel.dart';
import 'package:flutter_dojo/category/widgets/async/inheritedwidget.dart';
import 'package:flutter_dojo/category/widgets/async/streambuilder.dart';
import 'package:flutter_dojo/category/widgets/async/valuelistenablebuilder.dart';
import 'package:flutter_dojo/category/widgets/async/valuenotifier.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildAsyncDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.network_wifi,
      title: 'FutureBuilder',
      subtitle: 'Widget that builds itself based on the latest snapshot of interaction with a Future.',
      keyword: 'FutureBuilder',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html',
      buildRoute: (context) => BaseWidget('FutureBuilder', codePath + 'futurebuilder', FutureBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'InheritedModel',
      subtitle:
          '''An [InheritedWidget] that's intended to be used as the base class for models whose dependents may only depend on one part or \"aspect\" of the overall model.''',
      keyword: 'InheritedModel',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/InheritedModel-class.html',
      buildRoute: (context) => BaseWidget('InheritedModel', codePath + 'inheritedmodel', InheritedModelWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'InheritedWidget',
      subtitle: 'Base class for widgets that efficiently propagate information down the tree.',
      keyword: 'InheritedWidget',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html',
      buildRoute: (context) => BaseWidget('InheritedWidget', codePath + 'inheritedwidget', InheritedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'StreamBuilder',
      subtitle: 'Widget that builds itself based on the latest snapshot of interaction with a Stream.',
      keyword: 'StreamBuilder',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html',
      buildRoute: (context) => BaseWidget('StreamBuilder', codePath + 'streambuilder', StreamBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'ValueListenableBuilder',
      subtitle: 'A widget whose content stays synced with a [ValueListenable].',
      keyword: 'ValueListenableBuilder',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html',
      buildRoute: (context) => BaseWidget('ValueListenableBuilder', codePath + 'valuelistenablebuilder', ValueListenableBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.network_wifi,
      title: 'ValueNotifier',
      subtitle: 'ValueNotifier',
      keyword: 'ValueNotifier',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ValueNotifier-class.html',
      buildRoute: (context) => BaseWidget('ValueNotifier', codePath + 'valuenotifier', ValueNotifierWidget()),
    ),
  ];
}
