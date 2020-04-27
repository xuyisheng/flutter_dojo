import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/pattern/appbar/appbar.dart';
import 'package:flutter_dojo/category/pattern/appbar/customappbar.dart';
import 'package:flutter_dojo/category/pattern/appbar/floatingappbar.dart';
import 'package:flutter_dojo/category/pattern/appbar/gallerybar.dart';
import 'package:flutter_dojo/category/pattern/appbar/titledbottombar.dart';
import 'package:flutter_dojo/category/pattern/curve/curvefitting.dart';
import 'package:flutter_dojo/category/pattern/curve/curves.dart';
import 'package:flutter_dojo/category/pattern/curve/interpolator.dart';
import 'package:flutter_dojo/category/pattern/curve/shapeborder.dart';
import 'package:flutter_dojo/category/pattern/display/backdrop.dart';
import 'package:flutter_dojo/category/pattern/display/dashedline.dart';
import 'package:flutter_dojo/category/pattern/display/delline.dart';
import 'package:flutter_dojo/category/pattern/display/rating.dart';
import 'package:flutter_dojo/category/pattern/display/visibility.dart';
import 'package:flutter_dojo/category/pattern/imageeffect/drawimage.dart';
import 'package:flutter_dojo/category/pattern/imageeffect/roundimage.dart';
import 'package:flutter_dojo/category/pattern/imageeffect/shadowmask.dart';
import 'package:flutter_dojo/category/pattern/list/avatarlist.dart';
import 'package:flutter_dojo/category/pattern/list/itemlayout.dart';
import 'package:flutter_dojo/category/pattern/list/listdetail.dart';
import 'package:flutter_dojo/category/pattern/list/overflow.dart';
import 'package:flutter_dojo/category/pattern/list/pullrefresh.dart';
import 'package:flutter_dojo/category/pattern/list/searchlist.dart';
import 'package:flutter_dojo/category/pattern/list/sliverheader.dart';
import 'package:flutter_dojo/category/pattern/list/sliverheaderwitheffect.dart';
import 'package:flutter_dojo/category/pattern/list/tree.dart';
import 'package:flutter_dojo/category/pattern/list/zoom.dart';
import 'package:flutter_dojo/category/pattern/login/login1.dart';
import 'package:flutter_dojo/category/pattern/login/login2.dart';
import 'package:flutter_dojo/category/pattern/paint/bubble.dart';
import 'package:flutter_dojo/category/pattern/paint/clock.dart';
import 'package:flutter_dojo/category/pattern/paint/color.dart';
import 'package:flutter_dojo/category/pattern/paint/custompaint1.dart';
import 'package:flutter_dojo/category/pattern/paint/drawstyle.dart';
import 'package:flutter_dojo/category/pattern/paint/feedback.dart';
import 'package:flutter_dojo/category/pattern/paint/gesturepainter.dart';
import 'package:flutter_dojo/category/pattern/paint/gesturescale.dart';
import 'package:flutter_dojo/category/pattern/paint/layer.dart';
import 'package:flutter_dojo/category/pattern/paint/layerblendmode.dart';
import 'package:flutter_dojo/category/pattern/paint/matrix4.dart';
import 'package:flutter_dojo/category/pattern/paint/nstar.dart';
import 'package:flutter_dojo/category/pattern/paint/randomcolor.dart';
import 'package:flutter_dojo/category/pattern/paint/repaintboundary.dart';
import 'package:flutter_dojo/category/pattern/perspective/flipcard.dart';
import 'package:flutter_dojo/category/pattern/perspective/rollcard.dart';
import 'package:flutter_dojo/category/pattern/perspective/show3dpage.dart';
import 'package:flutter_dojo/category/pattern/popup/floating.dart';
import 'package:flutter_dojo/category/pattern/popup/popup.dart';
import 'package:flutter_dojo/category/pattern/popup/toast.dart';
import 'package:flutter_dojo/category/pattern/profile/profile1.dart';
import 'package:flutter_dojo/category/pattern/renderinfo/position.dart';
import 'package:flutter_dojo/category/pattern/renderinfo/screenorientation.dart';
import 'package:flutter_dojo/category/pattern/renderinfo/size.dart';
import 'package:flutter_dojo/category/pattern/renderinfo/systemui.dart';
import 'package:flutter_dojo/category/pattern/setting/menusetting.dart';
import 'package:flutter_dojo/category/pattern/setting/setting1.dart';
import 'package:flutter_dojo/category/pattern/texteffect/autofold.dart';
import 'package:flutter_dojo/category/pattern/texteffect/badge.dart';
import 'package:flutter_dojo/category/pattern/texteffect/drawtext.dart';
import 'package:flutter_dojo/category/pattern/texteffect/linemetrics.dart';
import 'package:flutter_dojo/category/pattern/texteffect/marquee.dart';
import 'package:flutter_dojo/category/pattern/viewpager/animslider.dart';
import 'package:flutter_dojo/category/pattern/viewpager/cardflip.dart';
import 'package:flutter_dojo/category/pattern/viewpager/guide.dart';
import 'package:flutter_dojo/category/pattern/viewpager/pagechangeanim.dart';
import 'package:flutter_dojo/category/pattern/viewpager/pagereveal.dart';
import 'package:flutter_dojo/category/pattern/viewpager/parallaxviewpager.dart';
import 'package:flutter_dojo/category/pattern/viewpager/slider.dart';
import 'package:flutter_dojo/category/pattern/viewpager/transformslider.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItemCategory> buildPatternData = <DemoItemCategory>[
  DemoItemCategory(
    name: "AppBar",
    list: buildAppbarDemoItems('lib/category/pattern/appbar/'),
  ),
  DemoItemCategory(
    name: "Curve",
    list: buildCurveDemoItems('lib/category/pattern/curve/'),
  ),
  DemoItemCategory(
    name: "Display",
    list: buildDisplayDemoItems('lib/category/pattern/display/'),
  ),
  DemoItemCategory(
    name: "ImageEffect",
    list: buildImageEffectDemoItems('lib/category/pattern/imageeffect/'),
  ),
  DemoItemCategory(
    name: "List",
    list: buildListDemoItems('lib/category/pattern/list/'),
  ),
  DemoItemCategory(
    name: "Login",
    list: buildLoginDemoItems('lib/category/pattern/login/'),
  ),
  DemoItemCategory(
    name: "Paint",
    list: buildPaintDemoItems('lib/category/pattern/paint/'),
  ),
  DemoItemCategory(
    name: "Popup",
    list: buildPopupDemoItems('lib/category/pattern/popup/'),
  ),
  DemoItemCategory(
    name: "Profile",
    list: buildProfileDemoItems('lib/category/pattern/profile/'),
  ),
  DemoItemCategory(
    name: "Perspective",
    list: buildPerspectiveDemoItems('lib/category/pattern/perspective/'),
  ),
  DemoItemCategory(
    name: "RenderInfo",
    list: buildRenderInfoDemoItems('lib/category/pattern/renderinfo/'),
  ),
  DemoItemCategory(
    name: "Setting",
    list: buildSettingDemoItems('lib/category/pattern/setting/'),
  ),
  DemoItemCategory(
    name: "TextEffect",
    list: buildTextEffectDemoItems('lib/category/pattern/texteffect/'),
  ),
  DemoItemCategory(
    name: 'ViewPager',
    list: buildViewPagerDemoItems('lib/category/pattern/viewpager/'),
  ),
];

List<DemoItem> buildViewPagerDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'AnimSlider',
      subtitle: 'AnimSlider',
      keyword: 'AnimSlider',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AnimSlider', codePath + 'animslider', AnimSliderWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'CardFlip',
      subtitle: 'CardFlip',
      keyword: 'CardFlip',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CardFlip', codePath + 'cardflip', CardFlipWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Guide',
      subtitle: 'Guide',
      keyword: 'Guide',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Guide', codePath + 'guide', GuideWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'PageChangeAnim',
      subtitle: 'Page Change Anim',
      keyword: 'PageChangeAnim',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('PageChangeAnim', codePath + 'pagechangeanim', PageChangeAnimWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'PageReveal',
      subtitle: 'PageReveal',
      keyword: 'PageReveal',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('PageReveal', codePath + 'pagereveal', PageRevealWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ParallaxViewPager',
      subtitle: 'Parallax ViewPager',
      keyword: 'ParallaxViewPager',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ParallaxViewPager', codePath + 'parallaxviewpager', ParallaxViewPagerWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Slider',
      subtitle: 'Slider',
      keyword: 'Slider',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Slider', codePath + 'slider', SliderWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'TransformSlider',
      subtitle: 'TransformSlider',
      keyword: 'TransformSlider',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('TransformSlider', codePath + 'transformslider', TransformSliderWidget()),
    ),
  ];
}

List<DemoItem> buildAppbarDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Appbar',
      subtitle: 'Appbar',
      keyword: 'Appbar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Appbar', codePath + 'appbar', AppbarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'CustomAppbar',
      subtitle: 'CustomAppbar',
      keyword: 'CustomAppbar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomAppbar', codePath + 'customappbar', CustomAppBarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'FloatingAppBar',
      subtitle: 'FloatingAppBar',
      keyword: 'FloatingAppBar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('FloatingAppBar', codePath + 'floatingappbar', FloatingAppBarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'GalleryBar',
      subtitle: 'GalleryBar',
      keyword: 'GalleryBar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('GalleryBar', codePath + 'gallerybar', GalleryBar()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'TitledBottomBar',
      subtitle: 'TitledBottomBar',
      keyword: 'TitledBottomBar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('TitledBottomBar', codePath + 'titledbottombar', TitledBottomBarWidget()),
    ),
  ];
}

List<DemoItem> buildPerspectiveDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'FlipCard',
      subtitle: 'FlipCard',
      keyword: 'FlipCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('FlipCard', codePath + 'flipcard', FlipCardWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'RollCard',
      subtitle: 'RollCard',
      keyword: 'RollCard',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RollCard', codePath + 'rollcard', RollCardWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Show3DPage',
      subtitle: 'Show3DPage',
      keyword: 'Show3DPage',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Show3DPage', codePath + 'show3dpage', Show3DPageWidget()),
    ),
  ];
}

List<DemoItem> buildListDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'AvatarList',
      subtitle: 'AvatarList',
      keyword: 'AvatarList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AvatarList', codePath + 'avatarlist', AvatarListWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ItemLayout',
      subtitle: 'ItemLayout',
      keyword: 'ItemLayout',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ItemLayout', codePath + 'itemlayout', ItemLayoutWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ListDetail',
      subtitle: 'ListDetail',
      keyword: 'ListDetail',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ListDetail', codePath + 'listdetail', ListDetailWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Overflow',
      subtitle: 'Overflow',
      keyword: 'Overflow',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Overflow', codePath + 'overflow', OverflowWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'PullRefresh',
      subtitle: 'PullRefresh',
      keyword: 'PullRefresh',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('PullRefresh', codePath + 'pullrefresh', PullRefreshWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'SearchList',
      subtitle: 'SearchList',
      keyword: 'SearchList',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SearchList', codePath + 'searchlist', SearchListWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'SliverHeader',
      subtitle: 'SliverHeader',
      keyword: 'SliverHeader',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SliverHeader', codePath + 'sliverheader', SliverHeaderWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'SliverHeaderWithEffect',
      subtitle: 'SliverHeaderWithEffect',
      keyword: 'SliverHeaderWithEffect',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SliverHeaderWithEffect', codePath + 'sliverheaderwitheffect', SliverHeaderWithEffectWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Tree',
      subtitle: 'Tree',
      keyword: 'Tree',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Tree', codePath + 'tree', TreeWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Zoom',
      subtitle: 'Zoom',
      keyword: 'Zoom',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Zoom', codePath + 'zoom', ZoomWidget()),
    ),
  ];
}

List<DemoItem> buildLoginDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Login1',
      subtitle: 'Login1',
      keyword: 'Login1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Login1', codePath + 'login1', Login1Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Login2',
      subtitle: 'Login2',
      keyword: 'Login2',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Login2', codePath + 'login2', Login2()),
    ),
  ];
}

List<DemoItem> buildSettingDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'MenuSetting',
      subtitle: 'MenuSetting',
      keyword: 'MenuSetting',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('MenuSetting', codePath + 'menusetting', MenuSettingWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Setting1',
      subtitle: 'Setting1',
      keyword: 'Setting1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Setting1', codePath + 'setting1', Setting1Widget()),
    ),
  ];
}

List<DemoItem> buildProfileDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Profile1',
      subtitle: 'Profile1',
      keyword: 'Profile1',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Profile1', codePath + 'profile1', Profile1Widget()),
    ),
  ];
}

List<DemoItem> buildTextEffectDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'AutoFold',
      subtitle: 'AutoFold',
      keyword: 'AutoFold',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('AutoFold', codePath + 'autofold', AutoFoldWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Badge',
      subtitle: 'Badge',
      keyword: 'Badge',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Badge', codePath + 'badge', BadgeWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'DrawText',
      subtitle: 'DrawText',
      keyword: 'DrawText',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DrawText', codePath + 'drawtext', DrawTextWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'LineMetrics',
      subtitle: 'LineMetrics',
      keyword: 'LineMetrics',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('LineMetrics', codePath + 'linemetrics', LineMetricsWidget()),
    ),DemoItem(
      icon: Icons.pages,
      title: 'Marquee',
      subtitle: 'Marquee',
      keyword: 'Marquee',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Marquee', codePath + 'marquee', MarqueeWidget()),
    ),
  ];
}

List<DemoItem> buildRenderInfoDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Position',
      subtitle: 'Widget Position',
      keyword: 'Position',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Position', codePath + 'position', PositionWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ScreenOrientation',
      subtitle: 'ScreenOrientation',
      keyword: 'ScreenOrientation',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ScreenOrientation', codePath + 'screenorientation', ScreenOrientationWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Size',
      subtitle: 'Widget Size',
      keyword: 'Size',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Size', codePath + 'size', SizeWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'SystemUI',
      subtitle: 'SystemUI',
      keyword: 'SystemUI',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('SystemUI', codePath + 'systemui', SystemUIWidget()),
    ),
  ];
}

List<DemoItem> buildPopupDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Floating',
      subtitle: 'Floating',
      keyword: 'Floating',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Floating', codePath + 'floating', FloatingWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Popup',
      subtitle: 'Popup',
      keyword: 'Popup',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Popup', codePath + 'popup', PopupWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Toast',
      subtitle: 'Toast',
      keyword: 'Toast',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Toast', codePath + 'toast', ToastWidget()),
    ),
  ];
}

List<DemoItem> buildPaintDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Bubble',
      subtitle: 'Bubble',
      keyword: 'Bubble',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Bubble', codePath + 'bubble', BubbleWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Clock',
      subtitle: 'Clock',
      keyword: 'Clock',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Clock', codePath + 'clock', ClockWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Color',
      subtitle: 'Color',
      keyword: 'Color',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Color', codePath + 'color', ColorWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'CustomPaint',
      subtitle: 'CustomPaint',
      keyword: 'CustomPaint',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CustomPaint', codePath + 'custompaint1', CustomPaint1Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'DrawStyle',
      subtitle: 'DrawStyle',
      keyword: 'DrawStyle',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DrawStyle', codePath + 'drawstyle', DrawStyleWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Feedback',
      subtitle: 'Feedback',
      keyword: 'Feedback',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Feedback', codePath + 'feedback', FeedbackWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'GesturePainter',
      subtitle: 'GesturePainter',
      keyword: 'GesturePainter',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('GesturePainter', codePath + 'gesturepainter', GesturePainterWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'GestureScale',
      subtitle: 'GestureScale',
      keyword: 'GestureScale',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('GestureScale', codePath + 'gesturescale', GestureScaleWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Layer',
      subtitle: 'Layer',
      keyword: 'Layer',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Layer', codePath + 'layer', LayerWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'LayerBlendMode',
      subtitle: 'LayerBlendMode',
      keyword: 'LayerBlendMode',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('LayerBlendMode', codePath + 'layerblendmode', LayerBlendModeWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Matrix4',
      subtitle: 'Matrix4',
      keyword: 'Matrix4',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Matrix4', codePath + 'matrix4', Matrix4Widget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'NStar',
      subtitle: 'NStar',
      keyword: 'NStar',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('NStar', codePath + 'nstar', NStarWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'RandomColor',
      subtitle: 'RandomColor',
      keyword: 'RandomColor',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RandomColor', codePath + 'randomcolor', RandomColorWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'RepaintBoundary',
      subtitle: 'RepaintBoundary',
      keyword: 'RepaintBoundary',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RepaintBoundary', codePath + 'repaintboundary', RepaintBoundaryWidget()),
    ),
  ];
}

List<DemoItem> buildImageEffectDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'DrawImage',
      subtitle: 'DrawImage',
      keyword: 'DrawImage',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DrawImage', codePath + 'drawimage', DrawImageWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'RoundImage',
      subtitle: 'RoundImage',
      keyword: 'RoundImage',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('RoundImage', codePath + 'roundimage', RoundImageWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ShadowMask',
      subtitle: 'ShadowMask',
      keyword: 'ShadowMask',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ShadowMask', codePath + 'shadowmask', ShadowMaskWidget()),
    ),
  ];
}

List<DemoItem> buildCurveDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'CurveFitting',
      subtitle: 'CurveFitting',
      keyword: 'CurveFitting',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('CurveFitting', codePath + 'curvefitting', CurveFittingWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Curves',
      subtitle: 'Curves',
      keyword: 'Curves',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Curves', codePath + 'curves', CurvesWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Interpolator',
      subtitle: 'Interpolator',
      keyword: 'Interpolator',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Interpolator', codePath + 'interpolator', InterpolatorWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'ShapeBorder',
      subtitle: 'ShapeBorder',
      keyword: 'ShapeBorder',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('ShapeBorder', codePath + 'shapeborder', ShapeBorderWidget()),
    ),
  ];
}

List<DemoItem> buildDisplayDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.pages,
      title: 'Backdrop',
      subtitle: 'Backdrop',
      keyword: 'Backdrop',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Backdrop', codePath + 'backdrop', BackdropWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'DashedLine',
      subtitle: 'DashedLine',
      keyword: 'DashedLine',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DashedLine', codePath + 'dashedline', DashedLineWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'DelLine',
      subtitle: 'DelLine',
      keyword: 'DelLine',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('DelLine', codePath + 'delline', DelLineWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Rating',
      subtitle: 'Rating',
      keyword: 'Rating',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Rating', codePath + 'rating', RatingWidget()),
    ),
    DemoItem(
      icon: Icons.pages,
      title: 'Visibility',
      subtitle: 'Visibility',
      keyword: 'Visibility',
      documentationUrl: '',
      buildRoute: (context) => BaseWidget('Visibility', codePath + 'visibility', VisibilityWidget()),
    ),
  ];
}
