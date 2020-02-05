import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/padding.dart';
import 'package:flutter_dojo/widgets/styling/flexible.dart';
import 'package:flutter_dojo/widgets/styling/material.dart';
import 'package:flutter_dojo/widgets/styling/materialslice.dart';
import 'package:flutter_dojo/widgets/styling/mediaquery.dart';
import 'package:flutter_dojo/widgets/styling/spacer.dart';
import 'package:flutter_dojo/widgets/styling/theme.dart';

List<DemoItem> buildStylingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.style,
      title: 'Flexible',
      subtitle: 'Flexible',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Flexible-class.html',
      buildRoute: (context) => BaseWidget('Flexible', codePath, FlexibleWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'MediaQuery',
      subtitle: 'Establishes a subtree in which media queries resolve to the given data.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/MediaQuery-class.html',
      buildRoute: (context) => BaseWidget('MediaQuery', codePath, MediaQueryWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Material',
      subtitle: 'Material',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Material-class.html',
      buildRoute: (context) => BaseWidget('Material', codePath, MaterialWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'MaterialSlice',
      subtitle: 'MaterialSlice',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/MaterialSlice-class.html',
      buildRoute: (context) => BaseWidget('MaterialSlice', codePath, MaterialSliceWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Padding',
      subtitle: 'A widget that insets its child by the given padding.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Padding-class.html',
      buildRoute: (context) => BaseWidget('Padding', codePath, PaddingWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Spacer',
      subtitle: 'Spacer',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Spacer-class.html',
      buildRoute: (context) => BaseWidget('Spacer', codePath, SpacerWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Theme',
      subtitle:
          'Applies a theme to descendant widgets. A theme describes the colors and typographic choices of an application.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Theme-class.html',
      buildRoute: (context) => BaseWidget('Theme', codePath, ThemeWidget()),
    ),
  ];
}
