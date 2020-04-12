import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/assetbundle.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/icon.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/icondata.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/icontheme.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/image.dart';
import 'package:flutter_dojo/category/widgets/assetsimageicon/rawimage.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildAssetsImageIconDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.assessment,
      title: 'AssetBundle',
      subtitle: 'Asset bundles contain resources, such as images and strings, that can be used by an application. ',
      documentationUrl: 'https://api.flutter.dev/flutter/services/AssetBundle-class.html',
      buildRoute: (context) => BaseWidget('AssetBundle', codePath + 'assetbundle', AssetBundleWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'Icon',
      subtitle: 'A Material Design icon.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
      buildRoute: (context) => BaseWidget('Icon', codePath + 'icon', IconWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'IconData',
      subtitle: 'IconData',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IconData-class.html',
      buildRoute: (context) => BaseWidget('IconData', codePath + 'icondata', IconDataWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'IconTheme',
      subtitle: 'IconTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IconTheme-class.html',
      buildRoute: (context) => BaseWidget('IconTheme', codePath + 'icontheme', IconThemeWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'Image',
      subtitle: 'A widget that displays an image.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
      buildRoute: (context) => BaseWidget('Image', codePath + 'image', ImageWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'RawImage',
      subtitle: 'A widget that displays a dart:ui.Image directly.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RawImage-class.html',
      buildRoute: (context) => BaseWidget('RawImage', codePath + 'rawimage', RawImageWidget()),
    )
  ];
}
