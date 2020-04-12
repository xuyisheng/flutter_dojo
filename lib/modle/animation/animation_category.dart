import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/animation/barchat/bar.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/curve.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/foldablebutton.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/gift.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/rotatemenu.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/showup.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/testanim3.dart';
import 'package:flutter_dojo/category/animation/infomationdisplay/typewriter.dart';
import 'package:flutter_dojo/category/animation/listanimation/animlist.dart';
import 'package:flutter_dojo/category/animation/listanimation/deleteanimlist.dart';
import 'package:flutter_dojo/category/animation/listanimation/focus.dart';
import 'package:flutter_dojo/category/animation/listanimation/slidecard.dart';
import 'package:flutter_dojo/category/animation/listanimation/testanim1.dart';
import 'package:flutter_dojo/category/animation/listanimation/testanim2.dart';
import 'package:flutter_dojo/category/animation/loading/customprogress.dart';
import 'package:flutter_dojo/category/animation/loading/loading.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/listtopbottom.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollinganimation1.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollinganimation2.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollinganimation3.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollparallax.dart';
import 'package:flutter_dojo/category/animation/sequence/implicitlyanimatedwidget.dart';
import 'package:flutter_dojo/category/animation/sequence/sequence.dart';
import 'package:flutter_dojo/category/animation/sequence/staggeranimation.dart';
import 'package:flutter_dojo/category/animation/sequence/tweenanimationbuilder.dart';
import 'package:flutter_dojo/category/animation/simulation/physical.dart';
import 'package:flutter_dojo/category/animation/waveandcurve/curveline.dart';
import 'package:flutter_dojo/category/animation/waveandcurve/wave.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItemCategory> buildAnimationCategoryList = <DemoItemCategory>[
  DemoItemCategory(
    name: 'BarChat',
    list: buildBarChatDemoItems('lib/category/animation/barchat/'),
  ),
  DemoItemCategory(
    name: 'InfomationDisplay',
    list: buildInformationDisplayDemoItems('lib/category/animation/infomationdisplay/'),
  ),
  DemoItemCategory(
    name: 'ListAnimation',
    list: buildListAnimationDemoItems('lib/category/animation/listanimation/'),
  ),
  DemoItemCategory(
    name: 'Loading',
    list: buildLoadingDemoItems('lib/category/animation/loading/'),
  ),
  DemoItemCategory(
    name: 'ScrollAnimation',
    list: buildScrollAnimationDemoItems('lib/category/animation/scrollanimation/'),
  ),
  DemoItemCategory(
    name: 'Sequence',
    list: buildSequenceDemoItems('lib/category/animation/sequence/'),
  ),
  DemoItemCategory(
    name: 'Simulation',
    list: buildSimulationDemoItems('lib/category/animation/simulation/'),
  ),
  DemoItemCategory(
    name: 'WaveAndCurve',
    list: buildWaveAndCurveDemoItems('lib/category/animation/waveandcurve/'),
  ),
];

List<DemoItem> buildInformationDisplayDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.date_range,
      title: 'Curve',
      subtitle: 'Curve',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Curve', codePath + 'curve', CurveWidget()),
    ),
    DemoItem(
      icon: Icons.center_focus_strong,
      title: 'FoldableButton',
      subtitle: 'FoldableButton',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ProgressButton', codePath + 'foldablebutton', FoldableButtonWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Gift',
      subtitle: 'Gift',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Gift', codePath + 'gift', GiftWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'RotateMenu',
      subtitle: 'RotateMenu',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RotateMenu', codePath + 'rotatemenu', RotateMenuWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'ShowUp',
      subtitle: 'ShowUp',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ShowUp', codePath + 'showup', ShowUpWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Anim3',
      subtitle: 'Anim3',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim3', codePath + 'testanim3', TestAnim3Widget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Typewriter',
      subtitle: 'Typewriter',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Typewriter', codePath + 'typewriter', TypewriterWidget()),
    ),
  ];
}

List<DemoItem> buildLoadingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'CustomProgress',
      subtitle: 'CustomProgress',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomProgress', codePath + 'customprogress', CustomProgressWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Loading',
      subtitle: 'Loading',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Loading', codePath + 'loading', LoadingWidget()),
    ),
  ];
}

List<DemoItem> buildSimulationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Physical',
      subtitle: 'Physical',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Physical', codePath + 'physical', PhysicalWidget()),
    ),
  ];
}

List<DemoItem> buildListAnimationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.gavel,
      title: 'AnimList',
      subtitle: 'AnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AnimList', codePath + 'animlist', AnimListWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'DeleteAnimList',
      subtitle: 'DeleteAnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DeleteAnimList', codePath + 'deleteanimlist', DeleteAnimListWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Focus',
      subtitle: 'Focus',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Focus', codePath + 'focus', FocusWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'SlideCard',
      subtitle: 'SlideCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SlideCard', codePath + 'slidecard', SlideCardWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Anim1',
      subtitle: 'Anim1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim1', codePath + 'testanim1', TestAnim1Widget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'Anim2',
      subtitle: 'Anim2',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim2', codePath + 'testanim2', TestAnim2Widget()),
    ),
  ];
}

List<DemoItem> buildSequenceDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.date_range,
      title: 'ImplicitlyAnimatedWidget',
      subtitle: 'ImplicitlyAnimatedWidget',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget(
          'ImplicitlyAnimatedWidget', codePath + 'implicitlyanimatedwidget', ImplicitlyAnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Sequence',
      subtitle: 'Sequence',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Sequence', codePath + 'sequence', SequenceWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'StaggerAnimation',
      subtitle: 'StaggerAnimation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('StaggerAnimation', codePath + 'staggeranimation', StaggerAnimationWidget()),
    ),
    DemoItem(
      icon: Icons.video_library,
      title: 'TweenAnimationBuilder',
      subtitle: 'TweenAnimationBuilder',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('TweenAnimationBuilder', codePath + 'tweenanimationbuilder', TweenAnimationBuilderWidget()),
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
      buildRoute: (context) => BaseWidget('Bar', codePath + 'bar', BarWidget()),
    ),
  ];
}

List<DemoItem> buildScrollAnimationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'ListTopBottom',
      subtitle: 'ListTopBottom',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ListTopBottom', codePath + 'listtopbottom', ListTopBottomWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('ScrollingAnimation1', codePath + 'scrollinganimation1', ScrollingAnimation1Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('ScrollingAnimation2', codePath + 'scrollinganimation2', ScrollingAnimation2Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('ScrollingAnimation3', codePath + 'scrollinganimation3', ScrollingAnimation3Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollParallax',
      subtitle: 'ScrollParallax',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScrollParallax', codePath + 'scrollparallax', ScrollParallaxWidget()),
    ),
  ];
}

List<DemoItem> buildWaveAndCurveDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.date_range,
      title: 'CurveLine',
      subtitle: 'CurveLine',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CurveLine', codePath + 'curveline', CurveLineWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Wave',
      subtitle: 'Wave',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Wave', codePath + 'wave', WaveWidget()),
    ),
  ];
}
