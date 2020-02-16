import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class TextWidget extends StatefulWidget {
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  var decorationStyle = TextDecorationStyle.solid;
  var decorationType = TextDecoration.underline;
  var softWrapSelection = true;
  var overflowSelection = TextOverflow.ellipsis;
  var textAlign = TextAlign.left;
  var justifyEnable = false;
  var textScaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Text基本使用'),
        Text('Simple text'),
        SubtitleWidget('文本方向'),
        Text(
          '文本方向 rtl',
          textDirection: TextDirection.rtl,
        ),
        MainTitleWidget('TextAlign'),
        MultiSelectionWidget('TextAlign', TextAlign.values, TextAlign.values, (value) {
          setState(() => textAlign = value);
        }),
        Text(
          'TextAlign',
          textAlign: textAlign,
        ),
        SizedBox(height: 16),
        MainTitleWidget('Justify'),
        Row(
          children: <Widget>[
            Text('toggle justify'),
            Switch(
              value: justifyEnable,
              onChanged: (value) {
                setState(() => justifyEnable = value);
              },
            ),
          ],
        ),
        Text(
          'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
          textAlign: justifyEnable ? TextAlign.justify : TextAlign.left,
        ),
        SizedBox(height: 16),
        MainTitleWidget('Text Decoration'),
        Text(
          'Some Text In Flutter',
          style: TextStyle(
            fontSize: 20,
            decoration: decorationType,
            decorationStyle: decorationStyle,
          ),
        ),
        MultiSelectionWidget(
          'DecorationStyle',
          TextDecorationStyle.values,
          TextDecorationStyle.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
          (value) {
            setState(() => decorationStyle = value);
          },
        ),
        MultiSelectionWidget(
          'DecorationType',
          [
            TextDecoration.underline,
            TextDecoration.none,
            TextDecoration.lineThrough,
            TextDecoration.overline,
          ],
          [
            'underline',
            'none',
            'lineThrough',
            'overline',
          ],
          (value) {
            setState(() => decorationType = value);
          },
        ),
        SubtitleWidget('Shadow in Text'),
        Text(
          '文字阴影',
          style: TextStyle(
            shadows: [
              Shadow(
                color: Colors.red,
                offset: Offset(1, 1),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        MainTitleWidget('Text SoftWrap'),
        Text(
          '换行测试' * 10,
          softWrap: softWrapSelection,
        ),
        MultiSelectionWidget(
          'SoftWrap',
          [true, false],
          [true, false],
          (value) {
            setState(() => softWrapSelection = value);
          },
        ),
        MainTitleWidget('Text Overflow'),
        Text(
          '换行溢出样式' * 20,
          maxLines: 2,
          overflow: overflowSelection,
        ),
        MultiSelectionWidget(
          'Overflow',
          TextOverflow.values,
          TextOverflow.values,
          (value) {
            setState(() => overflowSelection = value);
          },
        ),
        MainTitleWidget('TextStyle'),
        Text(
          '文本Style' * 3,
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            backgroundColor: Colors.blue,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
          ),
        ),
        MainTitleWidget('StrutStyle'),
        SubtitleWidget('height 设置行高 leading 设置行间距'),
        Container(
          color: Colors.red,
          child: Text(
            'StrutStyle ' * 20,
            strutStyle: StrutStyle(
              height: 2,
              leading: 2,
            ),
          ),
        ),
        MainTitleWidget('textScaleFactor'),
        Text(
          'textScaleFactor',
          textScaleFactor: textScaleFactor,
        ),
        Row(
          children: <Widget>[
            Text('ScaleFactor'),
            Slider(
                max: 3,
                min: 0.1,
                value: textScaleFactor,
                onChanged: (v) {
                  setState(() => textScaleFactor = v);
                }),
          ],
        ),
        MainTitleWidget('SelectableText'),
        SelectableText(
          '我是一段可以被选择的Text' * 3,
          showCursor: true,
          cursorWidth: 5,
          cursorColor: Colors.green,
          cursorRadius: Radius.circular(8),
        ),
        SizedBox(height: 50)
      ],
    );
  }
}
