import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/appstructurenavigation/appbar.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/icon.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/image.dart';
import 'package:flutter_dojo/widgets/basic/placeholder.dart';
import 'package:flutter_dojo/widgets/basic/scaffold.dart';
import 'package:flutter_dojo/widgets/buttons/raisedbutton.dart';
import 'package:flutter_dojo/widgets/multichildlayout/column.dart';
import 'package:flutter_dojo/widgets/multichildlayout/row.dart';
import 'package:flutter_dojo/widgets/paintingeffect/flutterlogo.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/container.dart';
import 'package:flutter_dojo/widgets/text/text.dart';

List<DemoItem> buildBasicDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.format_bold,
      title: 'Appbar',
      subtitle:
          'A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.',
      documentationUrl: 'https://api.flutter.dev/flutter/material/AppBar-class.html',
      buildRoute: (context) => BaseWidget('Appbar', codePath, AppbarWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Column',
      subtitle: 'Layout a list of child widgets in the vertical direction.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Column-class.html',
      buildRoute: (context) => BaseWidget('Column', codePath, ColumnWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Container',
      subtitle: 'A convenience widget that combines common painting, positioning, and sizing widgets.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Container-class.html',
      buildRoute: (context) => BaseWidget('Container', codePath, ContainerWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'FlutterLogo',
      subtitle: 'The Flutter logo, in widget form. This widget respects the IconTheme.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FlutterLogo-class.html',
      buildRoute: (context) => BaseWidget('FlutterLogo', codePath, FlutterLogoWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Icon',
      subtitle: 'A Material Design icon.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
      buildRoute: (context) => BaseWidget('Icon', codePath, IconWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Image',
      subtitle: 'A widget that displays an image.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
      buildRoute: (context) => BaseWidget('Image', codePath, ImageWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Placeholder',
      subtitle: 'A widget that draws a box that represents where other widgets will one day be added.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Placeholder-class.html',
      buildRoute: (context) => BaseWidget('Placeholder', codePath, PlaceholderWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'RaisedButton',
      subtitle:
          'A Material Design raised button. A raised button consists of a rectangular piece of material that hovers over the interface.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RaisedButton-class.html',
      buildRoute: (context) => BaseWidget('RaisedButton', codePath, RaisedButtonWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Row',
      subtitle: 'Layout a list of child widgets in the horizontal direction.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Row-class.html',
      buildRoute: (context) => BaseWidget('Row', codePath, RowWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Scaffold',
      subtitle:
          'Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Scaffold-class.html',
      buildRoute: (context) => BaseWidget('Scaffold', codePath, ScaffoldWidget()),
    ),
    DemoItem(
      icon: Icons.format_bold,
      title: 'Text',
      subtitle: 'A run of text with a single style.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
      buildRoute: (context) => BaseWidget('Text', codePath, TextWidget()),
    )
  ];
}
