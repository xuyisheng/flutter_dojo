import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/assetbundle.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/icon.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/icondata.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/icontheme.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/image.dart';
import 'package:flutter_dojo/widgets/assetsimageicon/rawimage.dart';

List<DemoItem> buildAssetsImageIconDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.assessment,
      title: 'AssetBundle',
      subtitle: 'Asset bundles contain resources, such as images and strings, that can be used by an application. ',
      documentationUrl: 'https://api.flutter.dev/flutter/services/AssetBundle-class.html',
      buildRoute: (context) => BaseWidget('AssetBundle', codePath, AssetBundleWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'Icon',
      subtitle: 'A Material Design icon.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
      buildRoute: (context) => BaseWidget('Icon', codePath, IconWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'IconData',
      subtitle: 'IconData',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IconData-class.html',
      buildRoute: (context) => BaseWidget('IconData', codePath, IconDataWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'IconTheme',
      subtitle: 'IconTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/IconTheme-class.html',
      buildRoute: (context) => BaseWidget('IconTheme', codePath, IconThemeWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'Image',
      subtitle: 'A widget that displays an image.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
      buildRoute: (context) => BaseWidget('Image', codePath, ImageWidget()),
    ),
    DemoItem(
      icon: Icons.assessment,
      title: 'RawImage',
      subtitle: 'A widget that displays a dart:ui.Image directly.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RawImage-class.html',
      buildRoute: (context) => BaseWidget('RawImage', codePath, RawImageWidget()),
    )
  ];
}
