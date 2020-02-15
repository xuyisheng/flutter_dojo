import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/pages/pattern/pattern_mainpage.dart';
import 'package:flutter_dojo/pattern/appbar/appbar.dart';
import 'package:flutter_dojo/pattern/appbar/customappbar.dart';
import 'package:flutter_dojo/pattern/appbar/floatingappbar.dart';
import 'package:flutter_dojo/pattern/appbar/titledbottombar.dart';
import 'package:flutter_dojo/pattern/custompaint/custompaint1.dart';
import 'package:flutter_dojo/pattern/display/avatarlist.dart';
import 'package:flutter_dojo/pattern/display/badge.dart';
import 'package:flutter_dojo/pattern/display/bubble.dart';
import 'package:flutter_dojo/pattern/display/layer.dart';
import 'package:flutter_dojo/pattern/display/layerblendmode.dart';
import 'package:flutter_dojo/pattern/display/overflow.dart';
import 'package:flutter_dojo/pattern/display/toast.dart';
import 'package:flutter_dojo/pattern/gesture/gesturescale.dart';
import 'package:flutter_dojo/pattern/list/backdrop.dart';
import 'package:flutter_dojo/pattern/list/searchlist.dart';
import 'package:flutter_dojo/pattern/list/tree.dart';
import 'package:flutter_dojo/pattern/listitem/itemlayout.dart';
import 'package:flutter_dojo/pattern/login/login1.dart';
import 'package:flutter_dojo/pattern/perspective/flipcard.dart';
import 'package:flutter_dojo/pattern/perspective/rollcard.dart';
import 'package:flutter_dojo/pattern/perspective/show3dpage.dart';
import 'package:flutter_dojo/pattern/profile/profile1.dart';
import 'package:flutter_dojo/pattern/setting/menusetting.dart';
import 'package:flutter_dojo/pattern/setting/setting1.dart';
import 'package:flutter_dojo/pattern/viewpager/anim_slider.dart';
import 'package:flutter_dojo/pattern/viewpager/pagechangeanim.dart';
import 'package:flutter_dojo/pattern/viewpager/parallaxviewpager.dart';
import 'package:flutter_dojo/pattern/viewpager/slider.dart';

List<Entry> buildPatternData = <Entry>[
  Entry(
    'Appbar',
    buildAppbarDemoItems('lib/pattern/appbar/'),
  ),
  Entry(
    'CustomPaint',
    buildCustomPaintDemoItems('lib/pattern/custompaint/'),
  ),
  Entry(
    'Gesture',
    buildGestureDemoItems('lib/pattern/gesture/'),
  ),
  Entry(
    'ListItem',
    buildListItemDemoItems('lib/pattern/listitem/'),
  ),
  Entry(
    'List',
    buildListDemoItems('lib/pattern/scrollanimation/'),
  ),
  Entry(
    'Login',
    buildLoginDemoItems('lib/pattern/login/'),
  ),
  Entry(
    'Perspective',
    buildPerspectiveDemoItems('lib/pattern/perspective/'),
  ),
  Entry(
    'Profile',
    buildProfileDemoItems('lib/pattern/profile/'),
  ),
  Entry(
    'Setting',
    buildSettingDemoItems('lib/pattern/setting/'),
  ),
  Entry(
    'ViewPager',
    buildViewPagerDemoItems('lib/pattern/viewpager/'),
  ),
  Entry(
    'Widget Display',
    buildWidgetDisplayDemoItems('lib/pattern/display/'),
  ),
];

List<DemoItem> buildViewPagerDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'ParallaxViewPager',
      subtitle: 'Parallax ViewPager',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ParallaxViewPager', codePath, ParallaxViewPagerWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'PageChangeAnim',
      subtitle: 'Page Change Anim',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('PageChangeAnim', codePath, PageChangeAnimWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Slider',
      subtitle: 'Slider',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Slider', codePath, SliderWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'AnimSlider',
      subtitle: 'AnimSlider',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AnimSlider', codePath, AnimSliderWidget()),
    ),
  ];
}

List<DemoItem> buildWidgetDisplayDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Badge',
      subtitle: 'Badge',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Badge', codePath, BadgeWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Bubble',
      subtitle: 'Bubble',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Bubble', codePath, BubbleWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'AvatarList',
      subtitle: 'AvatarList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AvatarList', codePath, AvatarListWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Toast',
      subtitle: 'Toast',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Toast', codePath, ToastWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Layer',
      subtitle: 'Layer',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Layer', codePath, LayerWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'LayerBlendMode',
      subtitle: 'LayerBlendMode',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('LayerBlendMode', codePath, LayerBlendModeWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Overflow',
      subtitle: 'Overflow',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Overflow', codePath, OverflowWidget()),
    ),
  ];
}

List<DemoItem> buildAppbarDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Appbar',
      subtitle: 'Appbar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Appbar', codePath, AppbarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'CustomAppbar',
      subtitle: 'CustomAppbar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomAppbar', codePath, CustomAppBarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'TitledBottomBar',
      subtitle: 'TitledBottomBar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('TitledBottomBar', codePath, TitledBottomBarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'FloatingAppBar',
      subtitle: 'FloatingAppBar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('FloatingAppBar', codePath, FloatingAppBarWidget()),
    ),
  ];
}

List<DemoItem> buildListItemDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'ItemLayout',
      subtitle: 'ItemLayout',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ItemLayout', codePath, ItemLayoutWidget()),
    ),
  ];
}

List<DemoItem> buildPerspectiveDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Show3DPage',
      subtitle: 'Show3DPage',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Show3DPage', codePath, Show3DPageWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'RollCard',
      subtitle: 'RollCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RollCard', codePath, RollCardWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'FlipCard',
      subtitle: 'FlipCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('FlipCard', codePath, FlipCardWidget()),
    ),
  ];
}

List<DemoItem> buildListDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'SearchList',
      subtitle: 'SearchList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SearchList', codePath, SearchListWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Backdrop',
      subtitle: 'Backdrop',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Backdrop', codePath, BackdropWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Tree',
      subtitle: 'Tree',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Tree', codePath, TreeWidget()),
    ),
  ];
}

List<DemoItem> buildGestureDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'GestureScale',
      subtitle: 'GestureScale',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('GestureScale', codePath, GestureScaleWidget()),
    ),
  ];
}

List<DemoItem> buildLoginDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Login1',
      subtitle: 'Login1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Login1', codePath, Login1Widget()),
    ),
  ];
}

List<DemoItem> buildSettingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Setting1',
      subtitle: 'Setting1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Setting1', codePath, Setting1Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'MenuSetting',
      subtitle: 'MenuSetting',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('MenuSetting', codePath, MenuSettingWidget()),
    ),
  ];
}

List<DemoItem> buildProfileDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Profile1',
      subtitle: 'Profile1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Profile1', codePath, Profile1Widget()),
    ),
  ];
}

List<DemoItem> buildCustomPaintDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'CustomPaint1',
      subtitle: 'CustomPaint1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomPaint', codePath, CustomPaint1Widget()),
    ),
  ];
}
