import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoactionsheet.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoactivityindicator.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoalertdialog.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinobutton.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinocolors.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinocontextmenu.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinodialogaction.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoicons.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinonavigationbar.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinopagescaffold.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinopopupsurface.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoscrollbar.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinosegmentedcontrol.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoslider.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoslidingsegmentedcontrol.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinosliverrefreshcontrol.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinoswitch.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinotabbar.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinotabscaffold.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinotabview.dart';
import 'package:flutter_dojo/category/widgets/cupertino/cupertinotimerpicker.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildCupertinoDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoActionSheet',
      subtitle: 'An iOS-style action sheet.',
      keyword: 'CupertinoActionSheet',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoActionSheet-class.html',
      buildRoute: (context) => BaseWidget('CupertinoActionSheet', codePath + 'cupertinoactionsheet', CupertinoActionSheetWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoActivityIndicator',
      subtitle: 'An iOS-style activity indicator that spins clockwise.',
      keyword: 'CupertinoActivityIndicator',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoActivityIndicator-class.html',
      buildRoute: (context) => BaseWidget('CupertinoActivityIndicator', codePath + 'cupertinoactivityindicator', CupertinoActivityIndicatorWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoAlertDialog',
      subtitle: 'An iOS-style alert dialog.',
      keyword: 'CupertinoAlertDialog',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoAlertDialog-class.html',
      buildRoute: (context) => BaseWidget('CupertinoAlertDialog', codePath + 'cupertinoalertdialog', CupertinoAlertDialogWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoButton',
      subtitle: 'An iOS-style button.',
      keyword: 'CupertinoButton',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoButton-class.html',
      buildRoute: (context) => BaseWidget('CupertinoButton', codePath + 'cupertinobutton', CupertinoButtonWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoContextMenu',
      subtitle: 'A full-screen modal route that opens when the child is long-pressed.',
      keyword: 'CupertinoContextMenu',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoContextMenu-class.html',
      buildRoute: (context) => BaseWidget('CupertinoContextMenu', codePath + 'cupertinocontextmenu', CupertinoContextMenuWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoColors',
      subtitle: 'CupertinoColors',
      keyword: 'CupertinoColors',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoColors-class.html',
      buildRoute: (context) => BaseWidget('CupertinoColors', codePath + 'cupertinocolors', CupertinoColorsWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoDatePicker',
      subtitle: 'An iOS-style date or date and time picker.',
      keyword: 'CupertinoDatePicker',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoDatePicker-class.html',
      buildRoute: (context) => BaseWidget('CupertinoDatePicker', codePath + 'cupertinotimerpicker', CupertinoTimerPickerWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoDialog',
      subtitle: 'An iOS-style dialog.',
      keyword: 'CupertinoDialog',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoDialog-class.html',
      buildRoute: (context) => BaseWidget('CupertinoDialog', codePath + 'cupertinoalertdialog', CupertinoAlertDialogWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoDialogAction',
      subtitle: 'A button typically used in a [CupertinoAlertDialog].',
      keyword: 'CupertinoDialogAction',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoDialogAction-class.html',
      buildRoute: (context) => BaseWidget('CupertinoDialogAction', codePath + 'cupertinodialogaction', CupertinoDialogActionWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoFullscreenDialogTransition',
      subtitle: 'An iOS-style transition used for summoning fullscreen dialogs.',
      keyword: 'CupertinoFullscreenDialogTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoFullscreenDialogTransition-class.html',
      buildRoute: (context) => BaseWidget('CupertinoFullscreenDialogTransition', codePath + 'cupertinofullscreendialogtransition', Container()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoIcons',
      subtitle: 'CupertinoIcons',
      keyword: 'CupertinoIcons',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoIcons-class.html',
      buildRoute: (context) => BaseWidget('CupertinoIcons', codePath + 'cupertinoicons', CupertinoIconsWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoNavigationBar',
      subtitle: 'An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.',
      keyword: 'CupertinoNavigationBar',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoNavigationBar-class.html',
      buildRoute: (context) => BaseWidget('CupertinoNavigationBar', codePath + 'cupertinonavigationbar', CupertinoNavigationBarWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPageScaffold',
      subtitle: 'Basic iOS style page layout structure. Positions a navigation bar and content on a background.',
      keyword: 'CupertinoPageScaffold',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPageScaffold-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPageScaffold', codePath + 'cupertinopagescaffold', CupertinoPageScaffoldWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPageTransition',
      subtitle: 'Provides an iOS-style page transition animation.',
      keyword: 'CupertinoPageTransition',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPageTransition-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPageTransition', codePath + 'cupertinopagetransition', Container()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPicker',
      subtitle: 'An iOS-style picker control. Used to select an item in a short list.',
      keyword: 'CupertinoPicker',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPicker-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPicker', codePath + 'cupertinotimerpicker', CupertinoTimerPickerWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPopupSurface',
      subtitle: 'Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.',
      keyword: 'CupertinoPopupSurface',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPopupSurface-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPopupSurface', codePath + 'cupertinopopupsurface', CupertinoPopupSurfaceWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoScrollbar',
      subtitle: 'An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.',
      keyword: 'CupertinoScrollbar',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoScrollbar-class.html',
      buildRoute: (context) => BaseWidget('CupertinoScrollbar', codePath + 'cupertinoscrollbar', CupertinoScrollbarWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSegmentedControl',
      subtitle: 'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.',
      keyword: 'CupertinoSegmentedControl',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoSegmentedControl-class.html',
      buildRoute: (context) => BaseWidget('CupertinoSegmentedControl', codePath + 'cupertinosegmentedcontrol', CupertinoSegmentedControlWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSliverRefreshControl',
      subtitle: 'A sliver widget implementing the iOS-style pull to refresh content control.',
      keyword: 'CupertinoSliverRefreshControl',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoSliverRefreshControl-class.html',
      buildRoute: (context) =>
          BaseWidget('CupertinoSliverRefreshControl', codePath + 'cupertinosliverrefreshcontrol', CupertinoSliverRefreshControlWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSlidingSegmentedControl',
      subtitle: 'An iOS 13 style segmented control.',
      keyword: 'CupertinoSlidingSegmentedControl',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoSlidingSegmentedControl-class.html',
      buildRoute: (context) =>
          BaseWidget('CupertinoSlidingSegmentedControl', codePath + 'cupertinoslidingsegmentedcontrol', CupertinoSlidingSegmentedControlWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSlider',
      subtitle: 'Used to select from a range of values.',
      keyword: 'CupertinoSlider',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoSlider-class.html',
      buildRoute: (context) => BaseWidget('CupertinoSlider', codePath + 'cupertinoslider', CupertinoSliderWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSwitch',
      subtitle: 'An iOS-style switch. Used to toggle the on/off state of a single setting.',
      keyword: 'CupertinoSwitch',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoSwitch-class.html',
      buildRoute: (context) => BaseWidget('CupertinoSwitch', codePath + 'cupertinoswitch', CupertinoSwitchWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTabBar',
      subtitle: 'An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.',
      keyword: 'CupertinoTabBar',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTabBar-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTabBar', codePath + 'cupertinotabbar', CupertinoTabBarWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTabScaffold',
      subtitle: '''Implements a tabbed iOS application's root layout and behavior structure.''',
      keyword: 'CupertinoTabScaffold',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTabScaffold-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTabScaffold', codePath + 'cupertinotabscaffold', CupertinoTabScaffoldWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTabView',
      subtitle: 'Root content of a tab that supports parallel navigation between tabs. Typically used with CupertinoTabScaffold.',
      keyword: 'CupertinoTabView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTabView-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTabView', codePath + 'cupertinotabview', CupertinoTabViewWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTextField',
      subtitle: 'An iOS-style text field.',
      keyword: 'CupertinoTextField',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTextField-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTextField', codePath + 'cupertinotextfield', Container()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTimerPicker',
      subtitle: 'An iOS-style countdown timer picker.',
      keyword: 'CupertinoTimerPicker',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTimerPicker-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTimerPicker', codePath + 'cupertinotimerpicker', CupertinoTimerPickerWidget()),
    )
  ];
}
