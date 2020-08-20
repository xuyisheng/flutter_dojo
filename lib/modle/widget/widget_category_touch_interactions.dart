import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/absorbpointer.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/dismissible.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/draggable.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/dragtarget.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/gesturedetector.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/ignorepointer.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/listener.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/longpressdraggable.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/rawgesturedetector.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/scrollable.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/willpopscope.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildTouchInteractionsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.touch_app,
      title: 'AbsorbPointer',
      subtitle: 'A widget that absorbs pointers during hit testing.',
      keyword: 'AbsorbPointer',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/AbsorbPointer-class.html',
      buildRoute: (context) => BaseWidget('AbsorbPointer', codePath + 'absorbpointer', AbsorbPointerWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'Dismissible',
      subtitle: 'A widget that can be dismissed by dragging in the indicated direction.',
      keyword: 'Dismissible',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Dismissible-class.html',
      buildRoute: (context) => BaseWidget('Dismissible', codePath + 'dismissible', DismissibleWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'DragTarget',
      subtitle: 'A widget that receives data when a Draggable widget is dropped.',
      keyword: 'DragTarget',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DragTarget-class.html',
      buildRoute: (context) => BaseWidget('DragTarget', codePath + 'dragtarget', DragTargetWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'Draggable',
      subtitle: 'A widget that can be dragged from to a DragTarget.',
      keyword: 'Draggable',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Draggable-class.html',
      buildRoute: (context) => BaseWidget('Draggable', codePath + 'draggable', DraggableWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'GestureDetector',
      subtitle: 'A widget that detects gestures.',
      keyword: 'GestureDetector',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/GestureDetector-class.html',
      buildRoute: (context) => BaseWidget('GestureDetector', codePath + 'gesturedetector', GestureDetectorWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'IgnorePointer',
      subtitle: 'A widget that is invisible during hit testing.',
      keyword: 'IgnorePointer',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IgnorePointer-class.html',
      buildRoute: (context) => BaseWidget('IgnorePointer', codePath + 'ignorepointer', IgnorePointerWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'Listener',
      subtitle: 'A widget that calls callbacks in response to common pointer events.',
      keyword: 'Listener',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Listener-class.html',
      buildRoute: (context) => BaseWidget('Listener', codePath + 'listener', ListenerWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'LongPressDraggable',
      subtitle: 'Makes its child draggable starting from long press.',
      keyword: 'LongPressDraggable',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/LongPressDraggable-class.html',
      buildRoute: (context) => BaseWidget('LongPressDraggable', codePath + 'longpressdraggable', LongPressDraggableWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'RawGestureDetector',
      subtitle: 'A widget that detects gestures described by the given gesture factories.',
      keyword: 'RawGestureDetector',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RawGestureDetector-class.html',
      buildRoute: (context) => BaseWidget('RawGestureDetector', codePath + 'rawgesturedetector', RawGestureDetectorWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'Scrollable',
      subtitle: 'Scrollable implements the interaction model for a scrollable widget.',
      keyword: 'Scrollable',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Scrollable-class.html',
      buildRoute: (context) => BaseWidget('Scrollable', codePath + 'scrollable', ScrollableWidget()),
    ),
    DemoItem(
      icon: Icons.touch_app,
      title: 'WillPopScope',
      subtitle: 'Registers a callback to veto attempts by the user to dismiss the enclosing [ModalRoute].',
      keyword: 'WillPopScope',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/WillPopScope-class.html',
      buildRoute: (context) => BaseWidget('WillPopScope', codePath + 'willpopscope', WillPopScopeWidget()),
    )
  ];
}
