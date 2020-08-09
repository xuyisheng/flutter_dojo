import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/singlechildlayout/padding.dart';
import 'package:flutter_dojo/category/widgets/styling/flexible.dart';
import 'package:flutter_dojo/category/widgets/styling/material.dart';
import 'package:flutter_dojo/category/widgets/styling/materialslice.dart';
import 'package:flutter_dojo/category/widgets/styling/mediaquery.dart';
import 'package:flutter_dojo/category/widgets/styling/spacer.dart';
import 'package:flutter_dojo/category/widgets/styling/theme.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildStylingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.style,
      title: 'Flexible',
      subtitle: 'Flexible',
      keyword: 'Flexible',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Flexible-class.html',
      buildRoute: (context) => BaseWidget('Flexible', codePath + 'flexible', FlexibleWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'MediaQuery',
      subtitle: 'Establishes a subtree in which media queries resolve to the given data.',
      keyword: 'MediaQuery',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/MediaQuery-class.html',
      buildRoute: (context) => BaseWidget('MediaQuery', codePath + 'mediaquery', MediaQueryWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Material',
      subtitle: 'Material',
      keyword: 'Material',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Material-class.html',
      buildRoute: (context) => BaseWidget('Material', codePath + 'material', MaterialWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'MaterialSlice',
      subtitle: 'MaterialSlice',
      keyword: 'MaterialSlice',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/MaterialSlice-class.html',
      buildRoute: (context) => BaseWidget('MaterialSlice', codePath + 'materialslice', MaterialSliceWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Padding',
      subtitle: 'A widget that insets its child by the given padding.',
      keyword: 'Padding',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Padding-class.html',
      buildRoute: (context) => BaseWidget('Padding', 'lib/category/widgets/singlechildlayout/padding', PaddingWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Spacer',
      subtitle: 'Spacer',
      keyword: 'Spacer',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Spacer-class.html',
      buildRoute: (context) => BaseWidget('Spacer', codePath + 'spacer', SpacerWidget()),
    ),
    DemoItem(
      icon: Icons.style,
      title: 'Theme',
      subtitle:
          'Applies a theme to descendant widgets. A theme describes the colors and typographic choices of an application.',
      keyword: 'Theme',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Theme-class.html',
      buildRoute: (context) => BaseWidget('Theme', codePath + 'theme', ThemeWidget()),
    ),
  ];
}
