import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/backdropfilter.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/banner.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/clip.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/colorfiltered.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/custompaint.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/decoratedbox.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/fractionaltranslation.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/inkwell.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/opacity.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/physicalmodel.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/rotatedbox.dart';
import 'package:flutter_dojo/category/widgets/paintingeffect/shadermask.dart';
import 'package:flutter_dojo/category/widgets/singlechildlayout/transform.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildPaintingEffectDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.format_paint,
      title: 'BackdropFilter',
      subtitle:
          'A widget that applies a filter to the existing painted content and then paints child. This effect is relatively expensive, especially if the filter is non-local, such as a blur.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html',
      buildRoute: (context) => BaseWidget('BackdropFilter', codePath + 'backdropfilter', BackdropFilterWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'Banner',
      subtitle: 'Displays a diagonal message above the corner of another widget.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Banner-class.html',
      buildRoute: (context) => BaseWidget('Banner', codePath + 'banner', BannerWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'ColorFiltered',
      subtitle: 'ColorFiltered',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ColorFiltered-class.html',
      buildRoute: (context) => BaseWidget('ColorFiltered', codePath + 'colorfiltered', ColorFilteredWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'ClipOval',
      subtitle: 'A widget that clips its child using an oval.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ClipOval-class.html',
      buildRoute: (context) => BaseWidget('ClipOval', codePath + 'clip', ClipWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'ClipPath',
      subtitle: 'A widget that clips its child using a path.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ClipPath-class.html',
      buildRoute: (context) => BaseWidget('ClipPath', codePath + 'clip', ClipWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'ClipRect',
      subtitle: 'A widget that clips its child using a rectangle.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ClipRect-class.html',
      buildRoute: (context) => BaseWidget('ClipRect', codePath + 'clip', ClipWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'CustomPaint',
      subtitle: 'A widget that provides a canvas on which to draw during the paint phase.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CustomPaint-class.html',
      buildRoute: (context) => BaseWidget('CustomPaint', codePath + 'custompaint', CustomPaintWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'DecoratedBox',
      subtitle: 'A widget that paints a Decoration either before or after its child paints.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html',
      buildRoute: (context) => BaseWidget('DecoratedBox', codePath + 'decoratedbox', DecoratedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'FractionalTranslation',
      subtitle:
          '''A widget that applies a translation expressed as a fraction of the box's size before painting its child.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html',
      buildRoute: (context) =>
          BaseWidget('FractionalTranslation', codePath + 'fractionaltranslation', FractionalTranslationWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'InkWell',
      subtitle: 'A rectangular area of a Material that responds to touch.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/InkWell-class.html',
      buildRoute: (context) => BaseWidget('InkWell', codePath + 'inkwell', InkWellWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'Opacity',
      subtitle: 'A widget that makes its child partially transparent.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Opacity-class.html',
      buildRoute: (context) => BaseWidget('Opacity', codePath + 'opacity', OpacityWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'PhysicalModel',
      subtitle: 'A widget representing a physical layer that clips its children to a shape.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/PhysicalModel-class.html',
      buildRoute: (context) => BaseWidget('PhysicalModel', codePath + 'physicalmodel', PhysicalModelWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'RotatedBox',
      subtitle: 'A widget that rotates its child by a integral number of quarter turns.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RotatedBox-class.html',
      buildRoute: (context) => BaseWidget('RotatedBox', codePath + 'rotatedbox', RotatedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'ShaderMask',
      subtitle: 'ShaderMask',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ShaderMask-class.html',
      buildRoute: (context) => BaseWidget('ShaderMask', codePath + 'shadermask', ShaderMaskWidget()),
    ),
    DemoItem(
      icon: Icons.format_paint,
      title: 'Transform',
      subtitle: 'A widget that applies a transformation before painting its child.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Transform-class.html',
      buildRoute: (context) =>
          BaseWidget('Transform', 'lib/category/widgets/singlechildlayout/transform', TransformWidget()),
    ),
  ];
}
