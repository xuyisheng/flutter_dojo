import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildAccessibilityDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.accessibility,
      title: 'ExcludeSemantics',
      subtitle: 'A widget that drops all the semantics of its descendants.',
      keyword: 'ExcludeSemantics',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ExcludeSemantics-class.html',
      buildRoute: (context) => BaseWidget('ExcludeSemantics', codePath, Container()),
    ),
    DemoItem(
      icon: Icons.accessibility,
      title: 'MergeSemantics',
      subtitle: 'A widget that merges the semantics of its descendants.',
      keyword: 'MergeSemantics',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/MergeSemantics-class.html',
      buildRoute: (context) => BaseWidget('MergeSemantics', codePath, Container()),
    ),
    DemoItem(
      icon: Icons.accessibility,
      title: 'Semantics',
      subtitle: 'A widget that annotates the widget tree with a description of the meaning of the widgets.',
      keyword: 'Semantics',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Semantics-class.html',
      buildRoute: (context) => BaseWidget('Semantics', codePath, Container()),
    )
  ];
}
