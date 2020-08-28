import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/layout/divider.dart';
import 'package:flutter_dojo/category/widgets/layout/expansiontile.dart';
import 'package:flutter_dojo/category/widgets/layout/listtile.dart';
import 'package:flutter_dojo/category/widgets/layout/orientationbuilder.dart';
import 'package:flutter_dojo/category/widgets/layout/sizechangedlayoutnotifier.dart';
import 'package:flutter_dojo/category/widgets/layout/stepper.dart';
import 'package:flutter_dojo/category/widgets/layout/verticaldivider.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildLayoutDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.layers,
      title: 'Divider',
      subtitle: 'A thin horizontal line, with padding on either side.',
      keyword: 'Divider',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Divider-class.html',
      buildRoute: (context) => BaseWidget('Divider', codePath + 'divider', DividerWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'ExpansionTile',
      subtitle: 'A single-line [ListTile] with a trailing button that expands or collapses the tile to reveal or hide the [children].',
      keyword: 'ExpansionTile',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ExpansionTile-class.html',
      buildRoute: (context) => BaseWidget('ExpansionTile', codePath + 'expansiontile', ExpansionTileWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'ListTile',
      subtitle: 'A single fixed-height row that typically contains some text as well as a leading or trailing icon.',
      keyword: 'ListTile AboutListTile',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ListTile-class.html',
      buildRoute: (context) => BaseWidget('ListTile', codePath + 'listtile', ListTileWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'OrientationBuilder',
      subtitle: '''Builds a widget tree that can depend on the parent widget's orientation (distinct from the device orientation).''',
      keyword: 'OrientationBuilder',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/OrientationBuilder-class.html',
      buildRoute: (context) => BaseWidget('OrientationBuilder', codePath + 'orientationbuilder', OrientationBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'SizeChangedLayoutNotifier',
      subtitle: 'A widget that automatically dispatches a [SizeChangedLayoutNotification] when the layout dimensions of its child change.',
      keyword: 'SizeChangedLayoutNotifier',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/OrientationBuilder-class.html',
      buildRoute: (context) => BaseWidget('SizeChangedLayoutNotifier', codePath + 'sizechangedlayoutnotifier', SizeChangedLayoutNotifierWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'Stepper',
      subtitle: 'A Material Design stepper widget that displays progress through a sequence of steps.',
      keyword: 'Stepper',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Stepper-class.html',
      buildRoute: (context) => BaseWidget('Stepper', codePath + 'stepper', StepperWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'VerticalDivider',
      subtitle: 'A one device pixel thick vertical line, with padding on either side.',
      keyword: 'VerticalDivider',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/VerticalDivider-class.html',
      buildRoute: (context) => BaseWidget('VerticalDivider', codePath + 'verticaldivider', VerticalDividerWidget()),
    ),
  ];
}
