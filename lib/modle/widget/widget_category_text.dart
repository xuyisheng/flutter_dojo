import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/text/defaulttextstyle.dart';
import 'package:flutter_dojo/category/widgets/text/richtext.dart';
import 'package:flutter_dojo/category/widgets/text/text.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildTextDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.text_format,
      title: 'DefaultTextStyle',
      subtitle: 'The text style to apply to descendant Text widgets without explicit style.',
      keyword: 'DefaultTextStyle',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html',
      buildRoute: (context) => BaseWidget('DefaultTextStyle', codePath + 'defaulttextstyle', DefaultTextStyleWidget()),
    ),
    DemoItem(
      icon: Icons.text_format,
      title: 'RichText',
      subtitle:
          'The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
      keyword: 'RichText',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RichText-class.html',
      buildRoute: (context) => BaseWidget('RichText', codePath + 'richtext', RichTextWidget()),
    ),
    DemoItem(
      icon: Icons.text_format,
      title: 'Text',
      subtitle: 'A run of text with a single style.',
      keyword: 'Text',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
      buildRoute: (context) => BaseWidget('Text', codePath + 'text', TextWidget()),
    )
  ];
}
