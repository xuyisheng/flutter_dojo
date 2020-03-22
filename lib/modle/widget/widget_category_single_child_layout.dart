import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/align.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/aspectratio.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/baseline.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/center.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/circleavatar.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/constrainedbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/container.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/customsinglechildlayout.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/fittedbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/fractionallysizedbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/intrinsicheight.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/intrinsicwidth.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/limitedbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/offstage.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/overflowbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/padding.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/sizedbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/sizedoverflowbox.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/transform.dart';
import 'package:flutter_dojo/widgets/singlechildlayout/unconstrainedbox.dart';

List<DemoItem> buildSingleChildLayoutDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.child_care,
      title: 'Align',
      subtitle:
          '''A widget that aligns its child within itself and optionally sizes itself based on the child's size.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Align-class.html',
      buildRoute: (context) => BaseWidget('Align', codePath, AlignWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'AspectRatio',
      subtitle: 'A widget that attempts to size the child to a specific aspect ratio.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AspectRatio-class.html',
      buildRoute: (context) => BaseWidget('AspectRatio', codePath, AspectRatioWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'Baseline',
      subtitle: '''A widget that positions its child according to the child's baseline.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Baseline-class.html',
      buildRoute: (context) => BaseWidget('Baseline', codePath, BaselineWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'Center',
      subtitle: 'A widget that centers its child within itself.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Center-class.html',
      buildRoute: (context) => BaseWidget('Center', codePath, CenterWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'CircleAvatar',
      subtitle: 'CircleAvatar',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CircleAvatar-class.html',
      buildRoute: (context) => BaseWidget('CircleAvatar', codePath, CircleAvatarWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'ConstrainedBox',
      subtitle: 'A widget that imposes additional constraints on its child.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html',
      buildRoute: (context) => BaseWidget('ConstrainedBox', codePath, ConstrainedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'Container',
      subtitle: 'A convenience widget that combines common painting, positioning, and sizing widgets.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Container-class.html',
      buildRoute: (context) => BaseWidget('Container', codePath, ContainerWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'CustomSingleChildLayout',
      subtitle: 'A widget that defers the layout of its single child to a delegate.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CustomSingleChildLayout-class.html',
      buildRoute: (context) => BaseWidget('CustomSingleChildLayout', codePath, CustomSingleChildLayoutWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'FittedBox',
      subtitle: 'Scales and positions its child within itself according to fit.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FittedBox-class.html',
      buildRoute: (context) => BaseWidget('FittedBox', codePath, FittedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'FractionallySizedBox',
      subtitle: 'A widget that sizes its child to a fraction of the total available space.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FractionallySizedBox-class.html',
      buildRoute: (context) => BaseWidget('FractionallySizedBox', codePath, FractionallySizedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'IntrinsicHeight',
      subtitle: '''A widget that sizes its child to the child's intrinsic height.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html',
      buildRoute: (context) => BaseWidget('IntrinsicHeight', codePath, IntrinsicHeightWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'IntrinsicWidth',
      subtitle: '''A widget that sizes its child to the child's intrinsic width.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IntrinsicWidth-class.html',
      buildRoute: (context) => BaseWidget('IntrinsicWidth', codePath, IntrinsicWidthWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'LimitedBox',
      subtitle: '''A box that limits its size only when it's unconstrained.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/LimitedBox-class.html',
      buildRoute: (context) => BaseWidget('LimitedBox', codePath, LimitedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'Offstage',
      subtitle:
          'A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Offstage-class.html',
      buildRoute: (context) => BaseWidget('Offstage', codePath, OffstageWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'OverflowBox',
      subtitle:
          'A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/OverflowBox-class.html',
      buildRoute: (context) => BaseWidget('OverflowBox', codePath, OverflowBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'Padding',
      subtitle: 'A widget that insets its child by the given padding.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Padding-class.html',
      buildRoute: (context) => BaseWidget('Padding', codePath, PaddingWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'SizedBox',
      subtitle: 'A box with a specified size.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SizedBox-class.html',
      buildRoute: (context) => BaseWidget('SizedBox', codePath, SizedBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'SizedOverflowBox',
      subtitle:
          'A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SizedOverflowBox-class.html',
      buildRoute: (context) => BaseWidget('SizedOverflowBox', codePath, SizedOverflowBoxWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'Transform',
      subtitle: 'A widget that applies a transformation before painting its child.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Transform-class.html',
      buildRoute: (context) => BaseWidget('Transform', codePath, TransformWidget()),
    ),
    DemoItem(
      icon: Icons.child_care,
      title: 'UnconstraindBox',
      subtitle: 'UnconstraindBox',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/UnconstraindBox-class.html',
      buildRoute: (context) => BaseWidget('UnconstraindBox', codePath, UnconstrainedBoxWidget()),
    ),
  ];
}
