import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedalign.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedbuilder.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedcontainer.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedcrossfade.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animateddefaulttextstyle.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedicon.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedlist.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedmodalbarrier.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedopacity.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedpadding.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedphysicalmodel.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedpositioned.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedsize.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedswitcher.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedtheme.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/animatedwidget.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/decoratedboxtransition.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/fadeinimage.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/fadetransition.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/hero.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/positionedtransition.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/relativepositionedtransition.dart';
import 'package:flutter_dojo/category/widgets/animationmotion/rotationtransition.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildAnimationMotionDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedAlign',
      subtitle: 'AnimatedAlign',
      keyword: 'AnimatedAlign',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html',
      buildRoute: (context) => BaseWidget('AnimatedAlign', codePath + 'animatedalign', AnimatedAlignWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedBuilder',
      subtitle: 'A general-purpose widget for building animations.',
      keyword: 'AnimatedBuilder',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html',
      buildRoute: (context) => BaseWidget('AnimatedBuilder', codePath + 'animatedbuilder', AnimatedBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedContainer',
      subtitle: 'A container that gradually changes its values over a period of time.',
      keyword: 'AnimatedContainer',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
      buildRoute: (context) =>
          BaseWidget('AnimatedContainer', codePath + 'animatedcontainer', AnimatedContainerWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedCrossFade',
      subtitle: 'A widget that cross-fades between two given children and animates itself between their sizes.',
      keyword: 'AnimatedCrossFade',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html',
      buildRoute: (context) =>
          BaseWidget('AnimatedCrossFade', codePath + 'animatedcrossfade', AnimatedCrossFadeWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedDefaultTextStyle',
      subtitle:
          'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
      keyword: 'AnimatedDefaultTextStyle',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html',
      buildRoute: (context) => BaseWidget(
          'AnimatedDefaultTextStyle', codePath + 'animateddefaulttextstyle', AnimatedDefaultTextStyleWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedIcon',
      subtitle: 'AnimatedIcon',
      keyword: 'AnimatedIcon',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedIcon-class.html',
      buildRoute: (context) => BaseWidget('AnimatedIcon', codePath + 'animatedicon', AnimatedIconWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedList',
      subtitle: 'AnimatedList',
      keyword: 'AnimatedList',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedList-class.html',
      buildRoute: (context) => BaseWidget('AnimatedList', codePath + 'animatedlist', AnimatedListWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedListState',
      subtitle: 'The state for a scrolling container that animates items when they are inserted or removed.',
      keyword: 'AnimatedListState',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html',
      buildRoute: (context) => BaseWidget('AnimatedListState', codePath + 'animatedlist', AnimatedListWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedModalBarrier',
      subtitle: 'A widget that prevents the user from interacting with widgets behind itself.',
      keyword: 'AnimatedModalBarrier',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedModalBarrier-class.html',
      buildRoute: (context) =>
          BaseWidget('AnimatedModalBarrier', codePath + 'animatedmodalbarrier', AnimatedModalBarrierWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedOpacity',
      subtitle:
          '''Animated version of Opacity which automatically transitions the child's opacity over a given duration whenever the given opacity changes.''',
      keyword: 'AnimatedOpacity',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
      buildRoute: (context) => BaseWidget('AnimatedOpacity', codePath + 'animatedopacity', AnimatedOpacityWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedPadding',
      subtitle: 'AnimatedPadding',
      keyword: 'AnimatedPadding',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedPadding-class.html',
      buildRoute: (context) => BaseWidget('AnimatedPadding', codePath + 'animatedpadding', AnimatedPaddingWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedPhysicalModel',
      subtitle: 'Animated version of PhysicalModel.',
      keyword: 'AnimatedPhysicalModel',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedPhysicalModel-class.html',
      buildRoute: (context) =>
          BaseWidget('AnimatedPhysicalModel', codePath + 'animatedphysicalmodel', AnimatedPhysicalModelWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedPositioned',
      subtitle:
          '''Animated version of Positioned which automatically transitions the child's position over a given duration whenever the given position changes.''',
      keyword: 'AnimatedPositioned',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html',
      buildRoute: (context) =>
          BaseWidget('AnimatedPositioned', codePath + 'animatedpositioned', AnimatedPositionedWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedSize',
      subtitle:
          '''Animated widget that automatically transitions its size over a given duration whenever the given child's size changes.''',
      keyword: 'AnimatedSize',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html',
      buildRoute: (context) => BaseWidget('AnimatedSize', codePath + 'animatedsize', AnimatedSizeWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedSwitcher',
      subtitle: 'AnimatedSwitcher',
      keyword: 'AnimatedSwitcher',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html',
      buildRoute: (context) => BaseWidget('AnimatedSwitcher', codePath + 'animatedswitcher', AnimatedSwitcherWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedTheme',
      subtitle: 'AnimatedTheme',
      keyword: 'AnimatedTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedTheme-class.html',
      buildRoute: (context) => BaseWidget('AnimatedTheme', codePath + 'animatedtheme', AnimatedThemeWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedWidget',
      subtitle: 'A widget that rebuilds when the given Listenable changes value.',
      keyword: 'AnimatedWidget',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html',
      buildRoute: (context) => BaseWidget('AnimatedWidget', codePath + 'animatedwidget', AnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'DecoratedBoxTransition',
      subtitle: 'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
      keyword: 'DecoratedBoxTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html',
      buildRoute: (context) =>
          BaseWidget('DecoratedBoxTransition', codePath + 'decoratedboxtransition', DecoratedBoxTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'FadeTransition',
      subtitle: 'Animates the opacity of a widget.',
      keyword: 'FadeTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FadeTransition-class.html',
      buildRoute: (context) => BaseWidget('FadeTransition', codePath + 'fadetransition', FadeTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'FadeInImage',
      subtitle: 'FadeInImage',
      keyword: 'FadeInImage',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FadeInImage-class.html',
      buildRoute: (context) => BaseWidget('FadeInImage', codePath + 'fadeinimage', FadeInImageWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'Hero',
      subtitle: 'A widget that marks its child as being a candidate for hero animations.',
      keyword: 'Hero',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Hero-class.html',
      buildRoute: (context) => BaseWidget('Hero', codePath + 'hero', HeroWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'PositionedTransition',
      subtitle:
          '''Animated version of Positioned which takes a specific Animation to transition the child's position from a start position to and end position over the lifetime of the animation.''',
      keyword: 'PositionedTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/PositionedTransition-class.html',
      buildRoute: (context) =>
          BaseWidget('PositionedTransition', codePath + 'positionedtransition', PositionedTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'RotationTransition',
      subtitle: 'Animates the rotation of a widget.',
      keyword: 'RotationTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RotationTransition-class.html',
      buildRoute: (context) =>
          BaseWidget('RotationTransition', codePath + 'rotationtransition', RotationTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'RelativePositionedTransition',
      subtitle: 'RelativePositionedTransition',
      keyword: 'RelativePositionedTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RelativePositionedTransition-class.html',
      buildRoute: (context) => BaseWidget('RelativePositionedTransition', codePath + 'relativepositionedtransition',
          RelativePositionedTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'ScaleTransition',
      subtitle: 'Animates the scale of transformed widget.',
      keyword: 'ScaleTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ScaleTransition-class.html',
      buildRoute: (context) => BaseWidget('ScaleTransition', codePath + 'rotationtransition', AnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'SizeTransition',
      subtitle: 'Animates its own size and clips and aligns the child.',
      keyword: 'SizeTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SizeTransition-class.html',
      buildRoute: (context) => BaseWidget('SizeTransition', codePath + 'rotationtransition', AnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'SlideTransition',
      subtitle: 'Animates the position of a widget relative to its normal position.',
      keyword: 'SlideTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SlideTransition-class.html',
      buildRoute: (context) => BaseWidget('SlideTransition', codePath + 'rotationtransition', AnimatedWidgetWidget()),
    ),
  ];
}
