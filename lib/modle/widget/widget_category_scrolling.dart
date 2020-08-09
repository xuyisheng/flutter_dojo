import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/scrolling/customscrollview.dart';
import 'package:flutter_dojo/category/widgets/scrolling/draggablescrollablesheet.dart';
import 'package:flutter_dojo/category/widgets/scrolling/flexiblespacebar.dart';
import 'package:flutter_dojo/category/widgets/scrolling/gridview.dart';
import 'package:flutter_dojo/category/widgets/scrolling/listview.dart';
import 'package:flutter_dojo/category/widgets/scrolling/nestedscrollview.dart';
import 'package:flutter_dojo/category/widgets/scrolling/notificationlistener.dart';
import 'package:flutter_dojo/category/widgets/scrolling/pageview.dart';
import 'package:flutter_dojo/category/widgets/scrolling/refreshindicator.dart';
import 'package:flutter_dojo/category/widgets/scrolling/scrollbar.dart';
import 'package:flutter_dojo/category/widgets/scrolling/scrollconfiguration.dart';
import 'package:flutter_dojo/category/widgets/scrolling/scrollcontroller.dart';
import 'package:flutter_dojo/category/widgets/scrolling/singlechildscrollview.dart';
import 'package:flutter_dojo/category/widgets/scrolling/sliverfillviewport.dart';
import 'package:flutter_dojo/category/widgets/scrolling/slivergrid.dart';
import 'package:flutter_dojo/category/widgets/scrolling/sliverlist.dart';
import 'package:flutter_dojo/category/widgets/scrolling/sliveropacity.dart';
import 'package:flutter_dojo/category/widgets/scrolling/sliverpadding.dart';
import 'package:flutter_dojo/category/widgets/scrolling/sliverpersistentheader.dart';
import 'package:flutter_dojo/category/widgets/touchinteractions/scrollable.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildScrollingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'CustomScrollView',
      subtitle: 'A ScrollView that creates custom scroll effects using slivers.',
      keyword: 'CustomScrollView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html',
      buildRoute: (context) => BaseWidget('CustomScrollView', codePath + 'customscrollview', CustomScrollViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'DraggableScrollableSheet',
      subtitle: 'DraggableScrollableSheet',
      keyword: 'DraggableScrollableSheet',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html',
      buildRoute: (context) => BaseWidget(
          'DraggableScrollableSheet', codePath + 'draggablescrollablesheet', DraggableScrollableSheetWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'FlexibleSpaceBar',
      subtitle: 'FlexibleSpaceBar',
      keyword: 'FlexibleSpaceBar',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FlexibleSpaceBar-class.html',
      buildRoute: (context) => BaseWidget('FlexibleSpaceBar', codePath + 'flexiblespacebar', FlexibleSpaceBarWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'GridView',
      subtitle:
          'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.',
      keyword: 'GridView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
      buildRoute: (context) => BaseWidget('GridView', codePath + 'gridview', GridViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'ListView',
      subtitle:
          'A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.',
      keyword: 'ListView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ListView-class.html',
      buildRoute: (context) => BaseWidget('ListView', codePath + 'listview', ListViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'NestedScrollView',
      subtitle:
          'A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.',
      keyword: 'NestedScrollView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html',
      buildRoute: (context) => BaseWidget('NestedScrollView', codePath + 'nestedscrollview', NestedScrollViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'NotificationListener',
      subtitle: 'A widget that listens for Notifications bubbling up the tree.',
      keyword: 'NotificationListener',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/NotificationListener-class.html',
      buildRoute: (context) =>
          BaseWidget('NotificationListener', codePath + 'notificationlistener', NotificationListenerWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'PageView',
      subtitle: 'A scrollable list that works page by page.',
      keyword: 'PageView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/PageView-class.html',
      buildRoute: (context) => BaseWidget('PageView', codePath + 'pageview', PageViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'RefreshIndicator',
      subtitle: 'A Material Design pull-to-refresh wrapper for scrollables.',
      keyword: 'RefreshIndicator',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RefreshIndicator-class.html',
      buildRoute: (context) => BaseWidget('RefreshIndicator', codePath + 'refreshindicator', RefreshIndicatorWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'ScrollConfiguration',
      subtitle: 'Controls how Scrollable widgets behave in a subtree.',
      keyword: 'ScrollConfiguration',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ScrollConfiguration-class.html',
      buildRoute: (context) =>
          BaseWidget('ScrollConfiguration', codePath + 'scrollconfiguration', ScrollConfigurationWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'ScrollController',
      subtitle: 'ScrollController',
      keyword: 'ScrollController',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ScrollController-class.html',
      buildRoute: (context) => BaseWidget('ScrollController', codePath + 'scrollcontroller', ScrollControllerWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'Scrollable',
      subtitle:
          'Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.',
      keyword: 'Scrollable',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Scrollable-class.html',
      buildRoute: (context) =>
          BaseWidget('Scrollable', 'lib/category/widgets/touchinteractions/scrollable', ScrollableWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'Scrollbar',
      subtitle:
          'A Material Design scrollbar. A scrollbar indicates which portion of a Scrollable widget is actually visible.',
      keyword: 'Scrollbar',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Scrollbar-class.html',
      buildRoute: (context) => BaseWidget('Scrollbar', codePath + 'scrollbar', ScrollbarWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SingleChildScrollView',
      subtitle:
          'A box in which a single widget can be scrolled. This widget is useful when you have a single box that will normally be entirely visible, for example a clock face in a time picker, but you need to make sure it can be scrolled if the container gets too small in one axis (the scroll direction).',
      keyword: 'SingleChildScrollView',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html',
      buildRoute: (context) =>
          BaseWidget('SingleChildScrollView', codePath + 'singlechildscrollview', SingleChildScrollViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverFillViewport',
      subtitle: 'SliverFillViewport',
      keyword: 'SliverFillViewport',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverFillViewport-class.html',
      buildRoute: (context) =>
          BaseWidget('SliverFillViewport', codePath + 'sliverfillviewport', SliverFillViewportWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverFixedExtentList',
      subtitle: 'SliverFixedExtentList',
      keyword: 'SliverFixedExtentList',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverFixedExtentList-class.html',
      buildRoute: (context) =>
          BaseWidget('SliverFixedExtentList', codePath + 'customscrollview', CustomScrollViewWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverGrid',
      subtitle: 'SliverGrid',
      keyword: 'SliverGrid',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverGrid-class.html',
      buildRoute: (context) => BaseWidget('SliverGrid', codePath + 'slivergrid', SliverGridWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverList',
      subtitle: 'SliverList',
      keyword: 'SliverList',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverList-class.html',
      buildRoute: (context) => BaseWidget('SliverList', codePath + 'sliverlist', SliverListWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverOpacity',
      subtitle: 'SliverOpacity',
      keyword: 'SliverOpacity',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverOpacity-class.html',
      buildRoute: (context) => BaseWidget('SliverOpacity', codePath + 'sliveropacity', SliverOpacityWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverPadding',
      subtitle: 'SliverPadding',
      keyword: 'SliverPadding',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverPadding-class.html',
      buildRoute: (context) => BaseWidget('SliverPadding', codePath + 'sliverpadding', SliverPaddingWidget()),
    ),
    DemoItem(
      icon: Icons.screen_rotation,
      title: 'SliverPersistentHeader',
      subtitle: 'SliverPersistentHeader',
      keyword: 'SliverPersistentHeader',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/SliverPersistentHeader-class.html',
      buildRoute: (context) =>
          BaseWidget('SliverPersistentHeader', codePath + 'sliverpersistentheader', SliverPersistentHeaderWidget()),
    ),
  ];
}
