import 'package:flutter/material.dart';
import 'package:flutter_dojo/animation/animation/bouncing.dart';
import 'package:flutter_dojo/animation/animation/curve.dart';
import 'package:flutter_dojo/animation/animation/curveline.dart';
import 'package:flutter_dojo/animation/animation/focus.dart';
import 'package:flutter_dojo/animation/animation/implicitlyanimatedwidget.dart';
import 'package:flutter_dojo/animation/animation/sequence.dart';
import 'package:flutter_dojo/animation/animation/showup.dart';
import 'package:flutter_dojo/animation/animation/staggeranimation.dart';
import 'package:flutter_dojo/animation/animation/typewriter.dart';
import 'package:flutter_dojo/animation/animation/wave.dart';
import 'package:flutter_dojo/animation/animbutton/foldablebutton.dart';
import 'package:flutter_dojo/animation/animbutton/progressbutton.dart';
import 'package:flutter_dojo/animation/animlist/animlist.dart';
import 'package:flutter_dojo/animation/animlist/deleteanimlist.dart';
import 'package:flutter_dojo/animation/barchat/bar.dart';
import 'package:flutter_dojo/animation/loading/customprogress.dart';
import 'package:flutter_dojo/animation/loading/loading.dart';
import 'package:flutter_dojo/animation/physical/physical.dart';
import 'package:flutter_dojo/animation/scrollanimation/listtopbottom.dart';
import 'package:flutter_dojo/animation/scrollanimation/scrollinganimation1.dart';
import 'package:flutter_dojo/animation/scrollanimation/scrollinganimation2.dart';
import 'package:flutter_dojo/animation/scrollanimation/scrollinganimation3.dart';
import 'package:flutter_dojo/animation/scrollanimation/scrollparallax.dart';
import 'package:flutter_dojo/animation/tween/gift.dart';
import 'package:flutter_dojo/animation/tween/rotatemenu.dart';
import 'package:flutter_dojo/animation/tween/slidecard.dart';
import 'package:flutter_dojo/animation/tween/testanim1.dart';
import 'package:flutter_dojo/animation/tween/testanim2.dart';
import 'package:flutter_dojo/animation/tween/testanim3.dart';
import 'package:flutter_dojo/animation/tween/tweenanimationbuilder.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/pages/pattern/pattern_mainpage.dart';

var codePath = 'lib/animation/';

List<Entry> buildAnimationCategoryList = <Entry>[
  Entry(
    'AnimButton',
    buildAnimButtonDemoItems(codePath + 'animbutton/'),
  ),
  Entry(
    'AnimList',
    buildAnimListDemoItems(codePath + 'animlist/'),
  ),
  Entry(
    'Animation',
    buildAnimationDemoItems(codePath + 'animation/'),
  ),
  Entry(
    'BarChat',
    buildBarChatDemoItems(codePath + 'barchat/'),
  ),
  Entry(
    'Loading',
    buildLoadingDemoItems(codePath + 'loading/'),
  ),
  Entry(
    'Physical',
    buildPhysicalDemoItems(codePath + 'physical/'),
  ),
  Entry(
    'Scroll',
    buildScrollAnimationDemoItems(codePath + 'scrollanimation/'),
  ),
  Entry(
    'TweenAnim',
    buildTweenAnimDemoItems(codePath + 'tween'),
  ),
];

List<DemoItem> buildAnimButtonDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.center_focus_strong,
      title: 'FoldableButton',
      subtitle: 'FoldableButton',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('FoldableButton', codePath, FoldableButtonWidget()),
    ),
    DemoItem(
      icon: Icons.center_focus_strong,
      title: 'ProgressButton',
      subtitle: 'ProgressButton',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ProgressButton', codePath, ProgressButtonWidget()),
    ),
  ];
}

List<DemoItem> buildLoadingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Loading',
      subtitle: 'Loading',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Loading', codePath, LoadingWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'CustomProgress',
      subtitle: 'CustomProgress',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomProgress', codePath, CustomProgressWidget()),
    ),
  ];
}

List<DemoItem> buildAnimationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.date_range,
      title: 'Bouncing',
      subtitle: 'Bouncing',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Bouncing', codePath, BouncingWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Curve',
      subtitle: 'Curve',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Curve', codePath, CurveWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'CurveLine',
      subtitle: 'CurveLine',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CurveLine', codePath, CurveLineWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Focus',
      subtitle: 'Focus',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Sequence', codePath, FocusWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'ImplicitlyAnimatedWidget',
      subtitle: 'ImplicitlyAnimatedWidget',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ImplicitlyAnimatedWidget', codePath, ImplicitlyAnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'ShowUp',
      subtitle: 'ShowUp',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ShowUp', codePath, ShowUpWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'StaggerAnimation',
      subtitle: 'StaggerAnimation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('StaggerAnimation', codePath, StaggerAnimationWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Sequence',
      subtitle: 'Sequence',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Sequence', codePath, SequenceWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Typewriter',
      subtitle: 'Typewriter',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Typewriter', codePath, TypewriterWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Wave',
      subtitle: 'Wave',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Wave', codePath, WaveWidget()),
    ),
  ];
}

List<DemoItem> buildAnimListDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.gavel,
      title: 'DeleteAnimList',
      subtitle: 'DeleteAnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DeleteAnimList', codePath, DeleteAnimListWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'AnimList',
      subtitle: 'AnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AnimList', codePath, AnimListWidget()),
    ),
  ];
}

List<DemoItem> buildTweenAnimDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.video_library,
      title: 'TweenAnimationBuilder',
      subtitle: 'TweenAnimationBuilder',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('GestureScale', codePath, TweenAnimationBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Anim1',
      subtitle: 'Anim1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim1', codePath, TestAnim1Widget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Anim2',
      subtitle: 'Anim2',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim2', codePath, TestAnim2Widget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Anim3',
      subtitle: 'Anim3',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim3', codePath, TestAnim3Widget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Gift',
      subtitle: 'Gift',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Gift', codePath, GiftWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'RotateMenu',
      subtitle: 'RotateMenu',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RotateMenu', codePath, RotateMenuWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'SlideCard',
      subtitle: 'SlideCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SlideCard', codePath, SlideCardWidget()),
    ),
  ];
}

List<DemoItem> buildPhysicalDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Physical',
      subtitle: 'Physical',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Physical', codePath, PhysicalWidget()),
    ),
  ];
}

List<DemoItem> buildBarChatDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.verified_user,
      title: 'Bar',
      subtitle: 'Bar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Bar', codePath, BarWidget()),
    ),
  ];
}

List<DemoItem> buildScrollAnimationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScrollingAnimation1', codePath, ScrollingAnimation1Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScrollingAnimation2', codePath, ScrollingAnimation2Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScrollingAnimation3', codePath, ScrollingAnimation3Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ListTopBottom',
      subtitle: 'ListTopBottom',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ListTopBottom', codePath, ListTopBottomWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollParallax',
      subtitle: 'ScrollParallax',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScrollParallax', codePath, ScrollParallaxWidget()),
    ),
  ];
}
