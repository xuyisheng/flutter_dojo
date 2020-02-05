import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoactionsheet.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoactivityindicator.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoalertdialog.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinobutton.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinocolors.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinocontextmenu.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinodialogaction.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoicons.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinonavigationbar.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinopagescaffold.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinopopupsurface.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoscrollbar.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinosegmentedcontrol.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoslider.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoslidingsegmentedcontrol.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinoswitch.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinotabbar.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinotabscaffold.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinotabview.dart';
import 'package:flutter_dojo/widgets/cupertino/cupertinotimerpicker.dart';

List<DemoItem> buildCupertinoDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoActionSheet',
      subtitle: 'A run of text with a single style.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoActionSheet-class.html',
      buildRoute: (context) => BaseWidget('CupertinoActionSheet', codePath, CupertinoActionSheetWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoActivityIndicator',
      subtitle: '''An iOS-style activity indicator. Displays a circular 'spinner'.''',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoActivityIndicator-class.html',
      buildRoute: (context) => BaseWidget('CupertinoActivityIndicator', codePath, CupertinoActivityIndicatorWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoAlertDialog',
      subtitle: 'An iOS-style alert dialog.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoAlertDialog-class.html',
      buildRoute: (context) => BaseWidget('CupertinoAlertDialog', codePath, CupertinoAlertDialogWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoButton',
      subtitle: 'An iOS-style button.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoButton-class.html',
      buildRoute: (context) => BaseWidget('CupertinoButton', codePath, CupertinoButtonWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoContextMenu',
      subtitle: 'A full-screen modal route that opens when the child is long-pressed.',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoContextMenu-class.html',
      buildRoute: (context) => BaseWidget('CupertinoContextMenu', codePath, CupertinoContextMenuWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoColors',
      subtitle: 'CupertinoColors',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoColors-class.html',
      buildRoute: (context) => BaseWidget('CupertinoColors', codePath, CupertinoColorsWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoDatePicker',
      subtitle: 'An iOS-style date or date and time picker.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoDatePicker-class.html',
      buildRoute: (context) => BaseWidget('CupertinoDatePicker', codePath, CupertinoTimerPickerWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoDialog',
      subtitle: 'An iOS-style dialog.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoDialog-class.html',
      buildRoute: (context) => BaseWidget('CupertinoDialog', codePath, CupertinoAlertDialogWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoDialogAction',
      subtitle: 'A button typically used in a CupertinoAlertDialog.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoDialogAction-class.html',
      buildRoute: (context) => BaseWidget('CupertinoDialogAction', codePath, CupertinoDialogActionWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoFullscreenDialogTransition',
      subtitle: 'An iOS-style transition used for summoning fullscreen dialogs.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoFullscreenDialogTransition-class.html',
      buildRoute: (context) => BaseWidget('CupertinoFullscreenDialogTransition', codePath, Container()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoIcons',
      subtitle: 'CupertinoIcons',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoIcons-class.html',
      buildRoute: (context) => BaseWidget('CupertinoIcons', codePath, CupertinoIconsWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoNavigationBar',
      subtitle: 'An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoNavigationBar-class.html',
      buildRoute: (context) => BaseWidget('CupertinoNavigationBar', codePath, CupertinoNavigationBarWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPageScaffold',
      subtitle: 'Basic iOS style page layout structure. Positions a navigation bar and content on a background.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPageScaffold-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPageScaffold', codePath, CupertinoPageScaffoldWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPageTransition',
      subtitle: 'Provides an iOS-style page transition animation.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPageTransition-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPageTransition', codePath, Container()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPicker',
      subtitle: 'An iOS-style picker control. Used to select an item in a short list.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPicker-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPicker', codePath, CupertinoTimerPickerWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoPopupSurface',
      subtitle:
          'Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoPopupSurface-class.html',
      buildRoute: (context) => BaseWidget('CupertinoPopupSurface', codePath, CupertinoPopupSurfaceWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoScrollbar',
      subtitle: 'An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoScrollbar-class.html',
      buildRoute: (context) => BaseWidget('CupertinoScrollbar', codePath, CupertinoScrollbarWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSegmentedControl',
      subtitle: 'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoSegmentedControl-class.html',
      buildRoute: (context) => BaseWidget('CupertinoSegmentedControl', codePath, CupertinoSegmentedControlWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSlidingSegmentedControl',
      subtitle: 'An iOS 13 style segmented control.',
      documentationUrl: 'https://api.flutter.dev/flutter/cupertino/CupertinoSlidingSegmentedControl-class.html',
      buildRoute: (context) =>
          BaseWidget('CupertinoSlidingSegmentedControl', codePath, CupertinoSlidingSegmentedControlWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSlider',
      subtitle: 'Used to select from a range of values.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoSlider-class.html',
      buildRoute: (context) => BaseWidget('CupertinoSlider', codePath, CupertinoSliderWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoSwitch',
      subtitle: 'An iOS-style switch. Used to toggle the on/off state of a single setting.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoSwitch-class.html',
      buildRoute: (context) => BaseWidget('CupertinoSwitch', codePath, CupertinoSwitchWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTabBar',
      subtitle: 'An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTabBar-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTabBar', codePath, CupertinoTabBarWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTabScaffold',
      subtitle: 'Tabbed iOS app structure. Positions a tab bar on top of tabs of content.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTabScaffold-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTabScaffold', codePath, CupertinoTabScaffoldWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTabView',
      subtitle:
          'Root content of a tab that supports parallel navigation between tabs. Typically used with CupertinoTabScaffold.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTabView-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTabView', codePath, CupertinoTabViewWidget()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTextField',
      subtitle: 'An iOS-style text field.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTextField-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTextField', codePath, Container()),
    ),
    DemoItem(
      icon: Icons.tablet_mac,
      title: 'CupertinoTimerPicker',
      subtitle: 'An iOS-style countdown timer picker.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CupertinoTimerPicker-class.html',
      buildRoute: (context) => BaseWidget('CupertinoTimerPicker', codePath, CupertinoTimerPickerWidget()),
    )
  ];
}
