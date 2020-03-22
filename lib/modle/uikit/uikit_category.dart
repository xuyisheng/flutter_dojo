import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/uikit/clock.dart';
import 'package:flutter_dojo/uikit/color.dart';
import 'package:flutter_dojo/uikit/curvefitting.dart';
import 'package:flutter_dojo/uikit/curves.dart';
import 'package:flutter_dojo/uikit/dashedline.dart';
import 'package:flutter_dojo/uikit/drawimage.dart';
import 'package:flutter_dojo/uikit/drawstyle.dart';
import 'package:flutter_dojo/uikit/drawtext.dart';
import 'package:flutter_dojo/uikit/feedback.dart';
import 'package:flutter_dojo/uikit/gesturepainter.dart';
import 'package:flutter_dojo/uikit/interpolator.dart';
import 'package:flutter_dojo/uikit/keyboard.dart';
import 'package:flutter_dojo/uikit/linemetrics.dart';
import 'package:flutter_dojo/uikit/matrix4.dart';
import 'package:flutter_dojo/uikit/nstar.dart';
import 'package:flutter_dojo/uikit/position.dart';
import 'package:flutter_dojo/uikit/pullrefresh.dart';
import 'package:flutter_dojo/uikit/randomcolor.dart';
import 'package:flutter_dojo/uikit/repaintboundary.dart';
import 'package:flutter_dojo/uikit/roundimage.dart';
import 'package:flutter_dojo/uikit/screenorientation.dart';
import 'package:flutter_dojo/uikit/screenshot.dart';
import 'package:flutter_dojo/uikit/size.dart';
import 'package:flutter_dojo/uikit/systemui.dart';
import 'package:flutter_dojo/uikit/timer.dart';
import 'package:flutter_dojo/uikit/visibility.dart';

var codePath = 'lib/uikit/';
List<DemoItem> buildUIKitCategoryList = [
  DemoItem(
    icon: Icons.pages,
    title: 'Curves',
    subtitle: 'Curves',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Curves', codePath, CurvesWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'CurveFitting',
    subtitle: 'CurveFitting',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('CurveFitting', codePath, CurveFittingWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Clock',
    subtitle: 'Clock',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Clock', codePath, ClockWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Color',
    subtitle: 'Color',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Color', codePath, ColorWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'DrawImage',
    subtitle: 'DrawImage',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('DrawImage', codePath, DrawImageWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'DrawStyle',
    subtitle: 'DrawStyle',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('DrawStyle', codePath, DrawStyleWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'DashedLine',
    subtitle: 'DashedLine',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('DashedLine', codePath, DashedLineWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'DrawText',
    subtitle: 'DrawText',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('DrawText', codePath, DrawTextWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Feedback',
    subtitle: 'Feedback',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Feedback', codePath, FeedbackWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'GesturePainter',
    subtitle: 'GesturePainter',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('GesturePainter', codePath, GesturePainterWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Interpolator',
    subtitle: 'Interpolator',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Interpolator', codePath, InterpolatorWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'LineMetrics',
    subtitle: 'LineMetrics',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('LineMetrics', codePath, LineMetricsWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Matrix4',
    subtitle: 'Matrix4',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Matrix4', codePath, Matrix4Widget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'NStar',
    subtitle: 'NStar',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('NStar', codePath, NStarWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Position',
    subtitle: 'Widget Position',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Position', codePath, PositionWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Keyboard',
    subtitle: 'Keyboard',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Keyboard', codePath, KeyboardWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'PullRefresh',
    subtitle: 'PullRefresh',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('PullRefresh', codePath, PullRefreshWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'RandomColor',
    subtitle: 'RandomColor',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('RandomColor', codePath, RandomColorWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'RepaintBoundary',
    subtitle: 'RepaintBoundary',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('RepaintBoundary', codePath, RepaintBoundaryWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'RoundImage',
    subtitle: 'RoundImage',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('RoundImage', codePath, RoundImageWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Size',
    subtitle: 'Widget Size',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Size', codePath, SizeWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'ScreenOrientation',
    subtitle: 'ScreenOrientation',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('ScreenOrientation', codePath, ScreenOrientationWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'SystemUI',
    subtitle: 'SystemUI',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('SystemUI', codePath, SystemUIWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Screenshot',
    subtitle: 'Screenshot',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Screenshot', codePath, ScreenshotWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Timer',
    subtitle: 'Timer',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Timer', codePath, TimerWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Visibility',
    subtitle: 'Visibility',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Visibility', codePath, VisibilityWidget()),
  ),
];
