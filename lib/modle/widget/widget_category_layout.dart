import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/layout/divider.dart';
import 'package:flutter_dojo/widgets/layout/expansiontile.dart';
import 'package:flutter_dojo/widgets/layout/listtile.dart';
import 'package:flutter_dojo/widgets/layout/stepper.dart';
import 'package:flutter_dojo/widgets/layout/verticaldivider.dart';

List<DemoItem> buildLayoutDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.layers,
      title: 'Divider',
      subtitle: 'A one logical pixel thick horizontal line, with padding on either side.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Divider-class.html',
      buildRoute: (context) => BaseWidget('Divider', codePath, DividerWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'ExpansionTile',
      subtitle: 'ExpansionTile',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ExpansionTile-class.html',
      buildRoute: (context) => BaseWidget('ExpansionTile', codePath, ExpansionTileWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'ListTile',
      subtitle: 'A single fixed-height row that typically contains some text as well as a leading or trailing icon.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ListTile-class.html',
      buildRoute: (context) => BaseWidget('ListTile', codePath, ListTileWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'Stepper',
      subtitle: 'A Material Design stepper widget that displays progress through a sequence of steps.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Stepper-class.html',
      buildRoute: (context) => BaseWidget('Stepper', codePath, StepperWidget()),
    ),
    DemoItem(
      icon: Icons.layers,
      title: 'VerticalDivider',
      subtitle: 'A one device pixel thick vertical line, with padding on either side.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/VerticalDivider-class.html',
      buildRoute: (context) => BaseWidget('VerticalDivider', codePath, VerticalDividerWidget()),
    ),
  ];
}
