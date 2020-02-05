import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedalign.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedbuilder.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedcontainer.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedcrossfade.dart';
import 'package:flutter_dojo/widgets/animationmotion/animateddefaulttextstyle.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedicon.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedlist.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedmodalbarrier.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedopacity.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedpadding.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedphysicalmodel.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedpositioned.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedsize.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedswitcher.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedtheme.dart';
import 'package:flutter_dojo/widgets/animationmotion/animatedwidget.dart';
import 'package:flutter_dojo/widgets/animationmotion/decoratedboxtransition.dart';
import 'package:flutter_dojo/widgets/animationmotion/fadeinimage.dart';
import 'package:flutter_dojo/widgets/animationmotion/fadetransition.dart';
import 'package:flutter_dojo/widgets/animationmotion/hero.dart';
import 'package:flutter_dojo/widgets/animationmotion/positionedtransition.dart';
import 'package:flutter_dojo/widgets/animationmotion/rotationtransition.dart';

List<DemoItem> buildAnimationMotionDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedAlign',
      subtitle: 'AnimatedAlign',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html',
      buildRoute: (context) => BaseWidget('AnimatedAlign', codePath, AnimatedAlignWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedBuilder',
      subtitle: 'A general-purpose widget for building animations.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html',
      buildRoute: (context) => BaseWidget('AnimatedBuilder', codePath, AnimatedBuilderWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedContainer',
      subtitle: 'A container that gradually changes its values over a period of time.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
      buildRoute: (context) => BaseWidget('AnimatedContainer', codePath, AnimatedContainerWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedCrossFade',
      subtitle: 'A widget that cross-fades between two given children and animates itself between their sizes.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html',
      buildRoute: (context) => BaseWidget('AnimatedCrossFade', codePath, AnimatedCrossFadeWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedDefaultTextStyle',
      subtitle:
          'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html',
      buildRoute: (context) => BaseWidget('AnimatedDefaultTextStyle', codePath, AnimatedDefaultTextStyleWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedIcon',
      subtitle: 'AnimatedIcon',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedIcon-class.html',
      buildRoute: (context) => BaseWidget('AnimatedIcon', codePath, AnimatedIconWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedList',
      subtitle: 'AnimatedList',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedList-class.html',
      buildRoute: (context) => BaseWidget('AnimatedList', codePath, AnimatedListWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedListState',
      subtitle: 'The state for a scrolling container that animates items when they are inserted or removed.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html',
      buildRoute: (context) => BaseWidget('AnimatedListState', codePath, AnimatedListWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedModalBarrier',
      subtitle: 'A widget that prevents the user from interacting with widgets behind itself.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedModalBarrier-class.html',
      buildRoute: (context) => BaseWidget('AnimatedModalBarrier', codePath, AnimatedModalBarrierWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedOpacity',
      subtitle:
          '''Animated version of Opacity which automatically transitions the child's opacity over a given duration whenever the given opacity changes.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
      buildRoute: (context) => BaseWidget('AnimatedOpacity', codePath, AnimatedOpacityWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedPadding',
      subtitle: 'AnimatedPadding',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedPadding-class.html',
      buildRoute: (context) => BaseWidget('AnimatedPadding', codePath, AnimatedPaddingWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedPhysicalModel',
      subtitle: 'Animated version of PhysicalModel.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedPhysicalModel-class.html',
      buildRoute: (context) => BaseWidget('AnimatedPhysicalModel', codePath, AnimatedPhysicalModelWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedPositioned',
      subtitle:
          '''Animated version of Positioned which automatically transitions the child's position over a given duration whenever the given position changes.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html',
      buildRoute: (context) => BaseWidget('AnimatedPositioned', codePath, AnimatedPositionedWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedSize',
      subtitle:
          '''Animated widget that automatically transitions its size over a given duration whenever the given child's size changes.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedSize-class.html',
      buildRoute: (context) => BaseWidget('AnimatedSize', codePath, AnimatedSizeWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedSwitcher',
      subtitle: 'AnimatedSwitcher',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html',
      buildRoute: (context) => BaseWidget('AnimatedSwitcher', codePath, AnimatedSwitcherWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedTheme',
      subtitle: 'AnimatedTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedTheme-class.html',
      buildRoute: (context) => BaseWidget('AnimatedTheme', codePath, AnimatedThemeWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'AnimatedWidget',
      subtitle: 'A widget that rebuilds when the given Listenable changes value.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html',
      buildRoute: (context) => BaseWidget('AnimatedWidget', codePath, AnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'DecoratedBoxTransition',
      subtitle: 'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html',
      buildRoute: (context) => BaseWidget('DecoratedBoxTransition', codePath, DecoratedBoxTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'FadeTransition',
      subtitle: 'Animates the opacity of a widget.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FadeTransition-class.html',
      buildRoute: (context) => BaseWidget('FadeTransition', codePath, FadeTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'FadeInImage',
      subtitle: 'FadeInImage',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FadeInImage-class.html',
      buildRoute: (context) => BaseWidget('FadeInImage', codePath, FadeInImageWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'Hero',
      subtitle: 'A widget that marks its child as being a candidate for hero animations.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Hero-class.html',
      buildRoute: (context) => BaseWidget('Hero', codePath, HeroWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'PositionedTransition',
      subtitle:
          '''Animated version of Positioned which takes a specific Animation to transition the child's position from a start position to and end position over the lifetime of the animation.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/PositionedTransition-class.html',
      buildRoute: (context) => BaseWidget('PositionedTransition', codePath, PositionedTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'RotationTransition',
      subtitle: 'Animates the rotation of a widget.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RotationTransition-class.html',
      buildRoute: (context) => BaseWidget('RotationTransition', codePath, RotationTransitionWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'ScaleTransition',
      subtitle: 'Animates the scale of transformed widget.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ScaleTransition-class.html',
      buildRoute: (context) => BaseWidget('ScaleTransition', codePath, AnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'SizeTransition',
      subtitle: 'Animates its own size and clips and aligns the child.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SizeTransition-class.html',
      buildRoute: (context) => BaseWidget('SizeTransition', codePath, AnimatedWidgetWidget()),
    ),
    DemoItem(
      icon: Icons.move_to_inbox,
      title: 'SlideTransition',
      subtitle: 'Animates the position of a widget relative to its normal position.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SlideTransition-class.html',
      buildRoute: (context) => BaseWidget('SlideTransition', codePath, AnimatedWidgetWidget()),
    ),
  ];
}
