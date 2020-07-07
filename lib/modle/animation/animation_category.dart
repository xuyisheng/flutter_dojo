import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/animation/barchat/bar.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/bouncetext.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/curve.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/customhero.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/favor.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/foldablebutton.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/gift.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/radialhero.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/radialrecthero.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/reversepage.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/rotatemenu.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/showup.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/textshader.dart';
import 'package:flutter_dojo/category/animation/informationdisplay/typewriter.dart';
import 'package:flutter_dojo/category/animation/listanimation/animlist.dart';
import 'package:flutter_dojo/category/animation/listanimation/delayanimlist.dart';
import 'package:flutter_dojo/category/animation/listanimation/deleteanimlist.dart';
import 'package:flutter_dojo/category/animation/listanimation/focus.dart';
import 'package:flutter_dojo/category/animation/listanimation/slidecard.dart';
import 'package:flutter_dojo/category/animation/listanimation/testanim1.dart';
import 'package:flutter_dojo/category/animation/listanimation/testanim2.dart';
import 'package:flutter_dojo/category/animation/loading/customprogress.dart';
import 'package:flutter_dojo/category/animation/loading/loading.dart';
import 'package:flutter_dojo/category/animation/perspective/perspectivecard.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/listtopbottom.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollinganimation1.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollinganimation2.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollinganimation3.dart';
import 'package:flutter_dojo/category/animation/scrollanimation/scrollparallax.dart';
import 'package:flutter_dojo/category/animation/sequence/implicitlyanimatedwidget.dart';
import 'package:flutter_dojo/category/animation/sequence/sequence.dart';
import 'package:flutter_dojo/category/animation/sequence/staggeranimation.dart';
import 'package:flutter_dojo/category/animation/sequence/tweenanimationbuilder.dart';
import 'package:flutter_dojo/category/animation/simulation/fire.dart';
import 'package:flutter_dojo/category/animation/simulation/fling.dart';
import 'package:flutter_dojo/category/animation/simulation/particle.dart';
import 'package:flutter_dojo/category/animation/simulation/physical.dart';
import 'package:flutter_dojo/category/animation/simulation/writer.dart';
import 'package:flutter_dojo/category/animation/waveandcurve/curveline.dart';
import 'package:flutter_dojo/category/animation/waveandcurve/planets.dart';
import 'package:flutter_dojo/category/animation/waveandcurve/water.dart';
import 'package:flutter_dojo/category/animation/waveandcurve/wave.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItemCategory> buildAnimationCategoryList = <DemoItemCategory>[
  DemoItemCategory(
    name: 'BarChat',
    list: buildBarChatDemoItems('lib/category/animation/barchat/'),
  ),
  DemoItemCategory(
    name: 'InformationDisplay',
    list: buildInformationDisplayDemoItems('lib/category/animation/informationdisplay/'),
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
    name: 'Perspective',
    list: buildPerspectiveDemoItems('lib/category/animation/perspective/'),
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
      title: 'BounceText',
      subtitle: 'BounceText',
      keyword: 'BounceText',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('BounceText', codePath + 'bouncetext', BounceTextWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Curve',
      subtitle: 'Curve',
      keyword: 'Curve',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Curve', codePath + 'curve', CurveWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'CustomHero',
      subtitle: 'CustomHero',
      keyword: 'CustomHero',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomHero', codePath + 'customhero', CustomHeroWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Favor',
      subtitle: 'Favor',
      keyword: 'Favor',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Favor', codePath + 'favor', FavorWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'FoldableButton',
      subtitle: 'FoldableButton',
      keyword: 'FoldableButton',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ProgressButton', codePath + 'foldablebutton', FoldableButtonWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Gift',
      subtitle: 'Gift',
      keyword: 'Gift',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Gift', codePath + 'gift', GiftWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'RadialHero',
      subtitle: 'RadialHero',
      keyword: 'RadialHero',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RadialHero', codePath + 'radialhero', RadialHeroWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'RadialRectHero',
      subtitle: 'RadialRectHero',
      keyword: 'RadialRectHero',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RadialRectHero', codePath + 'radialrecthero', RadialRectHeroWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'ReversePage',
      subtitle: 'ReversePage',
      keyword: 'ReversePage',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ReversePage', codePath + 'reversepage', ReversePageWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'RotateMenu',
      subtitle: 'RotateMenu',
      keyword: 'RotateMenu',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RotateMenu', codePath + 'rotatemenu', RotateMenuWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'ShowUp',
      subtitle: 'ShowUp',
      keyword: 'ShowUp',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ShowUp', codePath + 'showup', ShowUpWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'TextShader',
      subtitle: 'TextShader',
      keyword: 'TextShader',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('TextShader', codePath + 'textshader', TextShaderWidget()),
    ),
    DemoItem(
      icon: Icons.date_range,
      title: 'Typewriter',
      subtitle: 'Typewriter',
      keyword: 'Typewriter',
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
      keyword: 'CustomProgress',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomProgress', codePath + 'customprogress', CustomProgressWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Loading',
      subtitle: 'Loading',
      keyword: 'Loading',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Loading', codePath + 'loading', LoadingWidget()),
    ),
  ];
}

List<DemoItem> buildPerspectiveDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'PerspectiveCard',
      subtitle: 'PerspectiveCard',
      keyword: 'PerspectiveCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('PerspectiveCard', codePath + 'perspectivecard', PerspectiveCardWidget()),
    ),
  ];
}

List<DemoItem> buildSimulationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Fire',
      subtitle: 'Fire',
      keyword: 'Fire',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Fire', codePath + 'fire', FireWidget()),
    ),
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Fling',
      subtitle: 'Fling',
      keyword: 'Fling',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Fling', codePath + 'fling', FlingWidget()),
    ),
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Particle',
      subtitle: 'Particle',
      keyword: 'Particle',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Particle', codePath + 'particle', ParticleWidget()),
    ),
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Physical',
      subtitle: 'Physical',
      keyword: 'Physical',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Physical', codePath + 'physical', PhysicalWidget()),
    ),
    DemoItem(
      icon: Icons.filter_9_plus,
      title: 'Writer',
      subtitle: 'Writer',
      keyword: 'Writer',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Writer', codePath + 'writer', WriterWidget()),
    ),
  ];
}

List<DemoItem> buildListAnimationDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.gavel,
      title: 'AnimList',
      subtitle: 'AnimList',
      keyword: 'AnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AnimList', codePath + 'animlist', AnimListWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'DelayAnimList',
      subtitle: 'DelayAnimList',
      keyword: 'DelayAnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DelayAnimList', codePath + 'delayanimlist', DelayAnimListWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'DeleteAnimList',
      subtitle: 'DeleteAnimList',
      keyword: 'DeleteAnimList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DeleteAnimList', codePath + 'deleteanimlist', DeleteAnimListWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'Focus',
      subtitle: 'Focus',
      keyword: 'Focus',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Focus', codePath + 'focus', FocusWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'SlideCard',
      subtitle: 'SlideCard',
      keyword: 'SlideCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SlideCard', codePath + 'slidecard', SlideCardWidget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'Anim1',
      subtitle: 'Anim1',
      keyword: 'Anim1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim1', codePath + 'testanim1', TestAnim1Widget()),
    ),
    DemoItem(
      icon: Icons.gavel,
      title: 'Anim2',
      subtitle: 'Anim2',
      keyword: 'Anim2',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Anim2', codePath + 'testanim2', TestAnim2Widget()),
    ),
  ];
}

List<DemoItem> buildSequenceDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.settings_input_antenna,
      title: 'ImplicitlyAnimatedWidget',
      subtitle: 'ImplicitlyAnimatedWidget',
      keyword: 'ImplicitlyAnimatedWidget',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget(
          'ImplicitlyAnimatedWidget', codePath + 'implicitlyanimatedwidget', ImplicitlyAnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.settings_input_antenna,
      title: 'Sequence',
      subtitle: 'Sequence',
      keyword: 'Sequence',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Sequence', codePath + 'sequence', SequenceWidget()),
    ),
    DemoItem(
      icon: Icons.settings_input_antenna,
      title: 'StaggerAnimation',
      subtitle: 'StaggerAnimation',
      keyword: 'StaggerAnimation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('StaggerAnimation', codePath + 'staggeranimation', StaggerAnimationWidget()),
    ),
    DemoItem(
      icon: Icons.settings_input_antenna,
      title: 'TweenAnimationBuilder',
      subtitle: 'TweenAnimationBuilder',
      keyword: 'TweenAnimationBuilder',
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
      keyword: 'Bar',
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
      keyword: 'ListTopBottom',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ListTopBottom', codePath + 'listtopbottom', ListTopBottomWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      keyword: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('ScrollingAnimation1', codePath + 'scrollinganimation1', ScrollingAnimation1Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      keyword: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('ScrollingAnimation2', codePath + 'scrollinganimation2', ScrollingAnimation2Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollAnimation',
      subtitle: 'ScrollAnimation',
      keyword: 'ScrollAnimation',
      documentationUrl: '',
      buildRoute: (context) =>
          BaseWidget('ScrollingAnimation3', codePath + 'scrollinganimation3', ScrollingAnimation3Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScrollParallax',
      subtitle: 'ScrollParallax',
      keyword: 'ScrollParallax',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScrollParallax', codePath + 'scrollparallax', ScrollParallaxWidget()),
    ),
  ];
}

List<DemoItem> buildWaveAndCurveDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.watch,
      title: 'CurveLine',
      subtitle: 'CurveLine',
      keyword: 'CurveLine',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CurveLine', codePath + 'curveline', CurveLineWidget()),
    ),
    DemoItem(
      icon: Icons.watch,
      title: 'Planets',
      subtitle: 'Planets',
      keyword: 'Planets',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Planets', codePath + 'planets', PlanetsWidget()),
    ),
    DemoItem(
      icon: Icons.watch,
      title: 'Water',
      subtitle: 'Water',
      keyword: 'Water',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Water', codePath + 'Water', WaterWidget()),
    ),
    DemoItem(
      icon: Icons.watch,
      title: 'Wave',
      subtitle: 'Wave',
      keyword: 'Wave',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Wave', codePath + 'wave', WaveWidget()),
    ),
  ];
}
